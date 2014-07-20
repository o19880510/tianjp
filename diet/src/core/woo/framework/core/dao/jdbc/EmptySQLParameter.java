package woo.framework.core.dao.jdbc;

import java.sql.PreparedStatement;

public class EmptySQLParameter implements SQLParameter{

	@Override
	public void set(PreparedStatement ps) {
	}

}
