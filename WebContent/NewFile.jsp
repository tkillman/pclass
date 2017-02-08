<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<% session.setAttribute("name", "hello"); %>
<% 

Cookie[] cookies = request.getCookies();


for(Cookie cookie : cookies){
	
	cookie.setMaxAge(3000);
	out.println(cookie.getName());
	out.println(cookie.getValue());
	
}


%>



쿠키 생성
</body>
</html>