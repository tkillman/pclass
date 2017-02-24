<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="pds.service.ListPdsItemService"%>
<%@page import="pds.model.PdsItemListModel"%>
<%

	// p에는 페이징에서 선택한 숫자
	String pageNumberString = request.getParameter("p");
	
	//초기 페이지 넘버 1페이지
	int pageNumber = 1;
	
	// 요청한 페이지 넘버가 있다면 세팅
	if (pageNumberString != null && pageNumberString.length() > 0) {
		
		pageNumber = Integer.parseInt(pageNumberString);
		
	}
	
	// getPdsItemList(PageNumber) 를 통해 startRow와 endRow에 해당하는 PdsItemListModel을 불러온다.
	
	ListPdsItemService listSerivce = ListPdsItemService.getInstance();
	PdsItemListModel itemListModel = listSerivce.getPdsItemList(pageNumber);
	request.setAttribute("listModel", itemListModel);
	
	// 페이징 처리
	
	if (itemListModel.getTotalPageCount() > 0) {
		
		
		int beginPageNumber = (itemListModel.getRequestPage() - 1) / 10 * 10 + 1;
		
		int endPageNumber = beginPageNumber + 9;
		
		
		// 페이징 처리 
		if (endPageNumber > itemListModel.getTotalPageCount()) {
			endPageNumber = itemListModel.getTotalPageCount();
		}
	
		request.setAttribute("beginPage", beginPageNumber);
		request.setAttribute("endPage", endPageNumber);
		
		
	}
	
%>

<jsp:forward page="list_view.jsp" />

