package woo.framework.core.bean;

public class DAOBeanFactory extends BeanFactory{
	private static final DAOBeanFactory FACTORY = new DAOBeanFactory();
	private DAOBeanFactory(){
		
	}
	
	public static DAOBeanFactory getInstance(){
		return FACTORY;
	}
}
