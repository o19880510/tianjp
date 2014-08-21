package woo.diet.dao;

import java.util.ArrayList;

import java.util.List;

import org.joda.time.LocalDate;
import org.springframework.stereotype.Component;

import woo.diet.model.entity.DietMaster;
import woo.diet.model.request.DietReq;

import com.lutongnet.base.model.vo.PaginationBean;
import com.lutongnet.system.dao.EntityDaoSupport;

@Component("dietMasterDAO")
public class DietMasterDAO extends EntityDaoSupport<DietMaster> {
	
	public PaginationBean<DietMaster> paging(String userId, DietReq dietReq){
		assert userId != null;
		assert dietReq != null;
		
		LocalDate startDate = dietReq.getStartDate();
		LocalDate endDate = dietReq.getEndDate();
		
		String hql = "where userId = ? ";
		List<Object> param =new ArrayList<Object>();
		param.add(userId);
		
 		if(startDate != null){
			hql += "and day >= ? ";
			param.add(startDate);
		}
		
 		if(endDate != null){
			hql += "and day <= ? ";
			param.add(endDate);
		}
 		
 		hql += "order by day desc";
		
		return super.findByPaging(hql, param, dietReq.getCurrent(), dietReq.getPageSize());
	}
	
}
