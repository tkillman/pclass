<%@ page contentType = "text/html; charset=utf-8" %>
<jsp:useBean id="member" scope="request" 
class="member.MemberInfo" />
<%

	member.setId("KH");
	member.setName("자바");
		
%>

<jsp:forward page="useObject.jsp" />