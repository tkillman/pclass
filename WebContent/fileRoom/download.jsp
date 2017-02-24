<%@ page pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="pds.service.IncreaseDownloadCountService"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="pds.service.PdsItemNotFoundException"%>
<%@page import="pds.file.FileDownloadHelper"%>
<%@page import="pds.model.PdsItem"%>
<%@page import="pds.service.GetPdsItemService"%>
<%
	// 파일에 primary 키로 있는 id값
	int id = Integer.parseInt(request.getParameter("id"));
		
	try {
		
		//이런 response 처리를 해주면 url의 변경없이 response에서 값을 다운받도록 해준다.
		//id값에 맞는 pdsItem을 리턴
		PdsItem item = GetPdsItemService.getInstance().getPdsItem(id);

		// 응답 헤더 다운로드로 설정
		response.reset();
		//setContentType,setHeader 이 두개는 무조건 설정해주어야 한다.
		
		//getBytes 바이트 배열로 바꾸는 메소드, 항상 "iso-8859-1"로 지정
		String fileName = new String(item.getFileName().getBytes("utf-8"), "iso-8859-1");
		
		response.setContentType("application/octet-stream");
		
		//HTML로 보여줄 수 있는 형식이라도 "Content-Disposition", "attachment; 무조건 다운받는 형식으로 바뀐다.
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName+"\"");
		
		
		
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		response.setContentLength((int)item.getFileSize());
		
		response.setHeader("Pragma", "no-cache;");
		
		response.setHeader("Expires", "-1;");
		
		
		
		//response에다가 file을 copy한다.
		FileDownloadHelper.copy(item.getRealPath(), response.getOutputStream());
		
		response.getOutputStream().close();
		
		
		//다운로드 조회수를 늘린다.
		IncreaseDownloadCountService.getInstance().increaseCount(id);
		
		
		
	} catch (PdsItemNotFoundException ex) {
		
		response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		
	}
%>