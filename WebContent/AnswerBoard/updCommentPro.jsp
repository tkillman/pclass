<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="board.CommentDBBean" %>  
<%@ page import="java.sql.Timestamp" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	int content_num=Integer.parseInt(request.getParameter("content_num"));
	int comment_num=Integer.parseInt(request.getParameter("comment_num"));
	
	String pageNum=request.getParameter("p_num");
	String passwd=request.getParameter("passwd");
	String cPageNum=request.getParameter("cPageNum");
	
	CommentDBBean cmtPro=CommentDBBean.getInstance();
	int check=cmtPro.checkPw(content_num,comment_num, passwd);
	
	if(check==1){ 
%>
	<meta http-equiv=Refresh content="0;url=content1.jsp?num=<%=content_num%>&pageNum=<%=pageNum %>&modifyMode=<%=comment_num%>&cPageNum=<%=cPageNum%>">
<%}else{ %>
	<script language="javascript">
	<!--
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	//->
	</script>
<%} %>	