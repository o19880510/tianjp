package woo.framework.core.dao.jdbc;

import java.sql.PreparedStatement;

public interface SQLParameter {
	public void set(PreparedStatement ps);
}
