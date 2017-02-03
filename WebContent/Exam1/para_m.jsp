
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>




</head>
<body>

<%


request.setCharacterEncoding("UTF-8");



Map<String,String[]> map= request.getParameterMap();

Set<String> keySet=  map.keySet();

Iterator<String> KeyIterator = keySet.iterator();

while(KeyIterator.hasNext()){
	
	String key = KeyIterator.next();
	
	String[] mapValue = map.get(key);
	
	PrintWriter pw = response.getWriter();
	
	for(int i=0; i<mapValue.length;i++){
		
		pw.print( key + " : "+mapValue[i]);
		
	}
	
}

%>

</body>
</html>