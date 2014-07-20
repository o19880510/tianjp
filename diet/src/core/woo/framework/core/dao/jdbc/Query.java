package woo.framework.core.dao.jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Query implements Execute{
	
	private static Logger	log	= LoggerFactory.getLogger(Query.class);
	
	@Override
	public ResultSet execute(PreparedStatement ps) {
		try {
			return ps.executeQuery();
		} catch (SQLException e) {
			log.error("Query execute error!", e);
			throw new RuntimeException("Query execute error!", e);
		}
	}

}
