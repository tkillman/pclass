<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="member.MemberInfo" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>

아이디:<jsp:getProperty property="id" name="member"/><br>
 
비밀번호 :<br>
이름:<jsp:getProperty property="name" name="member"/><br>
이메일 : <jsp:getProperty property="email" name="member"/><br>
나이 : <jsp:getProperty property="age" name="member"/><br>






</body>
</html>