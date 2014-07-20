package woo.framework.core.transactional;

import java.sql.Connection;

import javax.sql.DataSource;

public interface ConnectionPool {
	
	public Connection getConnection();
	
	public DataSource getDataSource();
	
}
