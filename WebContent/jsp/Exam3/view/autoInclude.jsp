<%@ page contentType = "text/html; charset=utf-8" %>
<html>
<head><title>자동 Include 실행</title></head>
<body>

현재 시간은 <%= CURRENT_TIME %> 입니다.


 <%-- 
 
 web.xml에 설정이 걸려있다.
 
 <jsp-config>
   <jsp-property-group>
   <url-pattern>/jsp/Exam3/view/*</url-pattern>
   <include-prelude>/jsp/Exam3/common/variable.jspf</include-prelude>
   <include-coda>/jsp/Exam3/common/footer.jspf</include-coda>
   </jsp-property-group>
   </jsp-config>
 
 
  --%> 

</body>  
</html>