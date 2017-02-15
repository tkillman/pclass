<%@page import="java.util.ArrayList"%>
<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "board.BoardDBBean" %>
<%@ page import = "board.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="../view/color.jsp"%>
<%!
	//한 페이지에서 보여줄 글의 갯수
    int pageSize = 10;
	
    SimpleDateFormat sdf =
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
%>
<%
	//처음에 요청한 페이지를 확인한다.
    String pageNum = request.getParameter("pageNum");
    
	//
	if (pageNum == null) {
        pageNum = "1";//문자다.
    }

	
    int currentPage = Integer.parseInt(pageNum);
    //System.out.println(currentPage);
    int startRow = (currentPage * pageSize) - (pageSize-1);
    int endRow = currentPage * pageSize;
   
    //전체 글 수
    int count = 0;
    
    // 글 번호
    int number=0;

    List articleList = null;
    BoardDBBean dbPro = BoardDBBean.getInstance();
    
    
    count = dbPro.getArticleCount();
   
   
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, endRow);
    }

    //검색창으로 사용할 때
    if(request.getAttribute("count")!=null){
    	int countNum = (int)request.getAttribute("count");
    	count = countNum;
    	articleList = (ArrayList) request.getAttribute("articleList");
    	return; 
    }
    
    
    
// 화면에 뿌려줄 번호 설정
number=count-(currentPage-1)*pageSize;
           // 11 -(2-1)*3 =8
%>


<html>
<head>
<title>게시판</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
<center><b>글목록(전체 글:<%=count%>)</b>
<table width="700">
<tr>
    <td align="right" bgcolor="<%=value_c%>">
    <a href="writeForm.jsp">글쓰기</a>
    </td>
</table>

<%
    if (count == 0) {
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
    게시판에 저장된 글이 없습니다.
    </td>
</table>

<%  } %><%  else{    %>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
    <tr height="30" bgcolor="<%=value_c%>">
      <td align="center"  width="50"  >번 호</td>
      <td align="center"  width="250" >제   목</td>
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td>
      <td align="center"  width="50" >조 회</td>
      <td align="center"  width="100" >IP</td>   
    </tr>

    
<% 
        for (int i = 0 ; i < articleList.size() ; i++) {
          BoardDataBean article = (BoardDataBean)articleList.get(i);
%>


   <tr height="30">
    <td align="center"  width="50" > <%=number--%></td>
    <td  width="250" >
<%
	// 글 레벨에 따라 뒤로 밀리도록 지정
      int wid=0;
      if(article.getRe_level()>0){ //답변글이라면...
        wid=5*(article.getRe_level());
%>
  <img src="images/level.gif" width="<%=wid%>" height="16"><!--투명한 이미지로 답변글을 뒤로 민다. -->
  <img src="images/re.gif">
<%}else{ // %>
  <img src="images/level.gif" width="<%=wid%>" height="16">
<%}// %>
          
      <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
           <%=article.getSubject()%></a>
           
          <% if(article.getReadcount()>=20){ // 조회수가 20이 넘으면 나오도록%>
         <img src="images/hot.gif" border="0"  height="16"><%}%> </td>
    <td align="center"  width="100">
       <a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
    <td align="center"  width="150"><%= sdf.format(article.getReg_date())%></td>
    <td align="center"  width="50"><%=article.getReadcount()%></td>
    <td align="center" width="100" ><%=article.getIp()%></td>
  </tr>
     <%} //for문 %>
</table>
<%} // 글 갯수가 존재할 때 %>

<%

	// 페이징 처리
    if (count > 0) {
    	
    	//전체 페이지의 수를 연산
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
        int pageBlock=5; // 5개를 보여주겠다.
    	
        
        //시작 페이지
        int startPage = (int)(currentPage/pageBlock)*pageBlock+1;
		
        //끝나는 페이지
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount; //끝나는 페이지가 계산된 페이지보다 큰 경우 == 없는 페이지까지 나타나게 된다.
       
        if (startPage > 5) {    %>
        <a href="list.jsp?pageNum=<%= startPage - 5 %>">[이전]</a>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
        
<%
        }
        if (endPage < pageCount) {  %>
        <a href="list.jsp?pageNum=<%= startPage + 5 %>">[다음]</a>
<%
        }
    }
%>

<br><br><br>
<input type="text" name="searchValue" id="searchValue"> <input type="button" name="btn1" id="btn1" value="검색">

<script type="text/javascript">

$(function(){
	
	$('#btn1').click(function(){
		
		location.href="search.jsp?searchValue="+$('#searchValue').val();
		
	})
})




</script>
</center>
</body>
</html>
