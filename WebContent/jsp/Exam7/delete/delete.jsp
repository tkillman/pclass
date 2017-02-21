<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>

<html>
<head>
<title>회원 삭제</title>
</head>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("memberID");
		String passwd = request.getParameter("password");
		//System.out.println(id+"::"+passwd);
		Class.forName("oracle.jdbc.driver.OracleDriver");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;//상태값

		try {
			String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
			String dbUser = "su";
			String dbPass = "su1234";

			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

			pstmt = conn.prepareStatement("select password from MEMBER where MEMBERID = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("password");
				if (dbpasswd.equals(passwd)) {
					pstmt = conn.prepareStatement("delete from MEMBER where MEMBERID=?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1; //회원탈퇴 성공
				} else
					x = 0; //비밀번호 틀림
			}else{
			x = -1;//아이디 틀림
		}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try {rs.close();} catch (SQLException ex) {}
			if (pstmt != null)try {pstmt.close();} catch (SQLException ex) {}
			if (conn != null)try {conn.close();} catch (SQLException ex) {}
		}
	%>
<% if (x == 1) {	%>
<body>
	회원정보가 삭제되었습니다.
<% }else if(x == 0){ %>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<%}else {%>
	<script>
		alert("아이디가 맞지 않습니다.");
		history.go(-1);
	</script>
<%} %>
</body>
</html>
