<%@page import="java.util.HashMap"%>
<%@page import="mvjsp.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<% 

Member m = new Member();

HashMap<String , String> map = new HashMap<String , String>();

%>


<c:set var = "mem" value="<%=m%>"/>
<c:set target="${mem}" property="name" value="이름은?"/>

${mem.name}

${map.favor}

<c:set var="map" value="<%= map %>"/>

<c:set target="${map}" property="favor" value="red"/>

${map.favor}


</body>
</html>