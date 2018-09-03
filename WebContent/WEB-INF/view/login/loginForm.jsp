<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.form_input {text-align:center; width:100%; height:38px; position:relative; bottom:20px;}
	.w3-row {margin:0 auto;}
	/*-- top.jsp--*/
	.bg {width:100%; height:auto; border:1px solid #ccc;}	
	.bg p {width:100%; height:auto; text-align:center;}
	.logo_b {width:400px; height:100px; text-align:center; margin-top:4px;}	
	.w3-orange {width:100%; height:auto; position:absolute; top:86px; border:1px solid #ccc;}
	/*	.hide {display:none;}	*/
		/*-- bottom.jsp--*/
	footer {width:100%; height:100px; margin-top:0px; border:1px solid #ccc;}
	p.shopReg {text-align:center;}
	p.shopReg b.shopReg_inquiry {text-align:center;}
</style>

<div id="wrap" class="w3-panel w3-padding-64 w3-orange w3-container">
	<div class="w3-row" style="width:169px;">
 		<h2 class="hide" style="text-align: center;"> 로그인</h2>
	    <div class="w3-bar w3-black" style="text-align: center;">
    		<button type="button" class="w3-bar-item w3-button tablink w3-red mode" value="member">개인회원</button>
    		<button type="button" class="w3-button w3-button mode" value="owner">사업자</button>
  		</div>
	 </div>
 	<form action="/login/loginForm" method="post" class="form_input" id="loginForm" >
			<input type="hidden" name="section" id="hs" value="member"/>
			<input name="id" type="text" id="id" class="input_txtBox" width="200px;" placeholder=" 아이디" >
			<input name="password" type="password" class="input_txtBox" id="password" width="200px;" placeholder=" 비밀번호" >
			<button type="submit" class="input_txtBox">로그인</button>    
	</form>
</div>
<div class="bg">
	<p>
		<a href="../../../index"><img src="../images/logo_b.png" class="alt="로고_b"></a>
	</p>
</div>
<div id="wrap" class="w3-panel w3-padding-64 w3-orange w3-container">
	<div class="w3-row" style="width:169px;">
 		<h2 class="hide" style="text-align: center;"> 로그인</h2>
	    <div class="w3-bar w3-black" style="text-align: center;">
    		<button type="button" class="w3-bar-item w3-button tablink w3-red mode" value="member">개인회원</button>
    		<button type="button" class="w3-button w3-button" value="owner">사업자</button>
  		</div>
	 </div>
 	<form action="/login/loginForm" method="post" class="form_input" id="loginForm" >
			<input type="hidden" name="section" id="hs" value="member"/>
			<input name="id" type="text" id="id" class="input_txtBox" width="200px;" placeholder=" 아이디" >
			<input name="password" type="password" class="input_txtBox" id="password" width="200px;" placeholder=" 비밀번호" >
			<button type="submit" class="input_txtBox">로그인</button>    
	</form>
</div>
<!-- <script src="../../../js/w3-mode.js"></script>	-->


	