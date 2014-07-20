package woo.framework.core.dao.jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SaveOrUpdate implements Execute{
	
	private static Logger	log	= LoggerFactory.getLogger(SaveOrUpdate.class);
	
	@Override
	public ResultSet execute(PreparedStatement ps) {
		try {
			ps.executeUpdate();
		} catch (SQLException e) {
			log.error("SaveOrUpdate execute error!", e);
			throw new RuntimeException("SaveOrUpdate execute error!", e);
		}
		return null;
	}

}
