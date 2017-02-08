<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%

Cookie[] cookies = request.getCookies();

if(cookies!=null && cookies.length>0){
for(Cookie cookie : cookies){
	
	if(cookie.getName().equals("name")){
		
		Cookie cookieM = new Cookie("name","modifyCookie");
		response.addCookie(cookieM);
		
	}
	
	
}
}

%>



</body>
</html>