package woo.framework.core.dao.parameter;

import java.sql.Date;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

public class DateParameterSetter implements ParameterSetter{

	@Override
	public boolean isSettable(Object obj) {
		return obj instanceof LocalDate;
	}

	@Override
	public void parameterSet(PreparedStatement pStatement, Object obj, int index) throws SQLException {
		LocalDate date = (LocalDate) obj;
		pStatement.setDate(index, Date.valueOf(date));
	}
}
