<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="include/common/css/reset.css">
<link rel="stylesheet" href="include/common/css/reg.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style>
	#wrap {margin:0 auto; width:100%; height:100%; margin-top:50px; margin-right:10px;}
	h3 {text-align:center; margin-top:100px;}
	form {margin:0 auto; width:600px; margin-top:50px;}
</style>
</head>
<body>
	<div id="wrap">
		<hr />
		<h3>회원전용페이지</h3>
		<form action="loginForm.jsp" name="loginForm" method="post">
			${userid }님 로그인하셨습니다.<br />
			${name }님 환영합니다.<br />
			연락처 ${phone }<br />
			이메일 ${email }<br />
			<input type="button" value="로그아웃" onclick="location.href="logout.jsp">
			<input type="button" value="모든회원보기" onclick="location.href="memberList.jsp">
			<input type="button" value="회원수정페이지" onclick="location.href="memberUpdateForm.jsp">
		</form>
	</div>	
</body>
</html>