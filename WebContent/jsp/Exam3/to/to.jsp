<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>to.jsp의 실행 결과</title></head>
<body>

이 페이지는 to.jsp가 생성한 것입니다.

<% String value = (String) request.getParameter("asd"); %>
<%=value%>
</body>
</html>