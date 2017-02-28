package mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class HelloHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setAttribute("hello", "안녕하세요!");
		return "/jsp/Exam11/mvc/hello.jsp";
	}
}

