<%@page import="logon.ZipcodeBean"%>
<%@page import="logon.LogonDBBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
 <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
 
 <script type="text/javascript">
 
 $(function(){
	 
	 $('#btn1').click(function(){
		 
		 if(!$('#area4').val()){
			 
			alert("검색값을 입력해주세요.");
			 return false;
		 }
		 
		$('#userForm').submit();
		 
		 
	 })
	 
	 
 });
 
 
 </script>
 
 
</head>
<body>

<%

String check = request.getParameter("check");
String area3 = request.getParameter("area4");
LogonDBBean manager = LogonDBBean.getInstance();

Vector<ZipcodeBean> v = manager.zipcodeRead(area3);


%>
<form name="userForm" id="userForm" action="zipCode_m.jsp" method="get">
<table>
<tr><td>우편번호검색</td></tr>
<tr><td>동 이름 검색 : <input type="text" name="area4" id="area4"><input type="button" name="btn1" id="btn1" value="검색"></td></tr>
<tr><td><div id="result" style="display : none"></td></tr>
<input type="hidden" name="check" value="n">


<%if(check.equals("n")){
	//out.println(check);
	
	//out.println(v.size());
	
	if(v.size()==0){
		%>
		
		<script>
		var result = document.getElementById("result");
		
		result.style.display = 'block';
		result.innerHTML = "결과값 없음";
		</script>
	
		<% 
		
	}else{
		
		//결과값을 화면에 표시
		for(int i=0;i<v.size();i++){
			String zipCode =v.get(i).getZipcode();
			String area1 =v.get(i).getArea1();
			String area2 =v.get(i).getArea2();
			area3 =v.get(i).getArea3();
			if(area3==null){
				area3="";
			}
			
			
			String area4 =v.get(i).getArea4();
		%>
		<tr><td><%=zipCode%>&nbsp;&nbsp;&nbsp;<%=area1%>&nbsp;&nbsp;<%=area3%>&nbsp;&nbsp;<%=area4%></td></tr>	
		<%	
		}
	}
	%>
	<% 
} 
%>
<tr><td><input type="button" value="닫기" onclick="location.href='zipCode_m.jsp?check=y'"></td></tr>
</table>
</form>	

</body>
</html>