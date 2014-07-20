package woo.framework.core.dao.parameter;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StringParameterSetter implements ParameterSetter{

	@Override
	public boolean isSettable(Object obj) {
		return obj instanceof String;
	}

	@Override
	public void parameterSet(PreparedStatement pStatement, Object obj, int index) throws SQLException {
		String str = (String) obj;
		pStatement.setString(index, str);
	}

}
