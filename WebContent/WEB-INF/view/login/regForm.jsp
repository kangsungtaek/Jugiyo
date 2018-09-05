<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	/*-- 헤더--*/
	#wrap #header {width:100%; height:130px; position:relative; bottom:105px;}
	
	/*-- 헤더 백그라운드(background)--*/
	#wrap .bg {width:100%; height:130px; background:#F15F5F;}
	
	/*-- 컨텐츠 --*/
	#wrap #content {margin:0 auto; width:1000px; height:620px;}  
	
	/*-- 폼(form)--*/
	#wrap #content form {width:1000px; height:620px;  position:relative; bottom:40px;}
	
	/*-- 테이블(table) --*/
	#wrap #content form table {width:100%; height:560px; border:1px solid #ccc;}
	
	/*-- 타이틀(title:회원가입페이지) --*/
	#wrap #content form table tr th.tit_join {width:100%; height:30px; line-height:55px; color:#000; border:1px solid #ccc; }
	
	/*-- 회원정보(mInfo) --*/
	table tr th {width:150px; height:30px; line-height:40px; background:#EAEAEA;}
	table tr th.mInfo {text-align:center; width:130px; height:40px; color:#000;}
	
</style>
	<div id="wrap">
		<div id="header" class="bg"></div>
		<div id="content"><!-- 컨텐츠 -->
			<form action="/login/regForm" name="regForm" method="post" onsubmit="return validcheck();">
				<table class="reg">
					<tr>
						<th class="tit_join" colspan="2"><h3>회 원 가 입 페 이 지</h3></th>
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
					<tr>
                    	<td colspan="2" style="text-align:center; padding:15px 20px;">
	                    	<input type="submit" value="가입하기" />
	                    	<input type="reset" value="다시작성" />
                    	</td>
	            	</tr>
				</table>
			</form>
		</div><!--// 컨텐츠 -->
		<h3 style="text-align:center; padding-top:15px;">회원가입페이지</h3>
		<form action="/login/regForm" name="regForm" method="post" onsubmit="return validcheck();">
			<table class="reg">
				<tr>
					<td class="n mInfo">회원정보</td> 
					<td><small style="color:#ff0000; margin-left:10px;">&nbsp;&nbsp; ※ 아래의 빈 칸에 정확히 입력해 주세요 </small></td> 
				</tr>
				<tr>
					<td class="n"> 아이디</td>
					<td><input type="text" name="id" id="id" class="size" onchange="idCheck(this);" placeholder=" 아이디입력" maxlength="10" required />
					<small class="c" id="ajax">10자 이내 입력</samll></td> 
				</tr>	
				<tr>
					<td class="n"> 비밀번호</td>
      		    	<td><input type="password" name="password" id="pw" class="size" placeholder=" 비밀번호입력" maxlength="20" required /> 
      		    	<small class="c" id="pwajax">8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</samll></td>  
<!-- 				<td><input type="password" name="password" class="size" placeholder=" 비밀번호입력" maxlength="20" required /> <small class="c" id="pass">8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</samll></td>  -->

				</tr>
				<tr>
					<td class="n"> 비밀번호확인</td>
					<td><input type="password" name="pwdConfirm" id="pwck" class="size" placeholder=" 비밀번호확인" maxlength="20" required />
					<small id="pwckajax"></small>
					</td>
				</tr>
				<tr>
					<td class="n"> 닉네임</td>
					<td><input type="text" name="nickname" class="size" placeholder=" 닉네임" maxlength="20" required /></td>
				</tr>
				<tr>
					<td class="n"> 이메일</td>
				<td><input type="text" name="email" id="email" class="size" placeholder=" email입력" maxlength="30" required /> <small class="c" id="emailajax">30자 이내 입력</samll></td>	
				</tr>
				<tr>
					<td class="n"> 주소</td>
					<td>
						<input type="text" placeholder="우편번호" name="zonecode" id="zonecode" size="8" onclick="sample4_execDaumPostcode()" readonly /><br />
						<input type="text" name="addr" id="addr" class="size" placeholder=" 주소입력" size="50" readonly maxlength="100자 이내" onclick="sample4_execDaumPostcode()" /><br />
						<input type="text" name="addr1" class="size" placeholder=" 상세주소입력" size="50" maxlength="100자 이내" />
						<input type="hidden" id="lat" name="xcor" /> 
						<input type="hidden" id="lng" name="ycor" />
					</td>
				</tr>
				<tr>
					<td class="n"> 핸드폰</td>
			 		<td><input type="text" name="contact" id="phone" class="size" placeholder="ex)xxx-xxxx-xxxx" required /><span id="phoneajax"></span></td> 
				</tr>
				<tr>
                    <td colspan="2" align="center">
                    	<input type="submit" value="가입하기" />
                    	<input type="reset" value="다시작성" />
                    </td>
                </tr>
			</table>
		</form>
	</div><!--//wrap -->	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb011d80a6eb4b748c64a426b88f7b1d&libraries=services"></script>
<script type="text/javascript" src="../../../include/common/js/regF.js"></script>
