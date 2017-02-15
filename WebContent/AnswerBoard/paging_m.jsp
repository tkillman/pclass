<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<% 
  String pageNum = "1" ; // 요청한 페이지 -- 클라이언트가 지정 , 
   
  int currentPage= Integer.parseInt(pageNum);
   
   int count=82; //전체 글 갯수
   
   int pageSize= 10; // 보여줄 글의 갯수 -- 내가 지정

   int pageCount = (int)(count/pageSize) + (count%pageSize ==0? 0:1); // 계산된 나올 페이지블럭 갯수
   
   
   int pageBlock = 5; // 페이지 블럭 갯수 -- 내가 지정
   
   
   //이론적인 페이지
   int startPage = (int)(currentPage/pageBlock)*pageBlock +1;// 시작 페이지블럭
   int endPage = startPage + pageBlock -1;// 끝날 페이지 블럭
   
   if(endPage > pageCount){
	   endPage = pageCount;
   }
   
   

%>

글 갯수 : <%= count%><br>

<%

for(int i=startPage ; i<=endPage;i++){
	%> <a href="list.jsp?pageNum=<%=i%>"><%=i%></a><%			
}



%>




</body>
</html>