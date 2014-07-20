package woo.framework.core.dao.jdbc;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import woo.framework.core.dao.RowMapper;

public class ResultSets {
	
	private static Logger	log	= LoggerFactory.getLogger(ResultSets.class);
	
	private ResultSet rs ;
	
	public ResultSets(ResultSet rs) {
		this.rs = rs;
	}


	public Integer getInt(){
		try {
			if (rs.next()) {
				return rs.getInt(1);
			}
			return null;
		} catch (SQLException e) {
			log.error("ResultSets getInt error!", e);
			throw new RuntimeException("ResultSets getInt error!", e);
		}
	}
	
	
	public Long getlong(){
		try {
			if (rs.next()) {
				return rs.getLong(1);
			}
			return null;
		} catch (SQLException e) {
			log.error("ResultSets getlong error!", e);
			throw new RuntimeException("ResultSets getlong error!", e);
		}
	}
	
	public <T> T getObject(RowMapper<T> rowMapper){
		try{
			if (rs.next()) {
				return rowMapper.mapRow(rs, 0);
			}
			return null;
		}catch(Exception e){
			log.error("ResultSets getObject error!", e);
			throw new RuntimeException("ResultSets getObject error!", e);
		}
	}
	
	public <T> List<T> getList(RowMapper<T> rowMapper){
		try{
			List<T> list = new ArrayList<T>();
			
			int i = 0;
			while (rs.next()) {
				list.add(rowMapper.mapRow(rs, i++));
			}
			return list;
		}catch(Exception e){
			log.error("ResultSets getList error!", e);
			throw new RuntimeException("ResultSets getList error!", e);
		}
	}
	
	public List<Map<String, Object>> getMapList() {
		
		try {
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();  
	        while(rs.next()){  
	        	Map<String, Object> map = getMap(rs);
	            list.add(map);  
	        }
	        return list;
		} catch (SQLException e) {
			log.error("ResultSets getMapList error!", e);
			throw new RuntimeException("ResultSets getMapList error!", e);
		}  
	}
	
	public Map<String, Object> getMap(){
		return getMap(rs);
	}
	
	private Map<String, Object> getMap(ResultSet rs){
		
		try {
			ResultSetMetaData metaData = rs.getMetaData();

			int colCount = metaData.getColumnCount();
			Map<String, Object> map = new HashMap<String, Object>(colCount);
			if (rs.next()) {
				for (int i = 1; i <= colCount; i++) {
					String colName = metaData.getColumnName(i);
					Object colValue = rs.getObject(colName);
					map.put(colName, colValue);
				}
			}
		    return map;  
		} catch (SQLException e) {
			log.error("ResultSets getMap error!", e);
			throw new RuntimeException("ResultSets getMap error!", e);
		}  
	}
	
}
