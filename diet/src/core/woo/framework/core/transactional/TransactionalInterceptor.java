package woo.framework.core.transactional;

import java.lang.reflect.Method;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

public class TransactionalInterceptor implements MethodInterceptor {
	
	private static Logger log	= LoggerFactory.getLogger(TransactionalInterceptor.class);
	
	@Override
	public Object intercept(Object enhaner, Method method, Object[] params, MethodProxy methodProxy) throws Throwable {
		log.debug("method invoke:" + method.getName());
		Object result = null;
		
		Transactional transaction = (Transactional) method.getAnnotation(woo.framework.core.transactional.Transactional.class);
		
		if(transaction != null){
			Transaction manager = TransactionManager.getInstance();
			Propagation propagation = transaction.propagation();
			
			try{
				
				switch (propagation) {
					case REQUIRED: {
						log.debug("REQUIRED in...");
							boolean needTransaction = !manager.hasConnection() || !manager.withTransaction();
							if(needTransaction){
								manager.setNewTransaction();
							}
							
							result = methodProxy.invokeSuper(enhaner, params);
							
							if(needTransaction){
								manager.commit();
							}
						break;
					}
					case REQUIRES_NEW: {
						log.debug("REQUIRES_NEW in...");
						
						manager.setNewTransaction();
						result = methodProxy.invokeSuper(enhaner, params);
						manager.commit();
						
						break;
					}
					case NOT_SUPPORTED: {
						log.debug("NOT_SUPPORTED in...");
						manager.setNoTransaction();
						result = methodProxy.invokeSuper(enhaner, params);
						manager.close();
						
						break;
					}
				}
				
			}catch(Exception e){
				manager.rollback();
				log.error(propagation + "", e);
			}

		}else{
			try{
				result = methodProxy.invokeSuper(enhaner, params);
			}catch(Exception e){
				throw new RuntimeException(e);
			}
		}
		return result;
	}
}
