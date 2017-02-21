<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>out 기본 객체 사용</title></head>
<body>

1.안녕하세요<br>

<%= "2.안녕하세요" %><br>

<%
	out.println("3.안녕하세요?");
%>

<br>

out 기본 객체를 사용하여 

<%
	out.println("4.출력한 결과입니다.");
%>



<!-- out 기본 객체를 사용하는 경우는 표현식을 쓰기 복잡한 경우 -->
<%-- <%if(grade > 10){%>
<%= A %>
<%}else if(grade > 5){ %>
<%= B %>
<%} %> --%>

<%-- <%if(grade > 10){
out.print(A); 
}else if(grade > 5){ 
 out.print(B);
} %>
 --%>



</body>
</html>
