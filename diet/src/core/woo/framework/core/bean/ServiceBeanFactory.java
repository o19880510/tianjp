package woo.framework.core.bean;

import woo.framework.core.proxy.ProxyFactory;
import woo.framework.core.transactional.TransactionalInterceptor;


public class ServiceBeanFactory  extends BeanFactory {
	private static final ServiceBeanFactory FACTORY = new ServiceBeanFactory();
	private ServiceBeanFactory(){
	}
	
	public static ServiceBeanFactory getInstance(){
		return FACTORY;
	}
	
	
	protected <T> T newInstance(Class<T> clazz) {
		return ProxyFactory.createProxyInstance(clazz, new TransactionalInterceptor());
	}
}
