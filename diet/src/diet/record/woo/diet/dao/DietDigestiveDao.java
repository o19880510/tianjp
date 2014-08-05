package woo.diet.dao;

import java.io.Serializable;
import java.sql.ResultSet;
import java.util.List;

import woo.diet.vo.DietDigestiveValue;
import woo.framework.core.dao.DAOTemplateSupport;
import woo.framework.core.dao.RowMapper;

public class DietDigestiveDao extends DAOTemplateSupport<DietDigestiveValue> {

	private static final String	C_ID			= "ID";
	private static final String	C_SEQ			= "SEQ";
	private static final String	C_TIME			= "TIME";
	private static final String	C_SPECULATION	= "SPECULATION";
	private static final String	TABLE			= "D_DIET_DIGESTIVE";
	
	private static final RowMapper<DietDigestiveValue> ROW_MAPPER = (ResultSet rs, int index) -> {
		DietDigestiveValue dietDigestiveValue = new DietDigestiveValue();
		
		dietDigestiveValue.setId(rs.getInt(C_ID));
		dietDigestiveValue.setSeq(rs.getInt(C_SEQ));
		dietDigestiveValue.setTime(rs.getTime(C_TIME).toLocalTime());
		dietDigestiveValue.setSpeculation(rs.getString(C_SPECULATION));
		
		return dietDigestiveValue;
	};
	
	private static final String SQL_SAVE = "INSERT INTO D_DIET_DIGESTIVE (SEQ, TIME, SPECULATION)"
			+ " VALUES(?,?,?)";
	public void save(DietDigestiveValue dietDigestiveValue){
		Object[] params = {dietDigestiveValue.getSeq(),
				dietDigestiveValue.getTime(),
				dietDigestiveValue.getSpeculation()};
		Serializable key = saveGetKey(SQL_SAVE, params);
		
		dietDigestiveValue.setId((Integer) key);
	}
	
	
	private static final String SQL_QUERY = 
			"SELECT ID, SEQ, TIME, SPECULATION "
			+ "FROM D_DIET_DIGESTIVE "
			+ "WHERE ID = ? AND SEQ = ? ";
	public DietDigestiveValue get(Integer id, Integer seq){
		return queryForObject(ROW_MAPPER, SQL_QUERY, id, seq);
	}
	
	private static final String SQL_QUERY_BY_ID = 
			"SELECT ID, SEQ, TIME, SPECULATION "
			+ "FROM D_DIET_DIGESTIVE "
			+ "WHERE ID = ? ";
	public List<DietDigestiveValue> get(Integer id){
		return queryForList(ROW_MAPPER, SQL_QUERY_BY_ID, id);
	}
	
	private static final String SQL_DELETE_BY_ID = "DELETE FROM D_DIET_DIGESTIVE WHERE ID = ? ";
	public void remove(Integer id){
		remove(SQL_DELETE_BY_ID, id);
	}
	
	private static final String SQL_DELETE = "DELETE FROM D_DIET_DIGESTIVE WHERE ID = ? AND SEQ = ? ";
	public void remove(Integer id, Integer seq){
		remove(SQL_DELETE, id, seq);
	}
	
	private static final String SQL_UPDATE = "UPDATE D_DIET_DIGESTIVE SET TIME = ? , SPECULATION = ? "
			+ "WHERE ID = ? AND SEQ = ? ";
	public void remove(DietDigestiveValue digestiveValue){
		Object[] params = {
				digestiveValue.getTime(),
				digestiveValue.getSpeculation(),
				digestiveValue.getId(),
				digestiveValue.getSeq()
		};
		
		super.saveOrUpdate(SQL_UPDATE, params);
	}
	
	private static final String SQL_QUERY_SEQ = "SELECT MAX(SEQ) FROM D_DIET_DIGESTIVE WHERE ID = ? ";
	public Integer getNextSeq(Integer id ){
		return queryForInt(SQL_QUERY_SEQ, id) + 1;
	}
}
