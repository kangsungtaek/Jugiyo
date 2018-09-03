<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>off
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지(error page)</title>
</head>
<body>
	<h3>요청 처리 실패</h3>
	<p>
		잘못된 요청정보이거나, 서버측의 장애로 해당 요청을 처리하지 못하였습니다.
	</p>
	<b>${name}</b>:  ${message}
	<a href="../../../index">
		<img src="../images/logo_s.png" class="logo_s" alt="로고">
	</a>
</body>
</html>