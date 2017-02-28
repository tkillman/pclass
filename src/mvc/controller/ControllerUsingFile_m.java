package mvc.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;



@WebServlet(
		urlPatterns = "/conn",
		initParams = {
				@WebInitParam(
					name="confieFile"
					,value = "WEB-INF/conn.properties"
					)
		}
		)

public class ControllerUsingFile_m extends HttpServlet{

	@Override
	public void init(ServletConfig config) throws ServletException {
		
		Map<String, Object> objectMap = new HashMap(); 
		
		String confieFileString = config.getInitParameter("confieFile");
		
		String confieFilePath = config.getServletContext().getRealPath("confieFileString");
		
		
		try {
			
			Properties p = new Properties();
			
			FileInputStream fis = new FileInputStream(confieFilePath); 
			
			
			p.load(fis);
			
			
			Iterator keyIter = p.keySet().iterator();
			
			
			while(keyIter.hasNext()){
				
				String keyName = (String)keyIter.next();
				
				String objectName = (String) p.getProperty(keyName);
				
				Class objectClass = Class.forName(objectName);
				
				CommandHandler handlerInstance = (CommandHandler) objectClass.newInstance();
				
				objectMap.put(keyName, handlerInstance);
				
			} 
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
			
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		process(req,resp);
		
	}

	protected void process(HttpServletRequest  req, HttpServletResponse resp){
		
		String parameterValue = req.getParameter("cmd");
		
		if(parameterValue ==null){
			CommandHandler handlerInstance = new NullHandler();
		}
		
		
		
		
		
		
		
		
		
		
		
	} //process() 메소드 종료
	

	
	
	
	
	
	
}
