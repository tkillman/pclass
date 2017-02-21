
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="mem" class="member.MemberInfo" scope="request"></jsp:useBean>
<jsp:setProperty name="mem" property="email" value="dsjaf@naver.com"/>
<% mem.setAge(34); 
mem.setPassword("비밀번호"); %>

<jsp:forward page="useObject_m.jsp"></jsp:forward>


</body>
</html>