package mvc.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;


/*@WebServlet(
	 	urlPatterns = "/controllerUsingFile" , 
	 	initParams = {
	 		@WebInitParam (name="configFile",  //초기값 설정
	 		 			  value="WEB-INF/commandHandler.properties")}
	 */
public class ControllerUsingFile extends HttpServlet {

	// <커맨드, 핸들러인스턴스> 매핑 정보 저장
	private Map commandHandlerMap = new java.util.HashMap();

	
	// web.xml에있는 param-value에 config를 받아서 String으로 받음
	
	//ServletConfig 란 초기화 파라미터를 저장하고 있는 객체 
	
	public void init(ServletConfig config) throws ServletException {
		// 결론은 : web.xml > /WEB-INF/commandHandler.properties > prop객체로 옴김

		String configFile = config.getInitParameter("configFile");
		System.out.println(configFile);
		
		Properties prop = new Properties();
		FileInputStream fis = null;
		
		try {
			// 절대경로값을 String으로 받음
			
			//getServletContext() 메소드란??
			
			
			//getRealPath(안에 String 배열), String 값에 맞는 파일 이름인 웹컨테이너에 있는 절대 경로를 알 수 있다.
			//ServletContext application
			
			String configFilePath = config.getServletContext().getRealPath(configFile);
			System.out.println(configFilePath);
			
			fis = new FileInputStream(configFilePath);
			
			prop.load(fis);
			
			
		} catch (IOException e) {
		
			throw new ServletException(e);
		
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException ex) {
				}
		}


		// hello 키값 , hellohanlder 클래스의 객체를 Map에 담았다.
		
		Iterator keyIter = prop.keySet().iterator();
		
		while (keyIter.hasNext()) {
			
			//command의 값은 hello가 된다.
			String command = (String) keyIter.next();
			
			String handlerClassName = prop.getProperty(command);
			
			
			try {
				
				// mvc.command.HelloHandler의 객체가 생성된다.
  				Class handlerClass = Class.forName(handlerClassName);
				
  				//newInstance() 객체 생성 메소드...
				Object handlerInstance = handlerClass.newInstance();
				
				
				//맵 객체에 hello와 mvc.controller.CommandHandler 의 객체를 담았다.
				commandHandlerMap.put(command, handlerInstance);
				
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	} // init 메소드 종료

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		 // command의 값에 request 파라미터 값을 받는다.
		// cmd에 값 즉 키값에 맞는 처리 handler 객체를 불러온다.
		
		
		String command = request.getParameter("cmd");
		CommandHandler handler = (CommandHandler) commandHandlerMap.get(command);
		
		
		if (handler == null) { //만약 cmd에 맞는 handler 객체가 없다면 NullHandler 반환
			handler = new NullHandler();
		}
		
		String viewPage = null;
		
		try {
			
			//handler가 있다면 handler의 process 메소드를 실행시켜 그에 맞는 process를 수행하도록 하고 돌아갈 url을 String 형태로 반환한다.
			viewPage = handler.process(request, response);
			
		} catch (Throwable e) {
			throw new ServletException(e);
		}

		//수행 처리 결과로 설정해 둔 viewPage로 돌아간다.
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}

