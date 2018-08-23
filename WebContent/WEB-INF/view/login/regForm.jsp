<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="include/common/css/reset.css">
<link rel="stylesheet" href="include/common/css/reg.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
#wrap {margin:0 auto; width:100%; margin-top:50px; margin-right:10px;}
h3 {text-align:center; margin-top:80px;}
form {margin:0 auto; width:650px; margin-top:30px;}
small {padding:0 0 0 10px; color:red;}
/*placeholder {font:8px dotum sanserif;}*/
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	//ID 중복체크.
	$(document).ready(function() {
		$("regFrom").click(function() {
			if($("#id").val()) {
				var query = {id:$("#id").val()};
				$.ajax({
					url  : "/login/regForm",
					type : "post",
					data : query,
					success : function(data) {
						if(data==1) {
							document.getElementById("ajax").innerHTML="사용할 수 없는 아이디입니다.";
							$("#id").val("");
						}else if(data==-1) {
							document.getElementById("ajax").innerHTML="사용할 수 있는 아이디입니다.";
						}
					}
				});
			}else {
				document.getElementById("ajax").innerHTML="사용할 아이디를 입력하세요.";
				$("#id").focus();
			}	
		});	
	});
	
	/*=================================*/
	
//비밀번호 체크 : 숫자랑 영문조합으로 -> document.getElementById("pwajax").innerHTML="사용가능합니다.";

//이메일 체크 : 이메일 형식이 맞는지 --@--.--

//핸드폰번호 체크 : 01[06789]\\d{3,4}\\d{4}가 맞는지

	
</script>

	<div id="wrap">
		<hr />
		<h3>회원가입페이지</h3>
		<form action="/login/regForm" name="regForm" method="post">
			<table class="reg">
				<tr>
					<td class="mInfo">회원정보</td> 
					<td><small> ※ 아래의 빈 칸에 정확히 입력해 주세요 </small></td>  
				</tr>
				<tr>
					<td class="n"> 아이디</td>
					<td><input type="text" name="id" id="id" placeholder=" 아이디입력" maxlength="20" required />
					<small class="c" id="ajax">20자 이내 입력</samll></td> 
				</tr>	
				<tr>
					<td class="n"> 비밀번호</td>
					<td><input type="password" name="password" placeholder=" 비밀번호입력" maxlength="20" required /> <small class="c" id="pwajax">20자 이내 입력</samll></td> 
				</tr>
				<tr>
					<td class="n"> 비밀번호확인</td>
					<td><input type="password" name="pwdConfirm" placeholder=" 비밀번호확인" maxlength="20" required /></td>
				</tr>
				<tr>
					<td class="n"> 닉네임</td>
					<td><input type="text" name="nickname" placeholder=" 이름" maxlength="20" required /></td>
				</tr>
				<tr>
					<td class="n"> 이메일</td>
					<td><input type="text" name="email" placeholder=" email입력" maxlength="30" required /> <small class="c" id="emailajax">30자 이내 입력</samll></td>
				</tr>
				<tr>
					<td class="n"> 주소</td>
					<td><input type="button" value="우편번호" /><input type="text" size="1" maxlength="3">-<input type="text" size="1" maxlength="3"><br /> 
					<input type="text" name="addr" placeholder=" 주소입력" size="60" readonly maxlength="100자 이내" required /><br />
					<input type="text" name="addr" placeholder=" 상세주소입력" size="60" maxlength="100자 이내" required /></td>
				</tr>
				<tr>
					<td class="n"> 핸드폰</td>
					<td><input type="text" name="contact" placeholder="-(하이픈)없이입력(11자이내)" maxlength="11" required /><span id="phoneajax"></span></td>
				</tr>
				<tr>
                    <td colspan="2" align="center">
                    	<input type="submit" value="가입하기" />
                    	<input type="reset" value="다시작성" />
                    </td>
                </tr>
			</table>
		</form>
	</div>	
