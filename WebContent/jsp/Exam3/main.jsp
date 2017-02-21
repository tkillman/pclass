<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>main</title></head>
<body>

main.jsp에서 생성한 내용.

 <jsp:include page="sub.jsp" flush="false"/>

<%-- jsp:include 태그에 종료 태그를 설정할 때 그 사이를 벌려 놓으면 에러가 발생한다.
왜냐하면 그 사이를 벌려 놓으면 jsp:param을 설정하겠다는 의미로 받아들여서 컴파일시 그 값을 찾는데 없기 때문에 에러가 발생하기 때문이다.

<jsp:include page="sub.jsp" flush="false">
</jsp:include>
 --%>



include 이후의 내용.

</body>
</html>
