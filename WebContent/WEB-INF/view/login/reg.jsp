<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입성공</title>
<style>
	a {color:#000; text-decoration:none; background:#D5D5D5;}
	a:hover {text-decoration:underline;}
	.privatePic {width:50px; height:50px;}
	.mInfo {width:16px; text-decoration:underline;}
	.Info_lock {width:12px; height:12px;}
</style>
</head>
<body>
	<div>
		<img src="../../../images/privatePic.png" class="privatePic" /><a href="id=${member.nickname}" class="mem_welcome">${ member.nickname } 님 환영합니다.</a>
		<a href="login/reg" class="mInfo"> 내정보 </a><a href="#"><img class="Info_lock" src="../../../images/lock.png" alt="잠금장치 이미지" /></a>
	</div>
	<!-- 주문하러가기 버튼 -->
</body>
</html>