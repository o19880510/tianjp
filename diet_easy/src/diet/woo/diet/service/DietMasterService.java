package woo.diet.service;

import java.util.List;

import javax.annotation.Resource;

import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import woo.diet.dao.DietMasterDAO;
import woo.diet.model.entity.DietMaster;

@Service("dietMasterService")
@Transactional
public class DietMasterService {

	@Resource(name = "dietMasterDAO")
	private DietMasterDAO	dietMasterDAO;

	@Transactional(propagation = Propagation.REQUIRED)
	public void save(DietMaster dietMaster) {
		dietMasterDAO.save(dietMaster);
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
