<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- request 객체에 저장된 uesrMenus를 사용하거나 -->

<c:forEach var="menu" items="${userMenus}">
<a href="${menu.link}">${menu.name}</a><br/>
</c:forEach>




<!-- tiles에 저장된 attribute를 importAttribute를 사용해서 꺼내온다. -->
<tiles:importAttribute name="adminMenus" />
<c:forEach var="menu" items="${adminMenus}">
${menu.name}<br/>
</c:forEach>
