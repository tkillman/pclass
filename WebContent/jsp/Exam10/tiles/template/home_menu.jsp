<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="menu" items="${userMenus}">
<a href="${menu.link}">${menu.name}</a><br/>
</c:forEach>

<tiles:importAttribute name="adminMenus" />
<c:forEach var="menu" items="${adminMenus}">
${menu.name}<br/>
</c:forEach>
