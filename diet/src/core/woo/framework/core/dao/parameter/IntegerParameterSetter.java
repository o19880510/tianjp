package woo.framework.core.dao.parameter;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class IntegerParameterSetter implements ParameterSetter{

	@Override
	public boolean isSettable(Object obj) {
		return obj instanceof Integer;
	}

	@Override
	public void parameterSet(PreparedStatement pStatement, Object obj, int index) throws SQLException {
		Integer int_ = (Integer) obj;
		pStatement.setInt(index, int_);
	}

}
