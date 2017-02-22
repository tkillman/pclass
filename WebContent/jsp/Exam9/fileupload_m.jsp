<%@page import="java.io.File"%>
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

//1. MultipartRequest 로 저장된 값을 저장한다.
//2. 멀티 파트에 필요한 인자?? ㄱ. request 객체, ㄴ.웹 어플리케이션 상의 절대 경로, ㄷ. 파일 크기 , ㄹ. 인코딩 방식, ㅁ. DefaultFileRenamePolicy 지정해준다.
//3. 파일 정보를 끄집어 내보자! Enumeration에 getfileNames 로 이름들을 꺼내온다.		
//4. ㄱ.시스템 상에 저장된 이름, ㄴ. 실제 내가 올릴 때 이름, ㄷ. 파일 종류 ㄹ.파일 객체


ServletContext context = getServletContext();	
		


String realPath =  context.getRealPath("fileSave");		
		
MultipartRequest mr = new MultipartRequest(request,realPath, 5*1024*1024, "utf-8",new DefaultFileRenamePolicy());


Enumeration fileNames = mr.getFileNames();

while(fileNames.hasMoreElements()){
	
	//request로 전송한 파라미터 이름
	String fileName = (String)fileNames.nextElement();
	
	//시스템 상의 이름
	String fileSystemName = mr.getFilesystemName(fileName);
	
	// 실제 오리지날 이름
	String fileOriginalName = mr.getOriginalFileName(fileName);
	
	//파일 종류
	String fileType = mr.getContentType(fileName);
	
	//파일 객체
	File file = mr.getFile(fileName);
	
	
	long filelength = file.length();
	out.println(fileName +"," +fileSystemName + "," +fileOriginalName + "," +fileType + "," );
	out.println(filelength);
	
	
	
	
}

%>

</body>
</html>