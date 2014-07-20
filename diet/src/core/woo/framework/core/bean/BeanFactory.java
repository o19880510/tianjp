package woo.framework.core.bean;

import java.util.HashMap;
import java.util.Map;

public class BeanFactory {
	private Map<Class, Object> map = new HashMap();
	
	public BeanFactory(){
		
	}
	
	public <T> T getBean(Class<T> clazz){
		synchronized(clazz){
			T obj = (T)map.get(clazz);
			if(obj == null){
				obj = newInstance(clazz);
				map.put(clazz, obj);
			}
			return obj;
		}
	}
	
	protected <T> T newInstance(Class<T> clazz) {
		try {
			return clazz.newInstance();
		} catch (InstantiationException | IllegalAccessException e) {
			throw new RuntimeException("New instance error, class : " + clazz, e);
		}
	}
}
