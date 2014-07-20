package woo.diet.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns= {"/first"})
@MultipartConfig
public class FServlet extends HttpServlet {
	 
	 public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 System.out.println("first FServlet service:" + this.toString());
	 }

}
