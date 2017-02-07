<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page buffer="2kb" %>
<%--
버퍼의 내용을 한번 전송한 후에는 
<jsp:forward> 액션 태그가 올바르게 실행되지 
않을 수도 있다.
이미 웹브라우저에 데이터가 전송된 경우에는 
<jsp:forward>를 사용해서 
흐름을 이동할 수 없도록 규약하고 있다.
--%>
<html>
<head><title>fromBufferOF의 제목</title></head>
<body>
<% for (int i = 0 ; i < 512 ; i++) { %>
<%= i %>
<% } %>
<jsp:forward page="../to/to.jsp" />
</body>
</html>
