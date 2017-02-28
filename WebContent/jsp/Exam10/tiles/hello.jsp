<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%

// hello 에서 요청된 모든 페이지에서 동일한 request 객체를 사용할 수 있다. 
	request.setAttribute("greeting", "request가 영향을 미치는 jsp 보여라");

%>

<!-- 원래 있던 속성 'menu' 를 오버라이딩 한 예제  -->


<tiles:insertDefinition name="hello" >
<tiles:putAttribute name="menu" value="/jsp/Exam10/tiles/template/menu_help.jsp"/>
</tiles:insertDefinition>


