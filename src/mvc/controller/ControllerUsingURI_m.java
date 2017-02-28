package mvc.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
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
		urlPatterns = "*.su",
		initParams ={ @WebInitParam(
				name="confie"
				,value = "WEB-INF/commandHandlerURI_m.properties"
				)
		
		}
		)

public class ControllerUsingURI_m extends HttpServlet{

	Map mapTable = new HashMap<>();
		
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		
		String initParameter = config.getInitParameter("confie");
		Properties p = new Properties();
		
		
		String confiePath = config.getServletContext().getRealPath(initParameter);
		
		try {
			FileInputStream fis  = new FileInputStream(confiePath);
			
			p.load(fis);
			
			Iterator keyIter = p.keySet().iterator();
			
			
			while(keyIter.hasNext()){
				
				String keyName = (String)keyIter.next();
				
				String obClassName = p.getProperty(keyName);
				
				Class obClass = Class.forName(obClassName);
				Object ob = obClass.newInstance();
				
				
				mapTable.put(keyName, ob);
				
			}
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}//init

	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp)  {
		
			
			String command = req.getRequestURI();
			
			if(command.indexOf(req.getContextPath())==0 ){
				
				command = command.substring(req.getContextPath().length());
				
				
			}
			
			CommandHandler c = (CommandHandler) mapTable.get(command);
			
			if(c == null){
				c = new NullHandler();
			}
			
			
		
			String viewPage = null;
			
			try {
				viewPage = c.process(req, resp);
				RequestDispatcher reqDispatcher = req.getRequestDispatcher(viewPage);
				reqDispatcher.forward(req, resp);
				
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
		
	} //process 메소드 종료
	
}
