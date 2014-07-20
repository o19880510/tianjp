package woo.framework.core.dao.jdbc;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface Execute {
	
	public ResultSet execute(PreparedStatement ps);
}
