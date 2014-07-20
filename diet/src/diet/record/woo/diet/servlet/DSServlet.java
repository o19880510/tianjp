package woo.diet.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.jws.WebService;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.xml.ws.WebServiceProvider;

@WebServlet(urlPatterns= {"/ds"})
public class DSServlet extends HttpServlet {
	 
	 public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		 DataSource ds = null;  
		 try {  
		     Context context = new InitialContext();//获得对数据源的引用:  
		     ds = (DataSource) context.lookup("java:/comp/env/jdbc/diet");  
		     
		     printConnInfo(ds);
		     printConnInfo(ds);
		     printConnInfo(ds);
		     
		     printConnInfoNotClose(ds);
		     printConnInfoNotClose(ds);
		     printConnInfoNotClose(ds);
		 } catch (Exception e) {  
		     e.printStackTrace();  
		 }
		 
		 // System.out.println("DataSource:"+ds);
	 }
	 
	private static void printConnInfo(DataSource ds) throws Exception {
		Connection conn = ds.getConnection();
		System.out.println("Connection:" + conn);
		conn.close();
	}
	
	private static void printConnInfoNotClose(DataSource ds) throws Exception {
		Connection conn = ds.getConnection();
		System.out.println("Connection:" + conn);
	}

}
