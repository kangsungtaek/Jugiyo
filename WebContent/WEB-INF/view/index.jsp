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
<style>
	div,ul,li,ol,img {list-style:none;}
	#wrap {margin:0 auto; width:100%; height:100%; margin-top:10%;border:1px solid blue;}
	form {margin:0 auto; width:700px; margin-top:50px;}
	div ul.search_box {width:100%; height:100%;}
	div ul.search_box li {width:100%; height:100%;}
	div ul.mem_login {width:100%; height:100%;}
	div ul.mem_login li {margin:0 20px; display:inline;}
</style>
</head>
<body>
	<div id="wrap">
		<div>			<form action="login.jsp">
				<img src="../../../images/logo.png"  class="tit" alt="logo" title="로고" />
				<ul class="search_box">
					<li>
						<input type="text" style="padding:5px 5px" size="60" name="search" placeholder=" 검 색 " />
					</li>
				</ul>
				<ul class="mem_login">
					<li><a href="login">로그인</a></li> |
					<li><a href="mem_ship">회원가입</a></li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>