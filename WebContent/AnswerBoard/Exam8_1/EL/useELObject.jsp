<%@ page contentType = "text/html; charset=utf-8" %>
<%-- <%@ page isELIgnored="true" %>  --%>
<%@ page deferredSyntaxAllowedAsLiteral="true" %>
<%
	session.setAttribute("name", "session.su");
	request.setAttribute("name", "su");
	pageContext.setAttribute("name", "page.su");
%>
<html>
<head><title>EL Object</title></head>
<body>
${name}<br>
요청 URI: ${pageContext.request.requestURI}<br>
request의 name 속성: ${requestScope.name}<br>
code 파라미터: ${param.code}<br>
#{10} 
</body>
</html>







