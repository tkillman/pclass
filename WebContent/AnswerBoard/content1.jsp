<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="board.BoardDBBean" %>
<%@ page import="board.BoardDataBean" %>
<%@ page import="board.CommentDBBean" %>  
<%@ page import="board.CommentDataBean" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../view/color.jsp" %>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	
	function writeSave(){
		if(document.comment.commentt.value==""){
		  alert("작성자를 입력하십시요.");
		  document.comment.commentt.focus();
		  return false;
		}
	}

	$('#submitComment').on('click',function(){
		//alert("보내기")
		if(!$('#comment<%=request.getParameter("modifyMode")%>').val()){
			alert("코멘트를 입력해주세요.");
			$('#comment<%=request.getParameter("modifyMode")%>').focus();
			return false;
		}
		
		var commentt =$('#comment<%=request.getParameter("modifyMode")%>').val()
		//console.log(commentt);
		
		
		location.href="ModCommentPro.jsp?commentt="+commentt+"&comment_num="+<%=request.getParameter("modifyMode")%>+"&num="+<%=request.getParameter("num")%>+"&pageNum="+<%=request.getParameter("pageNum")%>+"&cPageNum="+<%=request.getParameter("cPageNum")%>
		
		
		
	})
	
	
})
</script>
</head>

<%
	
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	int pageSize = 10;
	String cPageNum = request.getParameter("cPageNum");	// 댓글의페이지넘버
	
	if(cPageNum == null)
	{
		cPageNum = "1";
	}
	
	int cCurrentPage = Integer.parseInt(cPageNum);
	int startRow = (cCurrentPage * 10) -9;
	int endRow = cCurrentPage * pageSize;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	try{
			BoardDBBean dbPro=BoardDBBean.getInstance();
			BoardDataBean article=dbPro.getArticle(num);
			
			// 커멘트디비빈 객체를 생성
			CommentDBBean cdb=CommentDBBean.getInstance();
			ArrayList comments=cdb.getComments(article.getNum(),startRow, endRow);
			
			//코멘트 숫자
			int count=cdb.getCommentCount(article.getNum());
			int ref=article.getRef();
			int re_step=article.getRe_step();
			int re_level=article.getRe_level();
%>
			<body bgcolor=<%=bodyback_c %>>
			<center><b>글내용 보기</b><br>
				<table width=500 border=1 cellspacing=0 cellpadding=0 bgcolor=<%=bodyback_c %> align=center>
					<form>
					<tr height=30>
						<td align=center width=125 bgcolor=<%=value_c %>>글번호</td>
						<td align=center width=125><%=article.getNum() %></td>
						<td align=center width=125 bgcolor=<%=value_c %>>조회수</td>
						<td align=center width=125><%=article.getReadcount() %></td>
					</tr>
					<tr height=30>
						<td align=center width=125 bgcolor=<%=value_c %>>작성자</td>
						<td align=center width=125><%=article.getWriter() %></td>
						<td align=center width=125 bgcolor=<%=value_c %>>작성일</td>
						<td align=center width=125><%=sdf.format(article.getReg_date()) %></td>
					</tr>
					<tr height=30>
						<td align=center width=125 bgcolor=<%=value_c %>>글제목</td>
						<td align=center width=375 colspan=3><%=article.getSubject() %></td>
					</tr>
					<tr>
						<td align=center width=125 bgcolor=<%=value_c %>>글내용</td>
						<td align=center width=375 colspan=3><%=article.getContent() %></td>
					</tr>
					<tr height=30>
						<td colspan=4 bgcolor=<%=value_c %> align=right>
							<input type=button value=글수정 onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=button value=글삭제 onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=button value=답글쓰기 onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type=button value=글목록 onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
						</td>
					</tr>
					</form>
					<form method=post action=contentPro.jsp name="comment" onsubmit="return writeSave()">
					<tr bgcolor=<%=value_c %> align=center>
						<td>코멘트 작성</td>
						<td colspan=2>
							<textarea name=commentt rows="6" cols="40"></textarea>
							<input type=hidden name=content_num value=<%=article.getNum()%>>	
							<input type=hidden name=p_num value=<%=pageNum%>>
							<input type=hidden name=comment_num value=<%=count+1%>>			
						</td>
						<td align=center>
							작성자<br>
							<input type=text name=commenter size=10><br>
							비밀번호<br>
							<input type=password name=passwd size=10><p>
							<input type=submit value=코멘트달기>
						</td>
					</tr>
					</form>
				</table>


				<%if(count>0){ // 데이터가 있으면%>	
				<p>
				<table width=500 border=0 cellspacing=0 cellpadding=0 bgcolor=<%=bodyback_c %> align=center>
					<tr>
						<td>코멘트 수: <%=comments.size() %> // arraylist에 있는 갯수
					</tr>
					<%
						for(int i=0;i<comments.size();i++){
						
							CommentDataBean dbc=(CommentDataBean)comments.get(i);
							int comment_num_modify=-1;
							
							if(request.getParameter("modifyMode")!=null){
							comment_num_modify = Integer.parseInt(request.getParameter("modifyMode"));
							}
							
							 
							
					%>
						<tr>
							<td align=left size=250 bgcolor=<%=value_c %>>
							&nbsp;<b><%=dbc.getCommenter() %>&nbsp;님</b> (<%=sdf.format(dbc.getReg_date())%>)
							</td>
							<td align=right size=250 bgcolor=<%=value_c %>> 접속IP:<%=dbc.getIp() %>
							<%if(comment_num_modify==dbc.getComment_num()){%> 
							<a id='submitComment'>[완료]</a>
							<%} else{%>
							<a href="updCommentForm.jsp?ctn=<%=dbc.getContent_num()%>&cmn=<%=dbc.getComment_num()%>&p_num=<%=pageNum%>&cPageNum=<%=cPageNum%>">[수정]</a>
							<%} %>
							&nbsp;
							
							<%if(comment_num_modify==dbc.getComment_num()){%>
							<a href="content1.jsp?num=<%=dbc.getContent_num()%>&pageNum=<%=pageNum%>&cPageNum=<%=request.getParameter("cPageNum")%>">[취소]</a>
							<%} else{%>
							<a href="delCommentForm.jsp?ctn=<%=dbc.getContent_num()%>&cmn=<%=dbc.getComment_num() %>&p_num=<%=pageNum %>" >[삭제]</a>&nbsp;
							<%} %>
							</td>
						</tr>	
						<tr>
						<%if(comment_num_modify==dbc.getComment_num()){%>
						<td colspan=2><input type="text" name="comment<%=dbc.getComment_num()%>" id="comment<%=dbc.getComment_num()%>" value="<%=dbc.getCommentt()%>"><td>
						<%} else {%>
							<td colspan=2><%=dbc.getCommentt()%></td>
							<%}%>
							
					
					<%} %> // for
					<%} %> //count
						</tr>
						
				</table>

<table width=500 border=0 cellspacing=0 cellpadding=0 bgcolor=<%=bodyback_c %> align=center>
	<tr>
		<center>
		<%--페이징!!! --%>
<%
    		if (count > 0) {
		    //전체 페이지의 수를 연산
		        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		
		        int startPage = (int)(cCurrentPage/5)*5+1; // 11
			int pageBlock=5;
		        int endPage = startPage + pageBlock-1; // 11+5-1 =15
		        if (endPage > pageCount) endPage = pageCount;
       
		        if (startPage > 5) {    
%>
				<a href="content1.jsp?num=<%=num %>&pageNum=<%=pageNum %>&cPageNum=<%= startPage - 5 %>">[이전]</a>
<%      
			} // if
			        for (int i = startPage ; i <= endPage ; i++) {
%>

				        <a href="content1.jsp?num=<%=num %>&pageNum=<%=pageNum %>&cPageNum=<%= i %>">[<%= i %>]</a>
<%
			        } // for
			        if (endPage < pageCount) {
%>
 				       <a href="content1.jsp?num=<%=num %>&pageNum=<%=pageNum %>&cPageNum=<%= startPage + 5 %>">[다음]</a>
<%
  		      
    		} // if
%>
		</center>
	</tr>
</table>
<%}%>  //count
	<% 		
	}catch(Exception e){}
			%>
			</center>
			</body>
</html>
