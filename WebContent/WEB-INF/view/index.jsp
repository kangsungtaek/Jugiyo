
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
<title>JUGIYO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif;}
body, html {
    height: 100%;
    color: #777;
    line-height: 1.8;
}

/* Create a Parallax Effect */
.bgimg-1, .bgimg-2, .bgimg-3 {
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

/* First image (Logo. Full height) */
.bgimg-1 {
    background-image: url("/images/logo.png");
    min-height: 100%;
}

.w3-wide {letter-spacing: 10px;}
.w3-hover-opacity {cursor: pointer;}

/* Turn off parallax scrolling for tablets and phones */
@media only screen and (max-device-width: 1024px) {
    .bgimg-1, .bgimg-2, .bgimg-3 {
        background-attachment: scroll;
    }
}
</style>
</head>
<body>



<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar" id="myNavbar">
    <a class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right" href="javascript:void(0);" onclick="toggleFunction()" title="Toggle Navigation Menu">
      <i class="fa fa-bars"></i>
    </a>
    <a href="/index" class="w3-bar-item w3-button">HOME</a>
    <a href="/login/loginForm" class="w3-bar-item w3-button w3-hide-small"><i class="fa fa-user"></i> 로그인</a>
    <a href="/login/regForm" class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><i class="fa fa-th"></i> 회원가입</a>
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
    <a href="/index" class="w3-bar-item w3-button" onclick="toggleFunction()">HOME</a>
     <a href="/login/loginForm" class="w3-bar-item w3-button "><i class="fa fa-user"></i> 로그인</a>
    <a href="/login/regForm" class="w3-bar-item w3-button w3-right w3-hover-red"><i class="fa fa-th"></i> 회원가입</a>
  </div>
</div>

<!-- First Parallax Image with Logo Text -->
<div class="bgimg-1 w3-display-container w3-opacity-min" id="home">
  <form class="w3-display-middle" style="white-space:nowrap;" action="/getAddr" id="f">
    <span class="w3-display-bottommiddle w3-padding-large w3-large w3-wide w3-animate-opacity">
		<input name="addr" id="addr" type="text" placeholder="배달받을 주소를 입력해주세요." style="width: 500px;" onclick="sample4_execDaumPostcode()" />
	</span>
  </form>
</div>

<script>
/*	function getAddr() {
		window.open("/addr", "new browser", "width=500, height=250");
	}
*/
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
</script>

</body>
</html>
