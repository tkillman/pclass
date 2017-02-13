<%@page import="logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%

LogonDBBean manager = LogonDBBean.getInstance();

String id= (String)session.getAttribute("memId");
String passwd= request.getParameter("passwd");

int resultNum = manager.changePasswd(id, passwd);


if(resultNum ==1){
	out.println("회원비밀번호가 수정되었습니다.");
	
}else{
	
	out.println("회원비밀번호 수정에 문제가 발생했습니다.");
	
}



%>




</body>
</html>