package test.woo.diet.dao;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import woo.diet.dao.DietRecordDAO;
import woo.diet.model.entity.DietRecord;

@RunWith ( SpringJUnit4ClassRunner.class )
@ContextConfiguration ( locations = "/root-context.xml" )
public class DietRecordDAOTest {
	
	@Resource(name = "dietRecordDAO")
	private DietRecordDAO	dietRecordDAO;
	
	
	@Test
	public void getAll(){
		
		List<DietRecord> dietRecordList = dietRecordDAO.getAll();
		
		System.out.println(dietRecordList);
	}
	
}
