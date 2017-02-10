<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%

	String idValue = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmtItem = null;
	PreparedStatement pstmtDetail = null;

	String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
	String dbUser = "cc";
	String dbPass = "1234";
	
	Throwable occuredException = null;
	
	
	try {
		
		int id = Integer.parseInt(idValue);
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		//오토커밋을 해제시킨다.
		conn.setAutoCommit(false);
		
		pstmtItem = conn.prepareStatement("insert into ITEM values (?, ?)");
		pstmtItem.setInt(1, id);
		pstmtItem.setString(2, "상품 이름 " + id);
		pstmtItem.executeUpdate();
		
		
		if (request.getParameter("error") != null) {
			throw new Exception("의도적 익셉션 발생");
		}
		
		
		pstmtDetail = conn.prepareStatement(
			"insert into ITEM_DETAIL values (?, ?)");
		pstmtDetail.setInt(1, id);
		pstmtDetail.setString(2, "상세 설명 " + id);
		pstmtDetail.executeUpdate();
		
		//커밋을 실행시킨다.
		conn.commit();
		
	} catch(Throwable e) {
		
		if (conn != null) {
			try {
				//롤백 시킨다.
				conn.rollback();
			} catch(SQLException ex) {}
		}
		
		occuredException = e;
	} finally {
		if (pstmtItem != null)
			try { pstmtItem.close(); } catch(SQLException ex) {}
		if (pstmtDetail != null)
			try { pstmtDetail.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>


<html>
<head><title>ITEM 값 입력</title></head>
<body>


<%  if (occuredException != null) { %>
에러가 발생: <%= occuredException.getMessage() %>
<%  } else { %>
데이터가 성공적으로 들어감
<%  } %>
</body>
</html>
