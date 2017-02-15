<%@page import="board.BoardDataBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%

String searchValue = request.getParameter("searchValue");

BoardDBBean manager = BoardDBBean.getInstance();

// 검색된 결과값
int resultNum = manager.searchResult(searchValue);

//결과의 리스트

List<BoardDataBean> articleList =manager.searchlist(searchValue);

request.setAttribute("count", resultNum);
request.setAttribute("searchValue", searchValue);
request.setAttribute("articleList", articleList);


%>

<jsp:forward page="list.jsp"></jsp:forward>

</body>
</html>