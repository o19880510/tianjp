package woo.diet.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class FListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent paramServletContextEvent) {
		System.out.println("@WebListener ServletContextListener init.... ");
	}

	@Override
	public void contextDestroyed(ServletContextEvent paramServletContextEvent) {
		
	}

}
