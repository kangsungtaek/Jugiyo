<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.form_input {text-align:center; width:100%; height:38px; position:relative; bottom:20px;}
	.input_txtBox {width:auto; height:auto; margin:0 0 20px 0;}
	.tab_width {text-align:center;}
	.w3-row {margin:0 auto;}
	/*	.hide {display:none;}	*/
</style>
	
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
<footer class="w3-row-padding w3-padding-16 "><!-- footer -->
    <div class="w3-col l10 s6 w3-red">
      <p>
		<b>"저기요(JUGIYO)"</b><br />
		사장님을 흔히 부를 때 쓰는 표현과 장소를 가리키는 표현의 이중적인 의미를 가지고 있습니다.
	  </p>
    </div>
    <div class="w3-col l2 s6 w3-dark-grey">
      <p class="shopReg">
      	<b class="shopReg_inquiry">상점 등록 문의</b><br/>
      	<b class="shopReg_inquiry">02-1588-1588</b>
      </p>
    </div>
</footer><!--//footer -->


	