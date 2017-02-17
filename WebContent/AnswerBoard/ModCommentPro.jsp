<%@page import="board.CommentDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


<%


int comment_num=Integer.parseInt(request.getParameter("comment_num"));
String commentt = request.getParameter("commentt");
String num = request.getParameter("num");
String pageNum = request.getParameter("pageNum");
String cPageNum = request.getParameter("cPageNum");


CommentDBBean manager = CommentDBBean.getInstance();

manager.modifyComment(comment_num,commentt);

response.sendRedirect("content1.jsp?num="+num+"&pageNum="+pageNum+"&cPageNum="+cPageNum);



%>

</body>
</html>