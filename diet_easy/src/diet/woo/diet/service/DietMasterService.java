package woo.diet.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lutongnet.base.model.vo.PaginationBean;
import com.lutongnet.base.util.AssertHelper;
import com.lutongnet.system.constant.AppConstant;
import com.lutongnet.system.data.center.DataManagementHelper;

import woo.diet.constants.ParamConstants;
import woo.diet.dao.DietMasterDAO;
import woo.diet.dao.DietRecordDAO;
import woo.diet.model.entity.DietMaster;
import woo.diet.model.entity.DietRecord;
import woo.diet.model.request.DietReq;
import woo.diet.model.request.NewDietReq;

@Service("dietMasterService")
@Transactional
public class DietMasterService {

	@Resource(name = "dietMasterDAO")
	private DietMasterDAO	dietMasterDAO;
	
	@Resource(name = "dietRecordDAO")
	private DietRecordDAO	dietRecordDAO;

	@Transactional(propagation = Propagation.REQUIRED)
	public void getList(HttpServletRequest request, DietReq dietReq) {
		String userId = (String) request.getSession().getAttribute(AppConstant.USER_ID);
		PaginationBean<DietMaster> paginationBean = dietMasterDAO.paging(userId, dietReq);
		
		for(DietMaster dietMaster : paginationBean.getDataList()){
			
			List<List<DietRecord>> dietRecordList = new ArrayList<List<DietRecord>>();
			
			String type = dietReq.getType();
			if(AssertHelper.isEmpty(type)){
				Map<String, String> behaviorMap = DataManagementHelper.getInstance().getParameterMap().get(ParamConstants.BEHAVIOR_TYPE);
				for(String bType : behaviorMap.keySet()){
					List<DietRecord> tempDietRecordList = dietRecordDAO.get(dietMaster.getId(), bType);
					if(AssertHelper.notEmpty(tempDietRecordList)){
						dietRecordList.add(tempDietRecordList);
					}
				}
			}else{
				String subType = dietReq.getSubType();
				List<DietRecord> tempDietRecordList = dietRecordDAO.get(dietMaster.getId(), type, subType);
				if(AssertHelper.notEmpty(tempDietRecordList)){
					dietRecordList.add(tempDietRecordList);
				}
			}
			
			dietMaster.setDietRecordList(dietRecordList);
		}
		
		request.setAttribute("paginationBean", paginationBean);
	}
	
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void save(HttpServletRequest request, NewDietReq newDietReq) {
		String userId = (String) request.getSession().getAttribute(AppConstant.USER_ID);
		
		DietMaster dietMaster = new DietMaster();
		
		dietMaster.setUserId(userId);
		dietMaster.setDay(newDietReq.getDay());
		dietMaster.setCity(newDietReq.getCity());
		dietMaster.setWeather(newDietReq.getWeather());
		dietMaster.setTemperature(newDietReq.getTemperature());
		dietMaster.setYear(newDietReq.getDay().getYear());
		dietMaster.setMonth(newDietReq.getDay().getMonthOfYear());
		dietMasterDAO.save(dietMaster);
		
		
		for(NewDietReq.Record record : newDietReq.getItems()){
			newDietRecord(dietMaster.getId(), newDietReq.getDay(), record);
		}
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void remove(Integer id){
		dietMasterDAO.remove(id);
		dietRecordDAO.remove(id);
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void modifyBefore(HttpServletRequest request, Integer id){
		
		DietMaster dietMaster = dietMasterDAO.get(id);
		List<DietRecord> dietRecordList = dietRecordDAO.getByMasterId(id);
		
		request.setAttribute("dietMaster", dietMaster);
		request.setAttribute("dietRecordList", dietRecordList);
	}
	
	
	/**
	 * 更新：饮食记录数据
	 * 		DietMaster 只更新关键字段
	 * 		DietRecord 更新策略：
	 * 		1、若DietRecord.id 存在，则更新
	 * 		2、若DietRecord.id 不存在，则新增
	 * 		3、若上送的数据中没有DietRecord记录，则删除
	 * 
	 * @param request
	 * @param newDietReq
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	public void modify(HttpServletRequest request, NewDietReq newDietReq){
		Integer masterId = newDietReq.getId();
		LocalDate day = newDietReq.getDay();
		
		DietMaster dietMaster = dietMasterDAO.get(masterId);
		dietMaster.setDay(day);
		dietMaster.setYear(day.getYear());
		dietMaster.setMonth(day.getMonthOfYear());
		dietMaster.setCity(newDietReq.getCity());
		dietMaster.setWeather(newDietReq.getWeather());
		dietMaster.setTemperature(newDietReq.getTemperature());
		dietMasterDAO.update(dietMaster);
		
		// 从数据库中获取所有DietRecord数据
		List<DietRecord> dbDietRecordList = dietRecordDAO.getByMasterId(masterId);
		for(NewDietReq.Record record : newDietReq.getItems()){
			Integer recordId = record.getId();
			
			// 若数据库中存在对应记录，更新
			if (recordId != null) {
				int index = dbDietRecordList.indexOf(new DietRecord(record.getId()));
				DietRecord dbDietRecord = dbDietRecordList.get(index);
				if(dbDietRecord != null){
					
					dbDietRecord.setDay(day);
					dbDietRecord.setType(record.getType());
					dbDietRecord.setSubType(record.getSubType());;
					dbDietRecord.setTimeStart(record.getTimeStart());
					dbDietRecord.setTimeEnd(record.getTimeEnd());
					dbDietRecord.setDesc(record.getDesc());
					
					dietRecordDAO.update(dbDietRecord);
					dbDietRecordList.remove(index);
					continue;
				}
			}
			
			// 若数据库中不存在对应记录，新增
			newDietRecord(masterId, day, record);
		}
		
		// 上送数据中不包含的记录，统统删除
		for(DietRecord deleteRecord : dbDietRecordList){
			dietRecordDAO.remove(deleteRecord);
		}
	}
	
	private void newDietRecord(Integer masterId, LocalDate day, NewDietReq.Record record){
		DietRecord dietRecord = new DietRecord();
		
		dietRecord.setMasterId(masterId);
		dietRecord.setDay(day);
		dietRecord.setType(record.getType());
		dietRecord.setSubType(record.getSubType());
		dietRecord.setTimeStart(record.getTimeStart());
		dietRecord.setTimeEnd(record.getTimeEnd());
		dietRecord.setDesc(record.getDesc());
		dietRecord.setTxnDate(DateTime.now());
		
		dietRecordDAO.save(dietRecord);
	}
}
