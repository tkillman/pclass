<%@page import="board.CommentDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%

	String comment_num=request.getParameter("cmn");
	String content_num=request.getParameter("ctn");
	String p_num=request.getParameter("p_num");
	String url="content1.jsp?num="+content_num+"&pageNum="+p_num;

%>

<%

CommentDBBean manager = CommentDBBean.getInstance();

manager.checkPw(content_num,comment_num,)



%>



</body>
</html>