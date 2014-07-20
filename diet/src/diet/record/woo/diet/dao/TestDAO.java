package woo.diet.dao;

import java.sql.ResultSet;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import woo.diet.vo.TestValue;
import woo.framework.core.dao.DAOTemplateSupport;
import woo.framework.core.dao.RowMapper;

public class TestDAO extends DAOTemplateSupport<TestValue>{
	
	private static Logger log	= LoggerFactory.getLogger(TestDAO.class);
	
	private static final String	C_NAME	= "NAME";
	private static final String	C_AGE	= "AGE";
	private static final String	C_BDATE	= "BDATE";
	
	private static final RowMapper<TestValue> ROW_MAPPER = (ResultSet rs, int index) -> {
		TestValue testValue = new TestValue();
		testValue.setName(rs.getString(C_NAME));
		testValue.setAge(rs.getInt(C_AGE));
		testValue.setDate(rs.getTimestamp(C_BDATE).toLocalDateTime());
		return testValue;
	};
	
	private static final String SQL_SAVE = "INSERT INTO TEST(NAME, AGE, BDATE) VALUES ( ?, ?, ?)";
	public void save(TestValue testValue){
		Object[] params = {testValue.getName(), testValue.getAge(), testValue.getDate()};
		saveOrUpdate(SQL_SAVE, params);
	}
	
	private static final String SQL_ALL = "SELECT NAME, AGE, BDATE FROM TEST ";
	public List<TestValue> getAll(){
		return queryForList(ROW_MAPPER, SQL_ALL);
	}

}
