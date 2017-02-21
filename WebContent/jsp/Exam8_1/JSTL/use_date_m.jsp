<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<fmt:formatDate var="now" value="<%=new Date() %>"/>

<fmt:formatDate var="now" value="<%=new Date() %>" type="both"/>

${now }


<fmt:parseDate var="date" value="2017-04-22 23:00:01" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>

${date}



</body>
</html>