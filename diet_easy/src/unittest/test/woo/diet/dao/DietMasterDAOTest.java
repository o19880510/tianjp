package test.woo.diet.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.joda.time.DateTime;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import woo.diet.dao.DietMasterDAO;
import woo.diet.model.entity.DietMaster;
import woo.diet.model.entity.DietRecord;
import woo.diet.service.DietMasterService;

@RunWith ( SpringJUnit4ClassRunner.class )
@ContextConfiguration ( locations = "/root-context.xml" )
public class DietMasterDAOTest {
	
//	@Resource(name = "dietMasterService")
//	private DietMasterService dietMasterService;
	
	@Resource(name = "dietMasterDAO")
	private DietMasterDAO	dietMasterDAO;
	
	@Test
	public void saveSingle(){
		DateTime day = DateTime.now().plusDays(1);
		DietMaster dietMaster = new DietMaster();
		
		dietMaster.setDay(day.toLocalDate());
		dietMaster.setMonth(day.getMonthOfYear());
		dietMaster.setYear(day.getYear());
		dietMaster.setUserId("1");
		dietMasterDAO.save(dietMaster);
	}
	
	
	@Test
	public void saveMore(){
		DateTime day = DateTime.now();
		DietMaster dietMaster = new DietMaster();
		
		dietMaster.setDay(day.toLocalDate());
		dietMaster.setMonth(day.getMonthOfYear());
		dietMaster.setYear(day.getYear());
		dietMaster.setUserId("1");
		
//		List<DietRecord> list = createDietRecordList(day);
//		dietMaster.setDietRecordList(list);
		
		dietMasterDAO.save(dietMaster);
	}
	
	private List<DietRecord> createDietRecordList(DateTime day){
		
		List<DietRecord> list = new ArrayList<DietRecord>();
		for(int i = 0; i < 3; i++){
			DietRecord dietRecord = new DietRecord();
			dietRecord.setDay(day.toLocalDate());
			dietRecord.setTxnDate(day);
			dietRecord.setDesc("test desc"+i);
			dietRecord.setType("food");
			dietRecord.setSubType("breakfast");
			dietRecord.setTimeStart(day.toLocalTime());
			dietRecord.setTimeEnd(day.toLocalTime());
			
			list.add(dietRecord);
		}
		
		return list;
	}
	
	
	@Test
	public void get(){
		DateTime day = DateTime.now().plusDays(-1);

		DietMaster dietMaster = dietMasterDAO.get(day.toLocalDate());
		
		System.out.println(dietMaster);
		System.out.println(dietMaster.getDietRecordList().size());
	}
	
	
	@Test
	public void getAll(){
		
		List<DietMaster> dietMasterList = dietMasterDAO.getAll();
		
		System.out.println(dietMasterList);
	}
	
}
