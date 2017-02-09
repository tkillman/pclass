<%@page import="java.sql.DriverManager"%>
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

String idValue = request.getParameter("id");


Connection conn = null;
PreparedStatement pstmtItem = null;
PreparedStatement pstmtDetail = null;

String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
String dbUser = "cc";
String dbPass = "1234";


Throwable occuredException = null;


try{

	conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
	
	//오토커밋 해제
	conn.setAutoCommit(false);
	
	String sql = "insert into ITEM values(?,?)";
	
	int idNum = Integer.parseInt(idValue);
	
	pstmtItem = conn.prepareStatement(sql);
	pstmtItem.setInt(1, idNum);
	pstmtItem.setString(2, "아이템 번호 : " + idNum);
	int re = pstmtItem.executeUpdate();
	//out.println(re);
	

	if(request.getParameter("error")!=null){
		throw new Exception("의도적인 예외");
	}
	
	
	sql = "insert into ITEM_DETAIL values(?,?)";

	pstmtDetail = conn.prepareStatement(sql);
	pstmtDetail.setInt(1, idNum);
	pstmtDetail.setString(2, "디테일한 설명 : " + idNum);
	pstmtDetail.executeUpdate();
	
	conn.commit();
	
	
}catch(Throwable e){
	
	occuredException =e;
	conn.rollback();
	
}finally{
	
	if(pstmtItem!=null){
		pstmtItem.close();
	}
	if(conn!=null){
		conn.close();
	}
	}
%>


<%
if(occuredException!=null){
	out.print(occuredException.getMessage());
}else{
	out.println("데이터가 잘 입력되었습니다.");
}

%>




</body>
</html>