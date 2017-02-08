<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%


Cookie[] cookies = request.getCookies();


for(Cookie cookie : cookies){
	
	String cookieName = cookie.getName();
	String cookieValue = cookie.getValue();
	
	out.println(cookieName);
	out.println();
	out.println(URLDecoder.decode(cookieValue,"UTF-8"));
	
}



%>


</body>
</html>