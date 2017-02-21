<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<%
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user = "cc";
	String password = "1234";

	Connection connection = null; 
 	PreparedStatement pstmt = null;
	ResultSet resultSet  = null;
	
	
	connection = DriverManager.getConnection(url, user, password);
	
	
	String sql = "select * from member";
	
	pstmt = connection.prepareStatement(sql);
	
	resultSet = pstmt.executeQuery();
	
	while(resultSet.next()){
		
		out.println("아이디 : " + resultSet.getString("memberid"));
		out.println("이름 : " + resultSet.getString("name"));
		out.println("이메일 : " + resultSet.getString("email"));
	} 	

%>



</body>
</html>