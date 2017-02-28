<%@ page contentType="text/html; charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<html lang="ko">
<head>

	<!--  filter에 의해서 title에 있는 값을 가져온다. -->
	
	
	<title>19장 <decorator:title /></title>
	<style type="text/css">
	#footer {color:red}
	</style>
	
	
	<!--  head태그의 값을 가지고 온다. -->
	<decorator:head />
	
	
	
</head>
<body>
	상단 공통 메뉴
	<hr/>
	<decorator:body />
	<hr/>
	<div id="footer">하단 내용</div>
	</body>
</html>
