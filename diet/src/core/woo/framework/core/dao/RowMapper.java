package woo.framework.core.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface RowMapper<T> {
	public T mapRow(ResultSet rs, int index) throws SQLException ;
}
