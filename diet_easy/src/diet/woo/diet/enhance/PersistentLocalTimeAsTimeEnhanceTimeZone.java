package woo.diet.enhance;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

import org.hibernate.HibernateException;
import org.hibernate.type.StandardBasicTypes;
import org.joda.time.LocalTime;
import org.joda.time.contrib.hibernate.PersistentLocalTimeAsTime;

public class PersistentLocalTimeAsTimeEnhanceTimeZone extends PersistentLocalTimeAsTime {

	@Override
	public Object nullSafeGet(ResultSet paramResultSet, String paramString) throws SQLException {
		Object localObject = StandardBasicTypes.TIME.nullSafeGet(paramResultSet, paramString);
		if (localObject == null) {
			return null;
		}

		return new LocalTime(localObject);
	}

	@Override
	public void nullSafeSet(PreparedStatement paramPreparedStatement, Object paramObject, int paramInt)
			throws HibernateException, SQLException {
		if (paramObject == null) {
			StandardBasicTypes.TIME.nullSafeSet(paramPreparedStatement, null, paramInt);
		} else {
			LocalTime localLocalTime = (LocalTime) paramObject;
			Time localTime = new Time(localLocalTime.getHourOfDay(), localLocalTime.getMinuteOfHour(), localLocalTime.getSecondOfMinute());
			StandardBasicTypes.TIME.nullSafeSet(paramPreparedStatement, localTime, paramInt);
		}
	}
}
