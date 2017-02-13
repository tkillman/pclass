<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>


<%

String id= request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");

LogonDBBean manager = LogonDBBean.getInstance();

int resultNum =manager.checkUser(id, name, passwd);

if(resultNum==1){
	//out.println("일치하는 회원 존재");
	
	%>
	
	<form action="changePasswd.jsp" method="post">
	변경할 패스워드 : <input type="text" name="passwd"><input type="submit" value="변경">
	</form>
	
	
	
	<%
	
	
	
	
	
	
	
	
	
	
	
}else{
	//out.println(name);
	//out.println("일치하는 회원 없음");
	
	
	
	
	
	
	
	
	
	
	
	
}


%>


</body>
</html>