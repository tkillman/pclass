<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%

request.setCharacterEncoding("utf-8");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection = null;
PreparedStatement pstmt = null;
ResultSet resultSet = null;

try{
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "cc";
	String upw = "1234";
	
	connection = DriverManager.getConnection(url,uid,upw);
	
	String sql = "update member set name=? where memberid=?";
	
	pstmt = connection.prepareStatement(sql);
	
	String name = request.getParameter("name");
	String memberID = request.getParameter("memberID");
	
	pstmt.setString(1, name);
	pstmt.setString(2, memberID);
	
	int resultNum = pstmt.executeUpdate();
	
	out.println(resultNum + "개가 수정되었습니다.");
	
	
}catch(SQLException e){
	out.println("예외발생");
	
}finally{
	if(pstmt!=null){
		pstmt.close();
	}
	
	if(connection !=null){
		connection.close();
	}
	
	if(resultSet !=null){
		resultSet.close();
	}
	
}




%>



</body>
</html>