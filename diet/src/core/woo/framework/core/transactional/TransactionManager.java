package woo.framework.core.transactional;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.function.Consumer;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import woo.framework.core.dao.DataSourceHelper;

public class TransactionManager implements Transaction, ConnectionPool{
	
	private static Logger log	= LoggerFactory.getLogger(TransactionManager.class);

	private static final TransactionManager MANAGER = new TransactionManager();
	
	private DataSource dataSource;
	private TransactionManager(){
		this.dataSource = DataSourceHelper.get();
	}
	
	public static TransactionManager getInstance(){
		return MANAGER;
	}
	
	private Connection getConnectionFromDS(){
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			log.error("TransactionManager getConnectionFromDS error!", e);
			throw new RuntimeException("TransactionManager getConnectionFromDS error!", e);
		}
	}
	private Connection getConnectionWithTransFromDS(){
		try {
			Connection conn =  dataSource.getConnection();
			conn.setAutoCommit(false);
			return conn;
		} catch (SQLException e) {
			log.error("TransactionManager getConnectionWithTransFromDS error!", e);
			throw new RuntimeException("TransactionManager getConnectionWithTransFromDS error!", e);
		}
	}

	@Override
	public Connection setNewTransaction() {
		if( !ThreadLocalMaps.isInit() ){
			ThreadLocalMaps.init();
		}
		Connection conn = getConnectionWithTransFromDS();
		ThreadLocalMaps.set(conn);
		
		return conn;
	}

	@Override
	public Connection setNoTransaction() {
		if( !ThreadLocalMaps.isInit() ){
			ThreadLocalMaps.init();
		}
		Connection conn = getConnectionFromDS();
		ThreadLocalMaps.set(conn);
		
		return conn;
	}
	
	@Override
	public boolean hasConnection() {
		return getConnectionFromThread() == null ? false : true;
	}

	@Override
	public boolean withTransaction() {
		Connection conn = getConnectionFromThread();
		try {
			return !conn.getAutoCommit();
		} catch (SQLException e) {
			log.error("TransactionManager withTransaction error!", e);
		}
		return false;
	}
	
	@Override
	public void commit(){
		close((connection) -> {
			try {
				connection.commit();
			} catch (Exception e) {
				log.error("TransactionManager commit error!", e);
				throw new RuntimeException("TransactionManager commit error!", e);
			}
		});
	}
	
	@Override
	public void rollback(){
		close((connection) -> {
			try {
				connection.rollback();
			} catch (Exception e) {
				log.error("TransactionManager rollback error!", e);
				throw new RuntimeException("TransactionManager rollback error!", e);
			}
		});
	}
	
	@Override
	public void close() {
		this.close(null);
		
	}
	
	
	@Override
	public Connection getConnection() {
		Connection conn = getConnectionFromThread();
		if (conn == null) {
			conn = setNoTransaction();
			ThreadLocalMaps.set(conn);
		}
		return conn;
	}
	
	private Connection getConnectionFromThread() {
		if (!ThreadLocalMaps.isInit()) {
			ThreadLocalMaps.init();
		}
		Connection conn = (Connection) ThreadLocalMaps.get();
		return conn;
	}

	@Override
	public DataSource getDataSource() {
		return this.dataSource;
	}
	
	private void close(Consumer<Connection> consumer){
		try {
			Connection conn = (Connection) ThreadLocalMaps.remove();
			if(conn != null){
				if (!conn.getAutoCommit() && consumer != null) {
					consumer.accept(conn);
				}
				conn.close();
			}
		} catch (SQLException e) {
			throw new RuntimeException("java.sql.connection close() error!", e);
		}
	}

}
