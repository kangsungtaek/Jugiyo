
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

	//-------- //ID 중복체크 ----------- 
	function idCheck(target) {
		var id = target.value;
		console.log(id);
		
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
						if(ar==1) {
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

/*	
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
    
    /*=================================*/
	
  //비밀번호 체크 : 숫자랑 영문조합으로 -> document.getElementById("pwajax").innerHTML="사용가능합니다.";
  
  //이메일 체크 : 이메일 형식이 맞는지 --@--.--

  //핸드폰번호 체크 : 01[06789]\\d{3,4}\\d{4}가 맞는지
  
 
   var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
   var passRule = /^[a-zA-Z0-9!@#$%^&*()?_~]{8,20}$/;
   var phoneRule =/^\d{3}-\d{3,4}-\d{4}$/;
   
   $("#email").on("change", function() {   // id 가져올때는 #을 붙여
	   console.log($(this).val());
         $("#emailajax").val("");   // #emailCheck는 span id
      if (emailRule.test($("#email").val())) {
            var rCheck = r.rst;
            if(rCheck == "YYYY") {
               $("#emailajax").css("color", "green");
               $("#emailajax").html("사용가능한 Email 입니다.");
            }else {
               $("#emailajax").css("color", "red");
               $("#emailajax").html("이미 사용중인 Email 입니다.");
            }
      } else {
         $("#emailajax").css("color", "red");
         $("#emailajax").html("Email 형식에 맞지 않습니다.");
      }
   });
   
   $("#pw").on("change", function() {
	   console.log($(this).val());
      $("#pwajax").val("");
      if(passRule.test($(this).val())) {
         $("#pwajax").css("color", "green");
         $("#pwajax").html("사용가능한 비밀번호 입니다.")
      }else {
         $("#pwajax").css("color", "red");
         $("#pwajax").html("비밀번호 형식에 맞지 않습니다.");   
      }
   });
   
   $("#phone").on("change", function() {
	   console.log($(this).val());
      $("#phoneajax").html("");
      if(phoneRule.test($(this).val())) {
         $("#phoneajax").css("color", "green");
         $("#phoneajax").html("사용가능한 폰번호 입니다.");
      }else {
         $("#phoneajax").css("color", "red");
         $("#phoneajax").html("폰번호 형식에 맞지 않습니다.");   
      }
   });
   

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
                document.getElementById('zonecode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr').value = fullRoadAddr;
                //document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
				
            }
        }).open();
    }
