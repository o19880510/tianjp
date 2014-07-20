package woo.framework.core.dao.parameter;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LongParameterSetter implements ParameterSetter{

	@Override
	public boolean isSettable(Object obj) {
		return obj instanceof Long;
	}

	@Override
	public void parameterSet(PreparedStatement pStatement, Object obj, int index) throws SQLException {
		Long long_ = (Long) obj;
		pStatement.setLong(index, long_);
	}

}
