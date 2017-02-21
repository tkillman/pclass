<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>numberFormat 태그 사용</title></head>
<body>

<c:set var="now" value="<%= new java.util.Date() %>" />
<fmt:formatDate value="${now}" type="date" dateStyle="full" /> <br>
<fmt:formatDate value="${now}" type="date" dateStyle="short" /> <br>
<fmt:formatDate value="${now}" type="time" /> <br>
<fmt:formatDate value="${now}" type="both" 
                dateStyle="full" timeStyle="full" /> <br>
<fmt:formatDate value="${now}" pattern="z a h:mm" /> <br>

<fmt:parseDate value="2017-02-21 19:32:00" pattern="yyyy-MM-dd HH:mm:ss" var="date"></fmt:parseDate>
<!-- pattern에 대소문자는 확실히 구분해주어야 한다. -->

<br>
${date}


<br>
한국 시간 : ${now}
<br>
<fmt:timeZone value="Hongkong">
홍콩 시간 대: <fmt:formatDate value="${now}" type="both" dateStyle="full"/>
</fmt:timeZone>


</body>
</html>





