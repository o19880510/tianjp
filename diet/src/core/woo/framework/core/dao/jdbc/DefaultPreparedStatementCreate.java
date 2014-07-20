package woo.framework.core.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DefaultPreparedStatementCreate implements PreparedStatementCreate {

	private static Logger	log	= LoggerFactory.getLogger(DefaultPreparedStatementCreate.class);

	public PreparedStatement create(Connection conn, String sql) {
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
		} catch (SQLException e) {
			log.debug("PrepareStatement create", e);
			throw new RuntimeException("PrepareStatement create", e);
		}
		return ps;
	}
}
