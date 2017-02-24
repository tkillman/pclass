<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head><title>파일 등록</title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(function(){
	
})

function checkFile(){
	
	if(! $('#file').val() ){
		alert("파일을 선택해주세요.")
		return false;
	}	
		
	}

</script>


</head>


<body>
<form action="upload.jsp" method="post" enctype="multipart/form-data" onsubmit="return checkFile()">
파일: <input type="file" name="file" id="file"/> <br/>
설명: <input type="text" name="description" /> <br/>
<input type="submit" value="업로드" />
</form>
</body>
</html>