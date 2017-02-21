<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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

Connection connection =null;
Statement statement =null;
ResultSet resultSet = null;


String url = "jdbc:oracle:thin:@localhost:1521:XE";
String uid= "cc";
String upw= "1234";


connection = DriverManager.getConnection(url,uid,upw);

statement = connection.createStatement();

String memberID = request.getParameter("memberID");

String sql = "select * from member where memberid='"+memberID+"'";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){
	
	out.println("이름" +resultSet.getString(1));
	out.println("아이디" +resultSet.getString(2));
	out.println("이메일" +resultSet.getString(3));
	out.println("주소" +resultSet.getString(4));
}






%>




</body>
</html>