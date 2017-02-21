<%@page import="ELEx.Thermometer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%

Thermometer thermometer = new Thermometer();
request.setAttribute("thermometer", thermometer);
session.setAttribute("hah", "hah");

%>


${thermometer.setCelsius("서울",24.5)}

섭씨 : ${thermometer.getCelsius("서울")}

화씨 : ${thermometer.getFahrenheit("서울")}

${thermometer.info} 

${sessionScope.hah}






</body>
</html>