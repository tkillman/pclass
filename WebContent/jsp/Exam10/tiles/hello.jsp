<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%
	request.setAttribute("greeting", "안녕하세요");
%>
<tiles:insertDefinition name="hello" >
<tiles:putAttribute name="menu" 
value="/tiles/template/menu_help.jsp"/>
</tiles:insertDefinition>
