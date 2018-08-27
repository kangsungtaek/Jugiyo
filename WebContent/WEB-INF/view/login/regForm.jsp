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
#wrapreg {margin:0 auto; width:100%; margin-top:50px; margin-right:10px;}
h3 {text-align:center; margin-top:80px;}
form {margin:0 auto; width:650px; margin-top:30px;}
small {padding:0 0 0 10px; color:red;}
/*placeholder {font:8px dotum sanserif;}*/

table {margin:0 auto; width:650px; height:100%; position:relative; }
table,td {border:1px solid #ccc; border-spacing:0;}
table,td input {padding-left:5px; margin:5px 10px;}
table tr {width:auto; height:40px;}
table tr td.mInfo {width:120px; color:#000000; font-weight:bold; text-align:center;}
table tr td.n {background:#D5D5D5;  text-align:center;}
table tr td span.asterisk {color:#FF0000;}
table tr td span.attention_asterisk {color:#FF0000; padding-left:10px;}
table tr td input.zip {text-align:center;}
table tr td small.c {color:#FF0000; font-size:10px;}
.size::-webkit-input-placeholder {font:11px nanumGothic sanserif;}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	// ID 중복체크(ajax).
/*	$(document).ready(function() {
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
*/	

	/*-------- //ID 중복체크 -----------*/ 
	function idCheck(target) {
		var id = target.value;
	//	console.log(id);
		
		if (id.length > 2) {
			if (!id.match("^[a-zA-Z0-9]*$")) {
				document.getElementById("ajax").innerHTML="아이디형식에 맞지 않습니다.";
				document.getElementById("id").value = "";
			}else {	
				var xhr = new XMLHttpRequest();
				xhr.open("get", "/ajax/regForm?id="+id, true);
				xhr.onreadystatechange =function() {
					if(xhr.readyState==4) {
						var ar = JSON.parse(xhr.responseText);
						if(ar=="1") {
							document.getElementById("ajax").innerHTML="사용할 수 없는 아이디입니다.";
							document.getElementById("id").value="";
						}else {
							document.getElementById("ajax").innerHTML="사용할 수 있는 아이디입니다.";
						}
					}
			  }	
				xhr.send();
			}
		}
	}
	
	
	$("#password").off("focus").on("focus", function() {
		password(this);
	});

	
	// 비밀번호 체크 : 숫자랑 영문조합으로 -> document.getElementById("pwajax").innerHTML="사용가능합니다.";
	function password(target){
		var password = target.value;
	//	console.log("password:" + password)
		var pwRule = /^[a-zA-Z0-9]{8,20}$/;
		if(!pwRule.test(password)) {
	 		//alert("비밀번호는 숫자와 영문자 조합으로 8~20자리를 사용해야 합니다.");
	 		document.getElementById("pwajax").innerHTML="사용가능합니다.";
		}
		var chk_num = password.search(/[0-9]/g);
		var chk_eng = password.search(/[a-z]/ig);
	
		if(chk_num < 0 || chk_eng < 0) {
			document.getElementById("pwajax").innerHTML="비밀번호는 숫자와 영문자를 혼용하여야 합니다.";
	 	}
	
		if(/(\w)\1\1\1/.test(password)) {
			document.getElementById("pwajax").innerHTML="비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.";
	 	}
	
		if(password.search(id)>-1) {
			document.getElementById("pwajax").innerHTML="ID가 포함된 비밀번호는 사용하실 수 없습니다.";
	 	}
	}
	
	// 이메일(email) 체크 : 이메일 형식이 맞는지 --@--.-- 
	function validateEmail(elementValue) {
		
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
		
		// 또는 var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
		// return emailPattern.test(elementValue);
	}	
	/*-------------------//---------------------------*/

	/*== 주소입력 ==
	
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

             
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                //document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                //document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                
                var addr = data.zonecode + "/" + fullRoadAddr;
                document.getElementById("addr").value = addr;
                console.log(addr);
              // location.href="/getAddr?addr=" + addr;
                document.getElementById("f").submit();
            }
        }).open();
    }
    
    /*=================================*/
	
  //비밀번호 체크 : 숫자랑 영문조합으로 -> document.getElementById("pwajax").innerHTML="사용가능합니다.";
  
  //이메일 체크 : 이메일 형식이 맞는지 --@--.--

  //핸드폰번호 체크 : 01[06789]\\d{3,4}\\d{4}가 맞는지
	 
</script>
</head>
<body>
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
					<td><input type="text" name="id" id="id" class="size" onkeyup="idCheck(this);" placeholder=" 아이디입력" maxlength="10" required />
					<small class="c" id="ajax">10자 이내 입력</samll></td> 
				</tr>	
				<tr>
					<td class="n"> 비밀번호</td>
					<td><input type="password" name="password" class="size" placeholder=" 비밀번호입력" maxlength="20" required /> <small class="c" id="pwajax">8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</samll></td> 
				</tr>
				<tr>
					<td class="n"> 비밀번호확인</td>
					<td><input type="password" name="pwdConfirm" class="size" placeholder=" 비밀번호확인" maxlength="20" required /></td>
				</tr>
				<tr>
					<td class="n"> 닉네임</td>
					<td><input type="text" name="nickname" class="size" placeholder=" 닉네임" maxlength="20" required /></td>
				</tr>
				<tr>
					<td class="n"> 이메일</td>
					<td><input type="text" name="email" class="size" placeholder=" email입력" maxlength="30" required /> <small class="c" id="emailajax">30자 이내 입력</samll></td>
				</tr>
				<tr>
					<td class="n"> 주소</td>
					<td><input type="button" value="우편번호" /><input type="text" size="1" class="zip" maxlength="3">-<input type="text" class="zip" size="1" maxlength="3"><br /> 
					<input type="text" name="addr" class="size" placeholder=" 주소입력" size="60" readonly maxlength="100자 이내" required /><br />
					<input type="text" name="addr1" class="size" placeholder=" 상세주소입력" size="60" maxlength="100자 이내" required /></td>
				</tr>
				<tr>
					<td class="n"> 핸드폰</td>
			 	 	<td><input type="text" name="contact" class="size" placeholder=" - (하이픈) 없이입력 (11자이내 )" maxlength="11" required /><span id="phoneajax"></span></td> 
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
