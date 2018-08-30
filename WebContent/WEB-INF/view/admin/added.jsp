<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>JUGIYO</title>
</head>
<body>
<%-- 상점등록 처리결과 보여주는 페이지 --%>
<div style="margin-left:30px;">
	<c:choose>
		<c:when test="${ requestScope.cer }">
			[${ vo.name }]의 사장님에게 <b>${ vo.id }</b>가 부여되었습니다.
		</c:when>
		<c:otherwise>
			입력에 실패하였습니다.
		</c:otherwise>
	</c:choose>
	<button onclick="location.href='/admin/addStore'">업체 등록하기</button>
</div>
</body>
</html> 