<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	
<div id="wrap" class="w3-panel w3-padding-64 w3-orange w3-container">
 	<!-- <form action="loginForm" name="loginForm" method="post"  onsubmit="return inputCheck();">
			<h2 class="hide">아이디 / 이메일 로그인</h2>
			<div class="id_login_wrap">	
                <p>
                    <input type="text" name="id" class="size id" placeholder="아이디 or 이메일" /> 
                    <input type="password" name="pwd" class="size pw" placeholder="비밀번호" />
                </p>                
				<input type="submit" id="btn_login" value="로그인"  />
                <ul class="link">
                	<li class="mem_kakao">
						<a href="regForm" class="mship">회원가입</a> |
						<a href="#" target="_blank"> 아이디</a>·
						<a href="#" target="_blank">비밀번호</a> 찾기 |
					</li>	
               <!-- <li class="p_login"><a href="#">폰번호 로그인</a></li>
					<li class="fit_mem"><span class="txt_regmem"> 회원가입! 혜택과 즐거움, 가입을 통해서 더욱 더 많은 서비스를 받으실 수 있습니다.</li>
                </ul>  
			</div><!--//id_login_wrap
        </form>	-->

	<div class="w3-row" style="width:210px; padding:10px;">
 		<h2 class="hide" style="text-align: center;"> 로그인</h2>
	    <div class="w3-bar w3-black" style="text-align: center;">
    		<button type="button" class="w3-bar-item w3-button tablink w3-red mode"  value="member">개인회원</button>
    		<button type="button" class="w3-bar-item w3-button tablink mode" value="owner">사업자</button>
  		</div>
	 </div>
 	<form action="/login/loginForm" method="post" id="loginForm" >
			<input type="hidden" name="section" id="hs" value="member"/>
			<input name="id" type="text" id="id" width="200px;" placeholder=" 아이디" >
			<input name="password" type="password" id="password" width="200px;" placeholder=" 비밀번호" >
			<button type="submit" >로그인</button>    
	</form>
</div>
<script>
$(".mode").on("click", function(){
	console.log($(this).val());
	$("#hs").val($(this).val());
	$(".mode").removeClass("w3-red");
	$(this).addClass("w3-red");
});
/*
function openCity(evt) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
  }
  evt.currentTarget.className += " w3-red";
}
*/
</script>

	
<!--
   <div id="wrap" class="w3-panel w3-padding-64 w3-orange">
		<h1>로그인</h1>
		<form action="/login/loginForm" name="loginForm" method="post">
			<!-- 아이디 입력창/ 비밀번호 입력창 : placeholder로 아이디, 비밀번호 
			<ul style="padding-left: 30">
			 <li>개인<input type="radio" name="section" value="person" checked="checked">사업자<input type="radio" name="section" value="owner"></li>
			</ul>
			<ul class="mem_login">
					<li><input type="text" name="id" placeholder=" 아이디입력" maxlength="20" style="height:30px;"></li> 
					<li><input type="password" name="password" placeholder=" 비밀번호입력" maxlength="20" style="height:30px;"></li> 
					<li><button type="submit" class="btn">로그인</button></li>
			</ul>
		</form>
	</div>
  -->
	