<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="mem" class="member.MemberInfo" scope="request"></jsp:useBean>
나이 :<%= mem.getAge() %> 비밀번호 : <%= mem.getPassword()%>
이메일:<jsp:getProperty name="mem" property="email"/>

</body>
</html>