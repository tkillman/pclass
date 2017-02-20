<%@page import="java.lang.reflect.Array"%>
<%@ page contentType = "text/html; charset=utf-8" %>
<%-- <%@ page isELIgnored="true" %>  --%>
<!-- el이 안 먹히는 버전이면 isELIgnored를 false를 주면 된다. -->
<%-- <%@ page deferredSyntaxAllowedAsLiteral="true" %> --%>
<!-- deferredSyntaxAllowedAsLiteral="true"이건 #만 무시 , $는 인정 -->
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<%
	session.setAttribute("name", "session.su");
	request.setAttribute("name", "request.su");
	pageContext.setAttribute("name", "page.su");
	
%>

<html>
<head><title>EL Object</title></head>
<body>
${name}<br> <!-- 속성값을 의미한다. session과 request 와 pageContext 중 어느것을 꺼내올까? -->
요청 URI: ${pageContext.request.requestURI}<br>
request의 name 속성: ${requestScope.name}<br>
code 파라미터: ${param.code}<br>
#{10} 

<% 

String[] menu = {"순두부","제육","된장"};

%>

<%=Array.get(menu, 1) %>

<c:set var="a" value="<%=menu%>"/>




</body>
</html>







