<%@ page pageEncoding="utf-8" %>
<%@ page import = "java.net.URLEncoder" %>
<%
	String value = "자바";
	String encodedValue = URLEncoder.encode(value, "UTF-8");
	response.sendRedirect("index.jsp?name=" + encodedValue);
%>
