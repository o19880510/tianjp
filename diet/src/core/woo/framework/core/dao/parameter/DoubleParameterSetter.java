package woo.framework.core.dao.parameter;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DoubleParameterSetter implements ParameterSetter{

	@Override
	public boolean isSettable(Object obj) {
		return obj instanceof Double;
	}

	@Override
	public void parameterSet(PreparedStatement pStatement, Object obj, int index) throws SQLException {
		Double double_ = (Double) obj;
		pStatement.setDouble(index, double_);
	}

}
