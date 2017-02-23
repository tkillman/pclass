<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<html>
<head><title>업로드 정보</title></head>
<body>
<%
	
// 1. multipart/form-data 여부 확인
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	
	if (isMultipart) {
		
		// 2. 메모리나 파일로 업로드 데이터를 보관하는 FileItem의 Factory 설정
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// 3. 업로드 요청을 처리하는 ServletFileUpload 생성
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("utf-8");
		
		// 4. 업로드 요청 파싱해서 FileItem 목록 구함 , 메모리나 임시 디렉토리에 올려준다.
		List<FileItem> items = upload.parseRequest(request);
		
		//FileItem : 
		Iterator<FileItem> iter = items.iterator();
		
		while (iter.hasNext()) {
			
			FileItem item = iter.next();
			
			// 5. FileItem이 폼 입력 항목인지 여부에 따라 알맞은 처리
			if (item.isFormField()) { // type="file"인 경우 false 반환 나머지 true 반환
				
				String name = item.getFieldName();
				String value = item.getString("utf-8");
				
%>
요청 파라미터: <%= name %>=<%= value %> <br/>
<%

			} else {
				
				// 파라미터이름
				String name = item.getFieldName();
				
				//파일 이름
				String fileName = item.getName();
				
				
				String contentType = item.getContentType();
				
				//용량이 작으면 메모리에 저장시키고 false 반환, 임시 디렉토리에 저장했다면 true 반환
				
				
				boolean isInMemory = item.isInMemory();
			
				
				long sizeInBytes = item.getSize();
				
			  	File file = new File("f://item/"+fileName); 
			  	
			  	//생성된 file에 item의 내용을 쓴다.
				item.write(file);
				
				
%>
파일 : <%= name %>, <%= fileName %>, <%= sizeInBytes %>,<%= contentType %>
<%= isInMemory ? "메모리저장" : "임시파일저장" %>
 <br/>

<%

			}
		}
	} else {
		// multipart/form 아님
		
%>
multipart/form 요청이 아님.
<%
	}
%>
</body>
</html>