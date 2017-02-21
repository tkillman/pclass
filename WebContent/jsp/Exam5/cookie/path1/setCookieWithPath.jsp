<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.net.URLEncoder" %>
<%
	
	//path1에만 전달한다.
	Cookie cookie1 = new Cookie("path1", 
			URLEncoder.encode("경로:/chap09/path1", "utf-8"));
//contextpath부터 지정	
	cookie1.setPath("/pclass/Exam5/cookie/path1");
	response.addCookie(cookie1);
	
	
	//쿠키 경로를 설정하지 않았다. 같은 경로를 가진 곳에만 전달된다.
	Cookie cookie2 = new Cookie("path2", 
			URLEncoder.encode("경로:", "utf-8"));
	response.addCookie(cookie2);
	
	
	//중요!! 모든 경로에 쿠키를 전달한다.
	Cookie cookie3 = new Cookie("path3",
			URLEncoder.encode("경로:/", "utf-8"));
	cookie3.setPath("/");
	response.addCookie(cookie3);

	
	
	//path2에만 전달된다.
	Cookie cookie4 = new Cookie("path4",
			URLEncoder.encode("경로:/chap09/path2", "utf-8"));
	cookie4.setPath("/pclass/Exam5/cookie/path2");
	response.addCookie(cookie4);
	
%>

<html>
<head><title>쿠키 경로 지정</title></head>
<body>

다음과 같이 쿠키를 생성했습니다.<br>
<%= cookie1.getName() %>=<%= cookie1.getValue() %>
[<%= cookie1.getPath() %>]
<br>
<%= cookie2.getName() %>=<%= cookie2.getValue() %>
[<%= cookie2.getPath() %>]
<br>
<%= cookie3.getName() %>=<%= cookie3.getValue() %>
[<%= cookie3.getPath() %>]
<br>
<%= cookie4.getName() %>=<%= cookie4.getValue() %>
[<%= cookie4.getPath() %>]

</body>
</html>