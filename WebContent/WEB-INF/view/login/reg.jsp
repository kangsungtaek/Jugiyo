<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.userInfo {margin-left:200px; border:1px solid green;}
	a {color:#000; text-decoration:none; background:#D5D5D5;}
	a:hover {text-decoration:underline;}
	.privatePic {width:50px; height:55px;}
	.mInfo {width:16px; text-decoration:underline;}
	.Info_lock {width:12px; height:12px;}
</style>
<body>
<%--<c:choose>
		<c:when test="not empty sessionScope.userLoginInfo">
		
		
		</c:when>
		<c:otherwisse>
		
		</c:otherwisse>
		
	</c:choose>	
--%>
			<h2>로그인 성공</h2>
			<p class="userInfo">
				<img src="../../../images/privatePic.png" class="privatePic" /> ${sessionScope.member.nickname } 님
				<a href="logout">로그아웃</a>
				<a href="login/reg" class="mInfo"> 내정보 </a><a href="#"><img class="Info_lock" src="../../../images/lock.png" alt="잠금장치 이미지" /></a>
			</p>
<%--		<h2>로그인</h2>
			<form name="loginForm" method="post" action="loginProc">
				<table>
					<tr>
						<input type="text" name="userId">
						<input type="text" name="password">
					</tr>
				</table>
			</form>--%>
	
	<!-- 주문하러가기 버튼 -->
</body>	
<script type="text/javascript" src="../../../include/common/js/1.12.4.min.js"></script>
<script type="text/javascript" src="../../../include/common/js/jquery-ui.min.js"></script>
	
	
	
