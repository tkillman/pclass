<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%

// 1. MultipartRequest 로 값을 저장해보자.
// 2. 들어갈 인자는? ㄱ. request ㄴ.realPath ㄷ.파일 크기 ㄹ. 인코딩 타입 ㅁ. DefaultFileRenamePolicy
// 3. 정보를 끄집어 내보자. Enumeration 으로 전송된 파라미터이름들을 받아오자.
// 4. 파라미터이름에 따른 정보들을 추출해보자.		
		
ServletContext servletContext = getServletContext();
		
String realPath =	servletContext.getRealPath("fileSave");	
		
		
MultipartRequest mr = new MultipartRequest(request,realPath,5*1024*1024,"utf-8",new DefaultFileRenamePolicy());		


Enumeration fileNames = mr.getFileNames();

while(fileNames.hasMoreElements()){
	
	//파일이 전송된 파라미터 이름들
	String fileName = (String)fileNames.nextElement();
	
	//파일이 저장된 이름
	String fileSystemName = mr.getFilesystemName(fileName);
	
	//원래 내가 올렸던 파일 이름
	String fileoriginalName = mr.getOriginalFileName(fileName);
	
	//파일 종류
	String fileContentType = mr.getContentType(fileName);
	
	// 파일을 다운받을 수 있도록 경로 설정
	String downloadurl = request.getContextPath() + "/" + "fileSave" +"/"+ URLEncoder.encode(fileSystemName,"utf-8");
	
	
	%><a href="<%=downloadurl%>"><%=fileoriginalName %></a>
	
	<% 
	
	
}

%>






</body>
</html>