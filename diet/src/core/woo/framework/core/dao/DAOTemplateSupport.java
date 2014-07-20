package woo.framework.core.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

import woo.framework.core.dao.jdbc.ArraySQLParameter;
import woo.framework.core.dao.jdbc.DefaultPreparedStatementCreate;
import woo.framework.core.dao.jdbc.EmptySQLParameter;
import woo.framework.core.dao.jdbc.Execute;
import woo.framework.core.dao.jdbc.ListSQLParameter;
import woo.framework.core.dao.jdbc.PreparedStatementCreate;
import woo.framework.core.dao.jdbc.Query;
import woo.framework.core.dao.jdbc.ResultSets;
import woo.framework.core.dao.jdbc.SQLParameter;
import woo.framework.core.dao.jdbc.SaveGetKey;
import woo.framework.core.dao.jdbc.SaveOrUpdate;
import woo.framework.core.transactional.ConnectionPool;
import woo.framework.core.transactional.Transaction;
import woo.framework.core.transactional.TransactionManager;

public class DAOTemplateSupport<T> {
	protected static final PreparedStatementCreate	PS_CREATE		= new DefaultPreparedStatementCreate();

	protected static final Execute					SAVE_UPDATE		= new SaveOrUpdate();
	protected static final Execute					SAVE_GET_KEY	= new SaveGetKey();
	protected static final Execute					QUERY			= new Query();

	protected static final SQLParameter				EMPTY			= new EmptySQLParameter();

	protected Connection getConnection() {
		ConnectionPool manager = TransactionManager.getInstance();
		return manager.getConnection();
	}
	
	private ResultSets query(String sql, SQLParameter sqlParameter, Execute execute) {
		PreparedStatement pStatement = PS_CREATE.create(getConnection(), sql);
		sqlParameter.set(pStatement);
		ResultSet rs = execute.execute(pStatement);
		return new ResultSets(rs);
	}
	
	private static final String COUNT_HEAD = " select count(*) ";
	protected PaginationBean<T> paging(String sql, List<Object> params,RowMapper<T> rowMapper, int currentPage, int pageSize){
		
		String countSql = COUNT_HEAD + getSqlFrom(sql);
		int recordCount = this.queryForInt(countSql, params);
		PaginationBean<T> pb = new PaginationBean<T>(currentPage, pageSize, recordCount);
		
		String pagingSql = sql + " limit " + pb.getRecordIndex() + ", " + pageSize;
		List<T> dataList = queryForList(rowMapper, pagingSql, params);
		
		return pb.setDataList(dataList);
	}
	
	protected PaginationBean<T> paging(String sql, Object[] params,RowMapper<T> rowMapper, int currentPage, int pageSize){
		
		String countSql = COUNT_HEAD + getSqlFrom(sql);
		int recordCount = this.queryForInt(countSql, params);
		PaginationBean<T> pb = new PaginationBean<T>(currentPage, pageSize, recordCount);
		
		String pagingSql = sql + " limit " + pb.getRecordIndex() + ", " + pageSize;
		List<T> dataList = queryForList(rowMapper, pagingSql, params);
		
		return pb.setDataList(dataList);
	}
	
	private String getSqlFrom(String sql){
		int index = sql.toLowerCase().indexOf("from");
		return sql.substring(index);
	}
	
	
	
	/**
	 * 查询一堆对象
	 */
	protected List<T> queryForList(RowMapper<T> rowMapper, String sql, Object... params){
		return query(sql, new ArraySQLParameter(params), QUERY).getList(rowMapper);
	}
	
	protected List<T> queryForList(RowMapper<T> rowMapper, String sql, List params){
		return query(sql, new ListSQLParameter(params), QUERY).getList(rowMapper);
	}
	
	protected List<T> queryForList(RowMapper<T> rowMapper, String sql){
		return query(sql, EMPTY, QUERY).getList(rowMapper);
	}
	
	
	/**
	 * 查询单个对象
	 */
	protected T queryForObject(RowMapper<T> rowMapper, String sql, Object... params){
		return query(sql, new ArraySQLParameter(params), QUERY).getObject(rowMapper);
	}
	
	protected T queryForObject(RowMapper<T> rowMapper, String sql, List params){
		return query(sql, new ListSQLParameter(params), QUERY).getObject(rowMapper);
	}
	
	protected T queryForObject(RowMapper<T> rowMapper, String sql){
		return query(sql, EMPTY, QUERY).getObject(rowMapper);
	}
	
	
	protected int queryForInt(String sql){
		return query(sql, EMPTY, QUERY).getInt();
	}
	protected int queryForInt(String sql, Object... params){
		return query(sql, new ArraySQLParameter(params), QUERY).getInt();
	}
	protected int queryForInt(String sql, List<Object> params){
		return query(sql, new ListSQLParameter(params), QUERY).getInt();
	}
	
	
	protected Map<String, Object> queryForMap(String sql, Object... params){
		return query(sql, new ArraySQLParameter(params), QUERY).getMap();
	}
	protected Map<String, Object> queryForMap(String sql){
		return query(sql, EMPTY, QUERY).getMap();
	}
	
	protected List<Map<String, Object>> queryForListMap(String sql, Object... params){
		return query(sql, new ArraySQLParameter(params), QUERY).getMapList();
	}
	protected List<Map<String, Object>> queryForListMap(String sql ){
		return query(sql, EMPTY, QUERY).getMapList();
	}
	
	protected void saveOrUpdate(String sql){
		query(sql, EMPTY, SAVE_UPDATE);
	}
	protected void saveOrUpdate(String sql, Object... params){
		query(sql, new ArraySQLParameter(params), SAVE_UPDATE);
	}

	protected Serializable saveGetKey(String sql){
		return query(sql, EMPTY, SAVE_GET_KEY).getlong();
	}
	protected Serializable saveGetKey(String sql, Object... params){
		return query(sql, new ArraySQLParameter(params), SAVE_GET_KEY).getlong();
	}
}
