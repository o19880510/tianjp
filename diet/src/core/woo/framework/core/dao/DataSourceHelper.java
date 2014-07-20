package woo.framework.core.dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DataSourceHelper {
	
	private static Logger log	= LoggerFactory.getLogger(DataSourceHelper.class);
	
	public static DataSource get(){
		return DS.ds;
	}
	private static class DS {
		private static DataSource	ds	= null;
		static {
			Context context;
			try {
				context = new InitialContext();// 获得对数据源的引用:
				ds = (DataSource) context.lookup("java:/comp/env/jdbc/diet");
			} catch (NamingException e) {
				log.error("jdbc/diet datasource can not found!", e);
				throw new RuntimeException("jdbc/diet datasource can not found!", e);
			}
		}
	}
}
