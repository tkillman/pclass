<%@ page contentType = "text/html; charset=UTF-8"%>
<html>

<head><title>폼 생성</title></head>
<body>

<form action="viewParameter.jsp" method="GET">
이름: <input type="text" name="name" size="10"> <br>
주소: <input type="text" name="address" size="30"> <br>
좋아하는 동물:
	<input type="checkbox" name="pet" value="dog">강아지
	<input type="checkbox" name="pet" value="cat">고양이
	<input type="checkbox" name="pet" value="pig">돼지
<br>
<input type="submit" value="전송">
</form>

<a href="viewParameter.jsp
?name=test&address=서울&pet=dog&pet=cat">
파라미터 보기
</a>
</body>
</html>