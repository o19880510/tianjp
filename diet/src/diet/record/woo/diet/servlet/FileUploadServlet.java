package woo.diet.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = { "/file" })
@MultipartConfig(location = "/home/tianjp/D/")

public class FileUploadServlet extends HttpServlet {
	
	static final String HTML = 
			"<form action='file' method='post' enctype='multipart/form-data'>" +
			"	<input type='file' name='file' /><br>" +
			"	<input type='submit' value='submit' />" +
			"</form>" ;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter(); 
		out.print(HTML);
		out.flush();
	};
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException ,IOException {
		
		Part file = req.getPart("file");
		
		System.out.println(file.getName());
		System.out.println(file.getSize());
		
		file.getHeaderNames().forEach( s -> System.out.println(s) );
		//		file.write("/home/tianjp/D/XX.jpg");
//		File newFile = new File("/home/tianjp/D/");
		
	};
	

}
