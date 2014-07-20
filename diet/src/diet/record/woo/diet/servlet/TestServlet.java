package woo.diet.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import woo.diet.service.DAOTestService;
import woo.framework.core.bean.ServiceBeanFactory;

@WebServlet(urlPatterns = { "/dao" })
public class TestServlet extends HttpServlet {

	private static Logger	log	= LoggerFactory.getLogger(TestServlet.class);
	
	private DAOTestService daoTestService;
	
	public TestServlet(){
		daoTestService = ServiceBeanFactory.getInstance().getBean(DAOTestService.class);
	}
	
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		daoTestService.save();
		daoTestService.getAll();
	}

}
