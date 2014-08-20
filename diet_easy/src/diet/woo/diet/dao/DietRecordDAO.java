package woo.diet.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import woo.diet.model.entity.DietRecord;

import com.lutongnet.base.util.AssertHelper;
import com.lutongnet.system.dao.EntityDaoSupport;

@Component("dietRecordDAO")
public class DietRecordDAO extends EntityDaoSupport<DietRecord> {
	
	private static final String SQL_QUERY_BY_TYPES = "from DietRecord where masterId=? and type=? order by timeStart ";
	public List<DietRecord> get(Integer masterId, String type){
		return queryList(SQL_QUERY_BY_TYPES, masterId, type);
	}
	
	private static final String SQL_QUERY_BY_2TYPES = "from DietRecord where masterId=?  ";
	public List<DietRecord> get(Integer masterId, String type, String subType){
		
		String hql = SQL_QUERY_BY_2TYPES;
		List<Object> param = new ArrayList<Object>();
		param.add(masterId);
		
		if(AssertHelper.notEmpty(type)){
			hql += "and type=? ";
			param.add(type);
			
			if(AssertHelper.notEmpty(subType)){
				hql += "and subType=? ";
				param.add(subType);
			}
		}
		
		return queryList(hql + " order by timeStart", param);
	}
	
	
	private static final String SQL_REMOVE_BY_ID = "delete from DietRecord where masterId=? ";
	public void remove(Integer masterId){
		update(SQL_REMOVE_BY_ID, masterId);
	}
	
	private static final String SQL_QUERY_BY_MASTER_ID = "from DietRecord where masterId=? order by timeStart ";
	public List<DietRecord> getByMasterId(Integer masterId){
		return queryList(SQL_QUERY_BY_MASTER_ID, masterId);
	}
}
