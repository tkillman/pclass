<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>Hello</title></head>
<body>
${hello}



<!-- 
http://localhost:8080/projectname/controllerUsingFile?cmd=hello
http://localhost:8080/projectname/controllerUsingFile

 -->
 
 <!-- 이런 방식으로 설정 초기화 할 수 도 있다. -->
<!--  
	@WebServlet(
 	urlPatterns = "/controllerUsingFile" , 
 	initParams = {
 		@WebInitParam (name="configFile",  //초기값 설정
 		 			  value="WEB-INF/commandHandler.properties")}
 
 )
  -->
</body>
</html>
