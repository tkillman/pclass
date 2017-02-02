<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="day01.*"%>
<html>
<head><title>선언부를 사용한 두 정수값의 곱</title></head>
<body>


<%MultiplyEx m = new MultiplyEx(); %>
10 * 25 = <%= m.multiply(10, 25) %>


</body>
</html>
