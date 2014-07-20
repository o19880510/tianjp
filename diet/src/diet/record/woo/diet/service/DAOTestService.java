package woo.diet.service;

import java.time.LocalDateTime;

import javax.management.RuntimeErrorException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import woo.diet.dao.TestDAO;
import woo.diet.vo.TestValue;
import woo.framework.core.bean.DAOBeanFactory;
import woo.framework.core.dao.parameter.ParameterSetterFactory;
import woo.framework.core.transactional.Propagation;
import woo.framework.core.transactional.Transactional;

public class DAOTestService {
	private static Logger log	= LoggerFactory.getLogger(DAOTestService.class);
	
	private TestDAO testDAO;
	public DAOTestService(){
		testDAO = DAOBeanFactory.getInstance().getBean(TestDAO.class);
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void save(){
		
		log.debug("DAOTestService save..");
		TestValue testValue = new TestValue();

		testValue.setName("woo");
		testValue.setAge(50);
		
		testValue.setDate(LocalDateTime.now());

		testDAO.save(testValue);
		testDAO.save(testValue);
		
		log.debug("useCount:"+ParameterSetterFactory.useCount());
		
		save2();
	}
	
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void save2(){
		
		log.debug("DAOTestService save2..");
		TestValue testValue = new TestValue();

		testValue.setName("woo");
		testValue.setAge(50);
		testValue.setDate(LocalDateTime.now());

		testDAO.save(testValue);
		testDAO.save(testValue);
		
		log.debug("save2 useCount:"+ParameterSetterFactory.useCount());
		throw new RuntimeException("save2 test!");
	}
	
	public void getAll(){
		log.debug("dao getAll:"+testDAO.getAll());
	}
}
