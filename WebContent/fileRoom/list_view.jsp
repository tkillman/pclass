<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%

	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
		
%>

<html>
<head><title>자료실 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script type="text/javascript">


$(function(){
	
	$('#deleteBtn').on("click",function(){
				
		$('#checkForm').submit();
		
	})
	
})


</script>

</head>
<body>
<form id="checkForm" action="delete.jsp" method="post">
<table border="1">

	<c:if test="${listModel.totalPageCount > 0}">
	<tr>
		
		<td colspan="7">
		${listModel.startRow}-${listModel.endRow}
		[${listModel.requestPage}/${listModel.totalPageCount}]
		</td>
		
	</tr>
	</c:if>
	
	<tr>
		<td>번호</td>
		<td>파일명</td>
		<td>파일크기</td>
		<td>다운로드회수</td>
		<td>다운로드</td>
		<td>삭제</td>
		<td>다중삭제</td>
	</tr>
	
<c:choose>
	
	<c:when test="${listModel.hasPdsItem == false}">
	<!-- boolean 타입은 isHasPdsItem 메소드를 부른다. -->
	<tr>
		<td colspan="7">
			게시글이 없습니다.
		</td>
	</tr>
	</c:when>
	
	<c:otherwise>
	
	<c:forEach var="item" items="${listModel.pdsItemList}">
	
	<tr>
		<td>${item.id}</td>
		<td>${item.fileName}</td>
		<td>${item.fileSize}</td>
		<td>${item.downloadCount}</td>
		<td><a href="download.jsp?id=${item.id}">다운받기</a></td>
		<td><a href="delete.jsp?id=${item.id}">삭제</a></td>
		<td><input type="checkbox" name="ids" value="${item.id}"></td>
	</tr>
	</c:forEach>
	
	<tr>
		<td colspan="7">
		
		<c:if test="${ beginPage > 10}">
			<a href="list.jsp?p=${beginPage-1}">이전</a>
		</c:if>
		<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
		<a href="list.jsp?p=${pno}">[${pno}]</a>
		</c:forEach>
		<c:if test="${endPage < listModel.totalPageCount}">
			<a href="list.jsp?p=${endPage + 1}">다음</a>
		</c:if>
		</td>
	</tr>
	</c:otherwise>
</c:choose>
	
	<tr>
		<td colspan="7">
			<a href="uploadForm.jsp">파일 첨부</a>
			<input type="button" id="deleteBtn" value="파일삭제"/>
		</td>
	</tr>	
</table>
</form>
</body>
</html>