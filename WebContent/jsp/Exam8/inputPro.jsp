<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="logon.LogonDBBean"%>
<%@ page import="java.sql.Timestamp"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="logon.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	member.setReg_date(new Timestamp(System.currentTimeMillis()));
	LogonDBBean manager = LogonDBBean.getInstance();
	int resultNum = manager.insertMember(member);

	if (resultNum == 1) {
%>


<script type="text/javascript">
	alert("회원가입이 성공적으로 되었습니다.");
	location.href="loginForm.jsp";
</script>
<%
	
	} else {
%>

<script type="text/javascript">
	alert("회원가입이 잘못되었습니다.")
	location.href="inputForm.jsp";
</script>

<%
	}
%>