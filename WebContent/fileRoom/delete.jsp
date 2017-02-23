<%@page import="pds.dao.PdsItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<% 


PdsItemDao dao =PdsItemDao.getInstance();

String id = request.getParameter("id");
if(id!=null){
	
	dao.deletePdsItem(id);
	
}


String[] ids = request.getParameterValues("ids"); 


if(ids!=null){
	
	System.out.println("오예");
	dao.deletePdsItem(ids);
	
}


%>

<jsp:forward page="list.jsp" />

</body>
</html>