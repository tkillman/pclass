<%@ page contentType = "text/html; charset=utf-8" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<html>
<head><title>INFO</title></head>
<body>

include 전 name 파라미터 값: 


<% String[] names = request.getParameterValues("name");

try{
	for(String name : names){
		
		out.println(name);
	}
}catch(Exception e){
	e.printStackTrace();
}

%>

<hr>

<jsp:include page="body_sub.jsp" flush="false">
	<jsp:param name="name" value="자바" />
</jsp:include>

<hr/>

include 후 name 파라미터 값:


<% 

try{
	for(String name : names){
		
		out.println(name);
	}
}catch(Exception e){
	e.printStackTrace();
}

%>


</body>
</html>









