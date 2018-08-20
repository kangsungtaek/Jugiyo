<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.c {color:#FF0000;}
	placeholder {font:10px dotum, sanserif;}
</style>
</head>
<body>
	<div>
		<h2>회원가입페이지</h2>
		<form action="join.jsp">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" placeholder="아이디입력" maxlength="20"> <small class="c">20자 이내 입력</samll></td> 
				</tr>	
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd" placeholder="비밀번호입력" maxlength="20"> <small class="c">20자 이내 입력</samll></td> 
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="password" name="pwdConfirm" placeholder="비밀번호확인" maxlength="20"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="uername" placeholder="이름" maxlength="20"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="birth" placeholder="앞 6자리 입력" maxlength="6"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="email" placeholder="email입력" maxlength="20"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" placeholder="주소입력" maxlength="200자 이내"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="tel" placeholder="전화번호입력" maxlength="15"></td>
				</tr>
				<tr>
					<td>핸드폰</td>
					<td><input type="text" name="phone" placeholder="핸드폰번호입력" maxlength="12"></td>
				</tr>
				<tr>
					<td>관리자번호</td>
					<td><input type="text" name="admin" placeholder="관리자번호(20자이내)" maxlength="20"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>