package woo.framework.core.dao.parameter;

import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;

public class TimeParameterSetter implements ParameterSetter{

	@Override
	public boolean isSettable(Object obj) {
		return obj instanceof LocalTime;
	}

	@Override
	public void parameterSet(PreparedStatement pStatement, Object obj, int index) throws SQLException {
		LocalTime time = (LocalTime) obj;
		pStatement.setTime(index, Time.valueOf(time));
	}
}
