<%@ page contentType = "text/html; charset=utf-8" %>
<!-- 인클루드할 때는 contentType 타입의 대소문자까지 완전히 일치시켜야 에러가 발생하지 않는다. -->

<html>
<head><title>include 디렉티브</title></head>
<body>


<%
	int number = 10;
%>


<%@ include file="includee.jspf" %>

공통변수 DATAFOLDER( include에서 설정한 변수) = "<%= dataFolder %>"

</body>
</html>