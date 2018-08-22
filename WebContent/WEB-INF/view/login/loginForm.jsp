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
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style>
	div,ul,li,ol,img {list-style:none;}
	#wrap {margin:0 auto; width:100%; height:100%; margin-top:10%; padding:10px; background-color:#CC3D3D;}
	form {margin:0 auto; width:700px; margin-top:50px;}
	h1 {text-align:center;}
	div ul.search_box {width:100%; height:100%;}
	div ul.search_box li {width:100%; height:100%;}
	div ul.mem_login {width:100%; height:100%;}
	div ul.mem_login li {margin:0 20px; display:inline;}
	div ul.mem_login li button.btn {height:35px;}
</style>
</head>
<body>
	<div id="wrap">
		<h1>로그인</h1>
		<form action="loginForm" name="loginForm" method="post">
			<!-- 아이디 입력창/ 비밀번호 입력창 : placeholder로 아이디, 비밀번호 -->
			<ul class="mem_login">
					<li><input type="text" name="id" placeholder=" 아이디입력" maxlength="20" style="height:30px;"></li> 
					<li><input type="password" name="password" placeholder=" 비밀번호입력" maxlength="20" style="height:30px;"></li> 
					<li><button type="submit" class="btn">로그인</button></li>
			</ul>	
		</form>
	</div>	
</body>
</html>