<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Throwable throwable = (Throwable) request.getAttribute("javax.servlet.errorexception");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지(error page)</title>
<title>JUGIYO</title>
<script>
</script>
</head>
<body>
	<h3>요청 처리 실패</h3>
	<p>
		잘못된 요청정보이거나, 서버측의 장애로 해당 요청을 처리하지 못하였습니다.<br/>
		error : <c:out value="${requestScope['javax.servlet.error.message']}" />
	</p>
	<b>${name}</b>:  ${message}
	<a href="../../../index">
		<img src="../images/logo_s.png" class="logo_s" alt="로고">
	</a>
	<p>
		<a href="/"><button>홈으로</button></a> 
		<a href="/login/loginForm"><button>로그인하기</button></a>
	</p>
</body>
</html>