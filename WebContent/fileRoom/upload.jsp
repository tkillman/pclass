<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="pds.service.AddPdsItemService" %>
<%@ page import="pds.file.FileSaveHelper" %>
<%@ page import="pds.model.AddRequest" %>
<%@ page import="pds.model.PdsItem" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%
	// 요청 타입이 multipart/form-data 인가? 맞으면 true 아니면 false
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	
	if (!isMultipart) {
		//아니라면 ?????????
		response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}
	
	//fileItem을 만들어주는 DiskFileItemFactory 객체 factory 생성
	DiskFileItemFactory factory = new DiskFileItemFactory();

	// 업로드 요청을 처리할 ServletFileUpload 객체 upload 생성
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setHeaderEncoding("UTF-8");
	
	
	//메모리나 임시 디렉토리에 올린다.
	List<FileItem> items = upload.parseRequest(request);
	
	// fileName; fileSize; realPath; description;을 가진 객체 생성, Dto라고 생각
	AddRequest addRequest = new AddRequest();
	
	Iterator<FileItem> iter = items.iterator();
	while (iter.hasNext()) {
		FileItem item = iter.next();
		if (item.isFormField()) { // type="file" 이면 false 반환 아니면 true 반환
			String name = item.getFieldName();
			if (name.equals("description")) { // input type="text" name="description"
				String value = item.getString("utf-8");
				addRequest.setDescription(value);
			}
		} else { //파일 처리
			
			String name = item.getFieldName();
			if (name.equals("file")) { // input 태그 네임이  file
				String realPath = FileSaveHelper.save("c:\\Java\\pds", item.getInputStream());
				System.out.println(realPath);
				
				addRequest.setFileName(item.getName()); //파일의 원본 이름
				addRequest.setFileSize(item.getSize()); //파일 크기
				addRequest.setRealPath(realPath); //파일의 경로
			}
		}
	}
	
	//addRequest 객체를  AddPdsItemService 를 통해 DB에 add 시키고 add 시킨 PdsItem 객체를 반환
	PdsItem pdsItem = AddPdsItemService.getInstance().add(addRequest);
	
	
%>
<html>
<head><title>업로드 성공</title></head>
<body>
<%= pdsItem.getFileName() %> 파일을 업로드 했습니다.
<br/>
<a href="list.jsp">목록보기</a>
</body>
</html>
