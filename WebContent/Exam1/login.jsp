<%@page import="javax.xml.ws.Dispatch"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("memberId");
	String name = request.getParameter("name");

	if (id != null && id.equals("abc")) {
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		
		request.setAttribute("name", name);
		
		rd.forward(request, response);
				
	
		
	} else {
%>
<html>
<head><title>로그인에 실패</title></head>
<body>
잘못된 아이디입니다.
</body>
</html>
<% } %>