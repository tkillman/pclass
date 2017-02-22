<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%

 request.setCharacterEncoding("utf-8");

 InputStreamReader is =null;

try{
	
	is = new InputStreamReader(request.getInputStream());
	
	char[] bytebuf = new char[100];
	int len = -1;
	
	while((len =is.read(bytebuf)) !=-1){
		
		out.print(URLDecoder.decode(new String(bytebuf,0,len), "utf-8") );
		
	}
	
}catch(Exception e){
	
}


%>

</body>
</html>