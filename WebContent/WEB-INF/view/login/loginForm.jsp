<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div id="wrap" class="w3-panel w3-padding-64 w3-orange">
	<!-- 	<form action="loginForm" name="loginForm" method="post"  onsubmit="return inputCheck();">
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
        </form> -->		
 	<form action="/login/loginForm" method="post" id="loginForm">
 		<h2 class="hide"> 로그인</h2>
				<input name="id" type="text" id="id" width="200px;" placeholder=" 아이디" >
				<input name="password" type="password" id="password" width="200px;" placeholder=" 비밀번호" >
			<button type="submit" >로그인</button>
	</form>
</div>
	