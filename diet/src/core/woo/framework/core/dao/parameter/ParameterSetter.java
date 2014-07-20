package woo.framework.core.dao.parameter;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public interface ParameterSetter {
	public boolean isSettable(Object obj);
	public void parameterSet(PreparedStatement pStatement, Object obj, int index)  throws SQLException ;
}
