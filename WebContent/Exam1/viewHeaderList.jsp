<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.util.Enumeration" %>
<html>
<head><title>헤더 목록 출력</title></head>
<body>
<%
	Enumeration headerEnum = request.getHeaderNames();
	
	//user-agent 에 MSIE가 포함되어 있으면 인터넷 익스플로러로 접속했다는 뜻
	
	// 인터넷 익스플로러의 경우 다른 방식을 취하므로 포함되어 있는지 알기 위해서 user-agent의 값을 String으로 저장
	//user-agent 값을 저장한 String.indexOf("MSIE") !=-1 사용


	while(headerEnum.hasMoreElements()) {
		String headerName = (String)headerEnum.nextElement();
		String headerValue = request.getHeader(headerName);
		
%>
<%= headerName %> = <%= headerValue %> <br>
<%
	}
%>





</body>
</html>
