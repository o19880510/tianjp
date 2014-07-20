package woo.framework.core.proxy;

import net.sf.cglib.proxy.Callback;
import net.sf.cglib.proxy.Enhancer;

public class ProxyFactory {
	
	public static <T> T createProxyInstance(Class<T> clazz, Callback callback) {

		Enhancer enhancer = new Enhancer();
		enhancer.setSuperclass(clazz);
		enhancer.setCallback(callback);

		return (T)enhancer.create();
	}
}
