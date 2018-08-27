<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../../../include/common/css/style.css" />

<div id="wrap">
		<form action="loginForm" name="loginForm" method="post"  onsubmit="return inputCheck();">
			<h2 class="hide">아이디 / 이메일 로그인</h2>
			<div class="id_login_wrap">	
				<ul>
					<li class="login_keep">
						<input type="checkbox" class="chk_box" value="check">
						<a href="#" target="_blank" class="k_login color">로그인 상태 유지</a> |
						<a href="#" target="_blank" class="ip color">IP보안</a>
					<!--<a href="#" target="_blank"><img src="../../../images/btn_d_on.png" class="on_off" alt="btn_d_on"></a> -->
						<a href="#" target="_blank"><input type="button" id="1" value="ON" class="btn_onOff" onclick="toggle(this);"></a>
					</li>
				</ul>
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
						<a href="#" target="_blank"><img src="../../../images/kakao_logo.png" class="kakao" alt="카카오 로그인" /> 카카오 로그인</a>
					</li>	
               <!-- <li class="p_login"><a href="#">폰번호 로그인</a></li>-->
					<li class="fit_mem"><span class="txt_regmem"> 회원가입! 혜택과 즐거움, 가입을 통해서 더욱 더 많은 서비스를 받으실 수 있습니다.</li>
                </ul>  
			</div><!--//id_login_wrap-->
        </form> 		
  <!--  <form action="/login/loginPost" method="post" id="loginForm">
				<div class="form-group label-floating">
					<label class="control-label">이메일 주소</label> <input name="userEmail" type="text" id="exampleInputEmail1" class="form-control" value="${cookie.rememberID.value}">
				</div>
				<div class="form-group label-floating">
					<label class="control-label">비밀번호</label> <input name="userPwd" type="password" id="exampleInputPassword1" class="form-control">
				</div>
				<div class="checkbox">
					<label> <input type="checkbox" name="rememberEmail"> 아이디저장 </label>
					<label> <input type="checkbox" name="useCookie"> 자동로그인 </label>
				</div>
				<button type="submit" class="btn btn-default">로그인</button>
		</form>  -->
<script type="text/javascript" src="../../../include/common/js/jquery-1.12.4.min.js"></script>	
<script type="text/javascript" src="../../../include/common/js/jquery-off.js"></script>	
<script type="text/javascript" src="../../../include/common/js/jquery-ui.min.js"></script>		
</div>
	