package woo.framework.core.dao.jdbc;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import woo.framework.core.dao.parameter.ParameterSetterFactory;

public class ListSQLParameter implements SQLParameter{
	
	private static Logger	log	= LoggerFactory.getLogger(ListSQLParameter.class);
	
	private List<Object> list;
	
	public ListSQLParameter(List<Object> list) {
		this.list = list;
	}



	@Override
	public void set(PreparedStatement ps) {
		try {
			for (int i = 0; i < list.size(); ++i) {
				ParameterSetterFactory.getInstance().set(ps, list.get(i), i + 1);
			}
		} catch (SQLException e) {
			log.error("ListSQLParameter set error!", e);
			throw new RuntimeException("ListSQLParameter set error!", e);
		}
	}

}
