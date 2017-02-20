<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

1~100까지 홀수 합

<c:set var="sum" value="0"/>
<c:forEach var="i" begin="1" end="100" step="2">

<c:set var="sum" value="${sum + i}"/>

</c:forEach>

${sum}

<% HashMap mapData = new HashMap();

mapData.put("key", "vale");
mapData.put("key2","value2");

%>

<c:set var="mapData" value="<%=mapData%>"/>

<c:forEach var="mapData1" items="${mapData}">

${mapData1.key}
${mapData1.value}

</c:forEach>











</body>
</html>