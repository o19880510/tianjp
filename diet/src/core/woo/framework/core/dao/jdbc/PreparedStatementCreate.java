package woo.framework.core.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;

public interface PreparedStatementCreate {
	public PreparedStatement create(Connection conn, String sql);
}
