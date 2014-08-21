package test.woo.diet.dao;


import java.sql.Time;
import java.util.List;

import javax.annotation.Resource;

import org.joda.time.LocalDate;
import org.joda.time.LocalTime;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Test
	@Transactional(propagation = Propagation.REQUIRED)
	public void save(){
		 
		LocalTime localTime = LocalTime.now();
		System.out.println("localTime:" + localTime);
		
		DietRecord dietRecord = new DietRecord();
		
		dietRecord.setDay(LocalDate.now());
		dietRecord.setTimeStart(localTime);
		dietRecord.setTimeEnd(localTime);
		
		dietRecordDAO.save(dietRecord);
	}
	
	public static void main(String[] args) {
		LocalTime localTime = LocalTime.now();
		Time time = new Time(localTime.getMillisOfDay());
		
		
		
		System.out.println("time.getTimezoneOffset():" + time.getTimezoneOffset());
		System.out.println("time:"+time);
		System.out.println("localTime:"+localTime);
		
		
		System.out.println(localTime.getChronology());
	}
}
