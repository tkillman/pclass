<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import = "logon.*" %>
<%@ include file="view/color.jsp"%>

<html>
<head>
<title>회원정보수정</title>
<link href="style.css" rel="stylesheet" type="text/css">


<script>
   
    function checkIt() {
    	
        var userinput = eval("document.userinput");
              
        if(!userinput.passwd.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.passwd.value != userinput.passwd2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
      
        if(!userinput.name.value) {
            alert("사용자 이름을 입력하세요");
            return false;
        }
        if(!userinput.jumin1.value  || !userinput.jumin2.value )
        {
            alert("주민등록번호를 입력하세요");
            return false;
        }
    }


function zipCheck(){
url="ZipCheck.jsp?check=y";
window.open(url,"post","toolbar=no ,width=500 ,height=300 ,directories=no,status=yes,scrollbars=yes,menubar=no");
  }


</script>


<%
    String id = (String)session.getAttribute("memId");
  
    LogonDBBean manager = LogonDBBean.getInstance();
    LogonDataBean c = manager.getMember(id);

try{
%>

<body bgcolor="<%=bodyback_c%>">
<form method="post" action="modifyPro.jsp" name="userinput" onsubmit="return checkIt()">

  <table width="600" border="1" cellspacing="0" cellpadding="3"  align="center">
    <tr >
      <td  colspan="2" height="39" bgcolor="<%=title_c%>" align="center">
     <font size="+1" ><b>회원 정보수정</b></font></td>
    </tr>
    <tr>
      <td colspan="2" class="normal" align="center">회원의 정보를 수정합니다.</td>
    </tr>
     <tr>
      <td width="200" bgcolor="<%=value_c%>"><b>아이디 입력</b></td>
      <td width="400" bgcolor="<%=value_c%>"> </td>
    <tr> 

    <tr>
      <td  width="200"> 사용자 ID</td>
      <td  width="400"><%=c.getId()%></td><!-- 바꾸면 안되기 때문에 input 태그를 사용하지 않는다. -->
    </tr>
   
     <tr>
      <td width="200"> 비밀번호</td>
      <td width="400">
        <input type="password" name="passwd" size="10" maxlength="10" value="<%=c.getPasswd()%>">
      </td>
    <tr> 
    <tr>
      <td  width="200" bgcolor="<%=value_c%>"><b>개인정보 입력</b></td>
      <td width="400" bgcolor="<%=value_c%>"> </td>
    <tr> 
    <tr>
      <td   width="200">사용자 이름</td>
      <td  width="400">
        <input type="text" name="name" size="15" maxlength="20" value="<%=c.getName()%>">
      </td>
    </tr>
    <tr>
      <td width="200">주민등록번호</td>
      <td width="400">
        <%=c.getJumin1()%>-<%=c.getJumin2()%>
      </td>
    </tr>
   <tr>
      <td width="200">E-Mail</td>
      <td width="400">
    <%if(c.getEmail()==null){//데이터 베이스에 not null이 안 걸려 있으므로 null 처리 %>
  <input type="text" name="email" size="40" maxlength="30" >
<%}else{%>
          <input type="text" name="email" size="40" maxlength="30" value="<%=c.getEmail()%>">
<%}%>
      </td>
    </tr>
    
    <tr>
      <td width="200">Blog</td>
      <td width="400">
    <%if(c.getBlog()==null){%>
  <input type="text" name="blog" size="60" maxlength="50" >
<%}else{%>
          <input type="text" name="addr" size="60" maxlength="50" value="<%=c.getBlog()%>">
<%}%>
      </td>
    </tr>     
    
    <tr>
      <td width="200">우편번호</td>
      <td width="400">
    <%if(c.getZipcode()==null){%>
  <input type="text" name="zipcode" size="60" maxlength="50" >
<%}else{%>
          <input type="text" name="zipcode" size="60" maxlength="50" value="<%=c.getZipcode()%>" readonly="readonly" style="background: <%=value_c%>">
<%}%>
	<input type="button" value="우편번호찾기" onClick="zipCheck()">
      </td>
     
      
    </tr>     
    
    <tr>
      <td width="200">집주소</td>
      <td width="400">
    <%if(c.getAddress() ==null){%>
  <input type="text" name="address" size="60" maxlength="50">
<%}else{%>
          <input type="text" name="address" size="60" maxlength="50" value="<%= c.getAddress()%>">
<%}%>
      </td>
    </tr>    
    
    
    <tr>
      <td colspan="2" align="center" bgcolor="<%=value_c%>">
       <input type="submit" name="modify" value="수   정" >
       <input type="button" value="취  소" onclick="javascript:window.location='main.jsp'">     
      </td>
    </tr>
  </table>
</form>
</body>
<%}catch(Exception e){}%>
</html>