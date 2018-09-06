<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="../../../include/common/css/style.css" />
	<div id="wrap">
		<div id="header" class="bg">
			<a href="../../../index"><img src="../../../images/logo_n.png" class=" logo_n" alt="로고_n" /></a>
		</div>
		<div id="content"><!-- 컨텐츠 -->
			<form action="/login/regForm" name="regForm" method="post" onsubmit="return validcheck();">
				<table class="reg">
					<tr>
						<th colspan="2"><h3>회원가입페이지</h3></th>
					</tr>
					<tr>
						<th class="mInfo">회원정보</th> 
						<td><small style="color:#ff0000; margin-left:10px;">&nbsp;&nbsp; ※ 아래의 빈 칸에 정확히 입력해 주세요 </small></td> 
					</tr>
					<tr>
						<th class="n"> 아이디</th>
						<td><input type="text" name="id" id="id" class="size" onchange="idCheck(this);" placeholder=" 아이디입력" maxlength="10" required />
						<small class="c" id="ajax">10자 이내 입력</samll></td> 
					</tr>	
					<tr>
						<th class="n"> 비밀번호</th>
	      		    	<td><input type="password" name="password" id="pw" class="size" placeholder=" 비밀번호입력" maxlength="20" required /> 
	      		    	<small class="c" id="pwajax">8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</samll></td>  
	<!-- 				<td><input type="password" name="password" class="size" placeholder=" 비밀번호입력" maxlength="20" required /> <small class="c" id="pass">8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</samll></td>  -->
	
					</tr>
					<tr>
						<th class="n"> 비밀번호확인</th>
						<td><input type="password" name="pwdConfirm" class="size" placeholder=" 비밀번호확인" maxlength="20" required /></td>
					</tr>
					<tr>
						<th class="n"> 닉네임</th>
						<td><input type="text" name="nickname" class="size" placeholder=" 닉네임" maxlength="20" required /></td>
					</tr>
					<tr>
						<th class="n"> 이메일</th>
					<td><input type="text" name="email" id="email" class="size" placeholder=" email입력" maxlength="30" required /> <small class="c" id="emailajax">30자 이내 입력</samll></td>	
					</tr>
					<tr>
						<th class="n"> 주소</th>
						<td>
							<input type="text" placeholder="우편번호" name="zonecode" id="zonecode" size="8" onclick="sample4_execDaumPostcode()" readonly /><br />
							<input type="text" name="addr" id="addr" class="size" placeholder=" 주소입력" size="50" readonly maxlength="100자 이내" onclick="sample4_execDaumPostcode()" /><br />
							<input type="text" name="addr1" class="size" placeholder=" 상세주소입력" size="50" maxlength="100자 이내" />
							<input type="hidden" id="lat" name="xcor" /> 
							<input type="hidden" id="lng" name="ycor" />
						</td>
					</tr>
					<tr>
						<th class="n"> 핸드폰</th>
				 		<td><input type="text" name="contact" id="phone" class="size" placeholder="ex)xxx-xxxx-xxxx" required /><span id="phoneajax"></span></td> 
					</tr>
				</table>
				<p class="btn_reg" colspan="2">
	            	<input type="submit" value="가입하기" />
	                <input type="reset" value="다시작성" />
               <p>
			</form>
		</div><!--// 컨텐츠 -->
	</div><!--//wrap -->	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb011d80a6eb4b748c64a426b88f7b1d&libraries=services"></script>
<script type="text/javascript" src="../../../include/common/js/regF.js"></script>
