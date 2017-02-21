<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<form action="uploadData_m.jsp" method="post">
<input type="file" name="file"> 
<input type="submit" value="제출">
</form>



<form action="uploadData_m.jsp" method="post" enctype="multipart/form-data">
<input type="file">
<input type="submit" name="file" value="제출">
</form>


</body>
</html>