package woo.framework.core.dao.jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SaveGetKey implements Execute{
	
	private static Logger	log	= LoggerFactory.getLogger(SaveGetKey.class);
	
	@Override
	public ResultSet execute(PreparedStatement ps) {
		try {
			ps.executeUpdate();
			return ps.getGeneratedKeys();
		} catch (SQLException e) {
			log.error("SaveGetKey execute error!", e);
			throw new RuntimeException("SaveGetKey execute error!", e);
		}
	}

}
