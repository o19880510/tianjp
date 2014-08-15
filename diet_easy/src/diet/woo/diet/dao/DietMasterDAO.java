package woo.diet.dao;

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
		
		String hql = "where userId = ? order by day desc";
		
		return super.findByPaging(hql, new Object[]{userId}, dietReq.getCurrent(), dietReq.getPageSize());
	}
	
}
