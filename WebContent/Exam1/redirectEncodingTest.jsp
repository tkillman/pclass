<%@ page pageEncoding="utf-8" %>
<%@ page import = "java.net.URLEncoder" %>
<%
	String value = "자바";
	String encodedValue = URLEncoder.encode(value, "utf-8");
	response.sendRedirect("index.jsp?name=" + encodedValue);
%>
