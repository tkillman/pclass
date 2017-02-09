<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page session = "true" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%

	Date time = new Date();
	SimpleDateFormat formatter = 
	  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
%>

<html>
<head><title>세션정보</title></head>
<body>
세션ID: <%= session.getId() %> <br>

<%
	//밀리세컨트로 나오면 보기 어려우므로 datet 형식으로 보여지게하기
	time.setTime(session.getCreationTime());
%>
세션생성시간: <%= formatter.format(time) %> <br>
<%
	time.setTime(session.getLastAccessedTime());
%>
최근접근시간: <%= formatter.format(time) %>

</body>
</html>