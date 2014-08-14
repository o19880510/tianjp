package woo.diet.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
			
			Map<String, String> behaviorMap = DataManagementHelper.getInstance().getParameterMap().get(ParamConstants.BEHAVIOR_TYPE);
			for(String type : behaviorMap.keySet()){
				List<DietRecord> tempDietRecordList = dietRecordDAO.get(dietMaster.getDay(), type);
				if(AssertHelper.notEmpty(tempDietRecordList)){
					dietRecordList.add(tempDietRecordList);
				}
			}
			
			dietMaster.setDietRecordList(dietRecordList);
		}
		
		request.setAttribute("paginationBean", paginationBean);
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public DietMaster get(LocalDate day) {
		return dietMasterDAO.get(day);
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public List<DietMaster> getAll() {
		return dietMasterDAO.getAll();
	}
}
