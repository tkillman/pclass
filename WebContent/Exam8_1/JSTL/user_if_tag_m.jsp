<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<c:if test="${param.age>20}">

20세 이상입니다.

</c:if>

<%=application.getMajorVersion()%>.<%= application.getMinorVersion() %>

</body>
</html>