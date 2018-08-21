<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="include/common/css/reset.css">
<link rel="stylesheet" href="include/common/css/reg.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
#wrap {margin:0 auto; width:100%; height:100%; margin-top:50px; margin-right:10px;}
h3 {text-align:center; margin-top:100px;}
form {margin:0 auto; width:600px; margin-top:50px;}
table {margin:0 auto; width:600px; height:100%; position:relative; }
table,td {border:1px solid #ccc; border-spacing:0;}
table,td input {margin:5px 10px;}
table tr {height:40px;}
table tr td.mInfo {color:#000000; font-weight:bold; text-align:center;}
table tr td.n {background:#D5D5D5;  text-align:center;}
table tr td span.asterisk {color:#FF0000;}
table tr td span.attention_asterisk {color:#FF0000; padding-left:10px;}
table tr td small.c {color:#FF0000; font-size:10px;}
placeholder {font:10px dotum, sanserif;}	
</style>
</head>
<body>
	<div id="wrap">
		<hr />
		<h3>회원가입페이지</h3>
		<form action="regForm.jsp" name="regForm" method="post">
			<table>
				<tr>
					<td class="mInfo">회원정보</td> 
					<td><span class="attention_asterisk"> * (별표)는 필수 체크사항입니다.</span></td>
				</tr>
				<tr>
					<td class="n"><span class="asterisk">*</span> 아이디</td>
					<td><input type="text" name="id" placeholder=" 아이디입력" maxlength="20"> <small class="c">20자 이내 입력</samll></td> 
				</tr>	
				<tr>
					<td class="n"><span class="asterisk">*</span> 비밀번호</td>
					<td><input type="password" name="password" placeholder=" 비밀번호입력" maxlength="20"> <small class="c">20자 이내 입력</samll></td> 
				</tr>
				<tr>
					<td class="n"><span class="asterisk">*</span> 비밀번호확인</td>
					<td><input type="password" name="pwdConfirm" placeholder=" 비밀번호확인" maxlength="20"></td>
				</tr>
				<tr>
					<td class="n"><span class="asterisk">*</span> 이름</td>
					<td><input type="text" name="uername" placeholder=" 이름" maxlength="20"></td>
				</tr>
				<tr>
					<td class="n"><span class="asterisk">*</span> 생년월일</td>
					<td><input type="text" name="birth" placeholder=" 앞 6자리 입력" maxlength="6"></td>
				</tr>
				<tr>
					<td class="n"><span class="asterisk">*</span> 이메일</td>
					<td><input type="text" name="email" placeholder=" email입력" maxlength="30"> <small class="c">30자 이내 입력</samll></td>
				</tr>
				<tr>
					<td class="n"><span class="asterisk">*</span> 주소</td>
					<td><input type="text" name="addr" placeholder=" 주소입력" maxlength="200자 이내"> <small class="c">200자 이내 입력</samll></td>
				</tr>
				<tr>
					<td class="n">&nbsp; 연락처</td>
					<td><input type="text" name="tel" placeholder=" 전화번호입력(10자이내)" maxlength="10"></td>
				</tr>
				<tr>
					<td class="n"><span class="asterisk">*</span> 핸드폰</td>
					<td><input type="text" name="phone" placeholder="-(하이픈)없이입력(11자이내)" maxlength="11"></td>
				</tr>
				<tr>
					<td class="n"><span class="asterisk">*</span> 관리자번호</td>
					<td><input type="text" name="admin" placeholder=" 관리자번호(12자이내)" maxlength="12"></td>
				</tr>
				<tr>
                    <td colspan="2" align="center">
                    	<input type="submit" value="가입하기">
                    	<input type="reset" value="다시작성">
                    </td>
                </tr>
			</table>
		</form>
	</div>	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>