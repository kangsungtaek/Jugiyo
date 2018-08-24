<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
	div,ul,li,ol,img {list-style:none;}
</style>

	<div id="wrap">
		<h1>로그인</h1>
		<form action="loginForm" name="loginForm" method="post">
			<!-- 아이디 입력창/ 비밀번호 입력창 : placeholder로 아이디, 비밀번호 -->
			<ul style="padding-left: 30">
			 <li>개인<input type="radio" name="section" value="person">사업자<input type="radio" name="section" value="owner"></li>
			</ul>
			<ul class="mem_login">
					<li><input type="text" name="id" placeholder=" 아이디입력" maxlength="20" style="height:30px;"></li> 
					<li><input type="password" name="password" placeholder=" 비밀번호입력" maxlength="20" style="height:30px;"></li> 
					<li><button type="submit" class="btn">로그인</button></li>
			</ul>
		</form>
	</div>
	