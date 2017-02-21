<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="mvjsp.Member" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Member member = new Member();
	HashMap<String, String> pref = new HashMap<String, String>();
%>
<html>
<body>
<c:set var="mem" value="<%= member %>" />
<c:set target="${mem}" property="name" value="su" />

<c:set var="pre" value="<%= pref %>" />

<!-- pre는 map이므로 map의 key값 중 color라는 값이 있는지 찾는다. -->
<c:set var="favoriateColor" value="#{pre.color}" />

회원 이름: ${mem.name},

좋아하는 색: ${favoriateColor} <!-- null 저장 -->

<br />

<!-- target이 map인 경우 key 와 value 값을 저장해준다. -->
<c:set target="${pre}" property="color" value="red" />



설정 이후 좋아하는 색: ${favoriateColor}

<br />

<!--  map의 key 값은 중복이 안되므로 마지막으로 실행된 key 값을 저장한다. -->
<c:set target="${pre}" property="color" value="blue" />

설정 이후 좋아하는 색: ${favoriateColor}

</body>
</html>






