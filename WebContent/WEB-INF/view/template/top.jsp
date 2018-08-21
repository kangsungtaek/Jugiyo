<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%-- web.xml 에 context-param 설정하고 그것 출력되게 EL--%>
<title>JUGIYO</title>
<style>
input, button, select {
	padding: 5px;
	font-size: 11pt;
	font-family: 맑은 고딕;
}

td, th {
	text-align: center;
}

th {
	background-color: #C2E2E8;
	border-bottom: 1px dotted;
}

tr {
	height: 30px;
}

a {
	text-decoration: none;
}

.td-title {
	width: 300px;
	text-align: left;
}

.td-cnt {
	width: 50px;
}

a {
	text-decoration: none;
}

ul {
	list-style: none;
	padding: 5px 0px 5px 5px;
	margin-bottom: 5px;
}
</style>
</head>
<body>

<div class="w3-container">
<div class="w3-bar w3-padding-16 w3-red">
  <button class="w3-button w3-left"><img src="../images/logo.png" onclick="location.href='/index'" style="width: 110px; height: 30px;" /></button>
  <c:choose>
  	<c:when test="${ empty sessionScope.log }">
  		<button class="w3-button w3-white w3-border w3-large w3-right">로그인</button> 
  		<button class="w3-button w3-white w3-border w3-large w3-right">회원가입</button>
  	</c:when>
  	<c:otherwise>
  		<button class="w3-button w3-white w3-border w3-large w3-right">로그아웃</button> 
  		<button class="w3-button w3-white w3-border w3-large w3-right">내정보</button>
  	</c:otherwise>
  </c:choose>
  
</div>
</div>

	<hr />
	<div style="min-height: 500px; margin-left: 70px; margin-right: 70px;">