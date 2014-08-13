package woo.diet.dao;

import org.springframework.stereotype.Component;


import woo.diet.model.entity.DietRecord;

import com.lutongnet.system.dao.EntityDaoSupport;

@Component("dietRecordDAO")
public class DietRecordDAO extends EntityDaoSupport<DietRecord> {

}
