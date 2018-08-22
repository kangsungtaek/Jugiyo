<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>JUGIYO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
}

body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif;}
body, html {
    height: 100%;
    color: #777;
    line-height: 1.8;
}

/* Create a Parallax Effect */
.bgimg-1, .bgimg-2, .bgimg-3 {
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

/* First image (Logo. Full height) */
.bgimg-1 {
    background-image: url("/images/logo.png");
    min-height: 100%;
}

.w3-wide {letter-spacing: 10px;}
.w3-hover-opacity {cursor: pointer;}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1024px) {
    .bgimg-1, .bgimg-2, .bgimg-3 {
        background-attachment: scroll;
    }
}
</style>
</head>
<body>
<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar" id="myNavbar">
    <a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
      <i class="fa fa-bars"></i>
    </a>
    <a href="/index" class="w3-bar-item w3-button">HOME</a>
    <c:choose>
    	<c:when test="${ empty sessionScope.vo }">
    		<a href="/login/loginForm" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i> 로그인</a>
    		<a href="/login/regForm" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><i class="fa fa-th"></i> 회원가입</a>
    	</c:when>
    	<c:otherwise>
    		<a href="/member/memInfo" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i>내정보</a>
    		<a href="/login/logout" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><i class="fa fa-th"></i> 로그아웃</a>
    	</c:otherwise>
    </c:choose>
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
    <a href="/index" class="w3-bar-item w3-button" onclick="toggleFunction()">HOME</a>
     <a href="/login/loginForm" class="w3-bar-item w3-button "><i class="fa fa-user"></i> 로그인</a>
    <a href="/login/regForm" class="w3-bar-item w3-button w3-right w3-hover-red"><i class="fa fa-th"></i> 회원가입</a>
  </div>
</div>
