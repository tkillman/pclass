<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head><title>함수 사용</title></head>
<body>
<c:set var="str1" value="Functions <태그>를 사용합니다. " />
<c:set var="str2" value="사용" />
<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />

length(str1) = ${fn:length(str1)} //길이를 알려준다.<br>
toUpperCase(str1) = "${fn:toUpperCase(str1)}" //대문자로 바꾼다.<br>
toLowerCase(str1) = "${fn:toLowerCase(str1)}" //소문자로 바꾼다.<br>
substring(str1, 3, 6) = "${fn:substring(str1, 3, 6)}" //c(3)부터~i(6)까지 출력<br>
substringAfter(str1, str2) = "${fn:substringAfter(str1, str2)}" //"사용" 이후인 합니다 출력<br>
substringBefore(str1, str2) = "${fn:substringBefore(str1, str2)}" //"사용" 이전 출력<br>
trim(str1) = "${fn:trim(str1)}" //좌우 공백 제거 <br>
replace(str1, src, dest) = "${fn:replace(str1, " ", "-")}" //공백을 "-" 대체 <br>
indexOf(str1, str2) = "${fn:indexOf(str1, str2)}" //사용이 있는 위치를 반환 <br>
startsWith(str1, str2) = "${fn:startsWith(str1, 'Fun')}" //"Fun" 으로 시작하는가? boolean 반환<br>
endsWith(str1, str2) = "${fn:endsWith(str1, "합니다. ")}" // "합니다. " 로 끝나는가? boolean 반환<br>
contains(str1, str2) = "${fn:contains(str1, str2)}" //있으면 true 반환 <br>
containsIgnoreCase(str1, str2) = "${fn:containsIgnoreCase(str1, 'fn')}" //대소문자를 무시하고 포함하는지 확인한다. <br>

<c:set var="array" value="${fn:split(tokens, ',')}" /> 

join(array, "-") = "${fn:join(array, "-")}" //배열 하나 하나에 "-" 추가해준다. <br>
escapeXml(str1) = "${fn:escapeXml(str1)}" // 특수문자 중 태그에 사용되는 것들을 교체해준다. 페이지 소스보기 하기 <br>

</body>
</html>