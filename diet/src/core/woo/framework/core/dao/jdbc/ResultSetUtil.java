package woo.framework.core.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import woo.framework.core.dao.RowMapper;

public class ResultSetUtil {
	
	private static Logger	log	= LoggerFactory.getLogger(ResultSetUtil.class);
	
	public static Integer getInt(ResultSet rs){
		try {
			if (rs.next()) {
				return rs.getInt(1);
			}
			return null;
		} catch (SQLException e) {
			log.error("ResultSetUtil getInt error!", e);
			throw new RuntimeException("ResultSetUtil getInt error!", e);
		}
	}
	
	
	public static Long getlong(ResultSet rs){
		try {
			if (rs.next()) {
				return rs.getLong(1);
			}
			return null;
		} catch (SQLException e) {
			log.error("ResultSetUtil getlong error!", e);
			throw new RuntimeException("ResultSetUtil getlong error!", e);
		}
	}
	
	public static <T> T getObject(ResultSet rs, RowMapper<T> rowMapper){
		try{
			if (rs.next()) {
				return rowMapper.mapRow(rs, 0);
			}
			return null;
		}catch(Exception e){
			log.error("ResultSetUtil getObject error!", e);
			throw new RuntimeException("ResultSetUtil getObject error!", e);
		}
	}
	
	public static <T> List<T> getList(ResultSet rs, RowMapper<T> rowMapper){
		try{
			List<T> list = new ArrayList<T>();
			
			int i = 0;
			while (rs.next()) {
				list.add(rowMapper.mapRow(rs, i++));
			}
			return list;
		}catch(Exception e){
			log.error("ResultSetUtil getList error!", e);
			throw new RuntimeException("ResultSetUtil getList error!", e);
		}
	}
}
