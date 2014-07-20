package woo.framework.core.dao.jdbc;

import java.sql.PreparedStatement;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import woo.framework.core.dao.parameter.ParameterSetterFactory;

public class ArraySQLParameter implements SQLParameter{
	
	private static Logger	log	= LoggerFactory.getLogger(ArraySQLParameter.class);
	
	private Object[] objs;
	
	public ArraySQLParameter(Object... objs) {
		this.objs = objs;
	}



	@Override
	public void set(PreparedStatement ps) {
		try {
			for (int i = 0; i < objs.length; ++i) {
				ParameterSetterFactory.getInstance().set(ps, objs[i], i + 1);
			}
		} catch (SQLException e) {
			log.error("ArraySQLParameter set error!", e);
			throw new RuntimeException("ArraySQLParameter set error!", e);
		}
	}

}
