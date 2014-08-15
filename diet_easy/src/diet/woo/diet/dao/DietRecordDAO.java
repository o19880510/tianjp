package woo.diet.dao;

import java.util.List;

import org.joda.time.LocalDate;
import org.springframework.stereotype.Component;

import woo.diet.model.entity.DietRecord;

import com.lutongnet.system.dao.EntityDaoSupport;

@Component("dietRecordDAO")
public class DietRecordDAO extends EntityDaoSupport<DietRecord> {
	
	private static final String SQL_QUERY_BY_TYPES = "from DietRecord where day=? and type=? order by timeStart ";
	public List<DietRecord> get(LocalDate day, String type){
		return queryList(SQL_QUERY_BY_TYPES, day, type);
	}
}
