<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>



<script type="text/javascript">

	function check() {
		var x = document.getElementById('text')
		//console.log(x.value);
		
		var result = "";
		for (var i = 0; i < x.value.length; i++) {
			
			console.log(x.value.length);
			
			if (x.value[i].charCodeAt() < 65) {
				alert("영어만 입력하세요.");
				return;
			}
			
			if (x.value[i].charCodeAt() > 122) {
				alert("영어만 입력하세요.");
				return;
			}

			if (x.value[i].charCodeAt() >= 91 && x.value[i].charCodeAt() <= 96) {
				alert("영어만 입력하세요.");
				return;
			}


			if (x.value[i].charCodeAt() >= 97 && x.value[i].charCodeAt() <= 122) {

				console.log('소문자이다.');


				result += x.value[i].toUpperCase();

			} else if (x.value[i].charCodeAt() >= 65 && x.value[i].charCodeAt() <= 90) {

				console.log('대문자이다.');

				result += x.value[i].toLowerCase();
			}
		}

		x.value = result;

	}
</script>
</head>
<body>
	<input type="text" id="text" onchange="check()">

</body>
</html>