<%@page import="day0220.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<% 
	Member m = new Member();
    m.setName("이름1");
   
%>

<c:set var="m" value="<%=m%>"/>

<c:set var="name" value="#{m.name}"/>


${name}

<%m.setName("이름2"); %>

${name}

</body>
</html>