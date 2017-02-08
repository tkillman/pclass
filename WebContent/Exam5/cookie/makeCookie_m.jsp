
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<%

Cookie coockie = new Cookie("kim",URLEncoder.encode("dong","UTF-8"));
response.addCookie(coockie);



%>

생성된 쿠키 이름 : <%=coockie.getName() %> 생성된 쿠키 값 : <%=coockie.getValue() %>

</body>
</html>