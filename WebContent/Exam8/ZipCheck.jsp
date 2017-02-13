<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*,logon.*" %>

<%
   request.setCharacterEncoding("utf-8");

	//check 값은 y
   String check = request.getParameter("check");
   String area3 = request.getParameter("area4");
   LogonDBBean manager = LogonDBBean.getInstance();  
   Vector<ZipcodeBean> zipcodeList = manager.zipcodeRead(area3);
   int totalList = zipcodeList.size();	// 검색된 갯수가 몇갠지 
   
%>

<!DOCTYPE html>
<html>
<head>
<center>
<title>우편번호검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<script>

function dongCheck(){
	
if (document.zipForm.area4.value == ""){
alert("동이름을 입력하세요");
document.zipForm.area4.focus();
return;
}
document.zipForm.submit();
}


// ex) 역삼이라고 검색하고 하나를 셀렉했을 때 input에 박히게 하는 함수
function sendAddress(zipcode,area1,area2,area3,area4){
	
	
var address =area1+ " "+area2+ " " +area3+ " " +area4;


opener.document.userinput.zipcode.value=zipcode;
opener.document.userinput.address.value=address;
self.close();

}

</script>
</head>

<body bgcolor="#FFFFCC">

<b>우편번호 찾기</b>
<form name="zipForm" method="post" action="ZipCheck.jsp"><!-- 액션을 지정 안하면 현재 페이지를 다시 요청한다. -->
<table>

      <tr>
        <td><br>
          동이름 입력 : <input name="area4" type="text">
          <input type="button" value="검색" onclick= "dongCheck();">
        </td>
      </tr>
     <input type="hidden" name="check" value="n">
    
    
<%

if(check.equals("n")){   
	
   if (zipcodeList.isEmpty()) {  
	   
%>
   <tr><td align="center"><br>검색된 결과가 없습니다.</td></tr>
<% } 
   else { 
%>


<tr><td align="center"><br>
    ※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td></tr>


<%

for (int i=0;i<totalList;i++) {
ZipcodeBean zipBean = (ZipcodeBean)zipcodeList.elementAt(i);
String tempZipcode =zipBean.getZipcode();
String temptArea1 =zipBean.getArea1();
String temptArea2 =zipBean.getArea2();
String temptArea3 =zipBean.getArea3();

if(temptArea3==null){
	temptArea3="";
}

String temptArea4 =zipBean.getArea4();


%>


<tr><td>
<a href="javascript:sendAddress('<%=tempZipcode%>','<%=temptArea1%>','<%=temptArea2%>','<%=temptArea3%>','<%=temptArea4%>')"> 
<%=tempZipcode%>&nbsp;<%=temptArea1%>&nbsp;<%=temptArea2%>&nbsp;<%=temptArea3%>&nbsp;<%=temptArea4%></a><br>

<%
}//for

} // 검색한 값이 존재하는 else

} // check값이 n 인 경우 %>
</td></tr>
<tr><td align="center"><br><a href="javascript:this.close();">닫기</a></td><tr>

</table>
</form>

</body>
</center>
</html>
