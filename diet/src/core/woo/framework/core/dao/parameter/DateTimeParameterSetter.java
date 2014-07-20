package woo.framework.core.dao.parameter;

import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneOffset;

public class DateTimeParameterSetter implements ParameterSetter{

	@Override
	public boolean isSettable(Object obj) {
		return obj instanceof LocalDateTime;
	}

	@Override
	public void parameterSet(PreparedStatement pStatement, Object obj, int index) throws SQLException {
		LocalDateTime date = (LocalDateTime) obj;
		pStatement.setTimestamp(index, Timestamp.from(date.toInstant(ZoneOffset.ofHours(8))));
	}

}
