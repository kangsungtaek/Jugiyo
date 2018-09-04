<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>JUGIYO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Lato", sans-serif;
}

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
	min-height: 100%;
}

.w3-wide {
	letter-spacing: 10px;
}

.w3-hover-opacity {
	cursor: pointer;
}

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
			<a
				class="w3-bar-item w3-button w3-hover-black w3-hide-medium w3-hide-large w3-right"
				href="javascript:void(0);" onclick="toggleFunction()"
				title="Toggle Navigation Menu"> <i class="fa fa-bars"></i>
			</a> <a href="/index" class="w3-bar-item w3-button">HOME</a>
			<c:choose>
				<c:when test="${ empty sessionScope.vo }">
					<a href="/login/loginForm"
						class="w3-bar-item w3-button w3-hide-small"><i
						class="fa fa-user"></i> 로그인</a>
					<a href="/login/regForm"
						class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><i
						class="fa fa-th"></i> 회원가입</a>
				</c:when>
				<c:otherwise>
					<a href="/member/memInfo"
						class="w3-bar-item w3-button w3-hide-small"><i
						class="fa fa-user"></i> 내정보</a>
					<a href="/main" class="w3-bar-item w3-button w3-hide-small">👋
						주문하기</a>
					<a href="/login/logout"
						class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-red"><i
						class="fa fa-th"></i> 로그아웃</a>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- Navbar on small screens -->
		<div id="navDemo"
			class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium">
			<a href="/index" class="w3-bar-item w3-button"
				onclick="toggleFunction()">HOME</a>
			<c:choose>
				<c:when test="${ empty sessionScope.vo }">
					<a href="/login/loginForm" class="w3-bar-item w3-button "><i
						class="fa fa-user"></i> 로그인</a>
					<a href="/login/regForm"
						class="w3-bar-item w3-button w3-right w3-hover-red"><i
						class="fa fa-th"></i> 회원가입</a>
				</c:when>
				<c:otherwise>
					<a href="/owner/index" class="w3-bar-item w3-button"><i
						class="fa fa-user"></i> 내정보</a>
					<a href="/owner/logout"
						class="w3-bar-item w3-button w3-right w3-hover-red"><i
						class="fa fa-th"></i> 로그아웃</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<!-- First Parallax Image with Logo Text -->
	<div class="w3-opacity bgimg-1" id="home" style="background-image: url('https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/main/bg/main15.jpg')">
		
		<img style="position:absolute; top:100px; left:40%; margin-left:-276px; height: 300px;"
			 src="/images/logo1234.png"/>
		<div style="position:absolute; top:100px; left:50%; width:552px; margin-left:-276px; height: 300px;">
		<form class="bgimg-1" style="white-space: nowrap;" action="/getAddr" id="f">
			<span
				class="w3-display-bottommiddle w3-large w3-wide w3-animate-opacity">
				<input name="addr" id="addr" type="text"
				placeholder="배달받을 주소를 입력해주세요." style="width: 500px;"
				onclick="sample4_execDaumPostcode()" /> <input type="hidden"
				id="lat" name="xcor" /> <input type="hidden" id="lng" name="ycor" />
			</span>
		</form>
		</div>
	</div>
	

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb011d80a6eb4b748c64a426b88f7b1d&libraries=services"></script>
	<script>
		var i=0;
		var images=["https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/main/bg/main3.jpg","https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/main/bg/main9.jpg","https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/main/bg/main10.jpg","https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/main/bg/main6.jpg","https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/main/bg/main14.jpg","https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/main/bg/main18.jpg"];
		
		window.setInterval(function() {
			var d = $("#home").css("background-image");
			console.log(d);
			$("#home").css("background-image","url('"+ images[i++] +"')");
			if(i>=6) {
				i=0;
			}
		}, 3000);

		var geocoder = new daum.maps.services.Geocoder();
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					//document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
					//document.getElementById('sample4_roadAddress').value = fullRoadAddr;
					//document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

					var addr = fullRoadAddr;
					document.getElementById("addr").value = addr;
					console.log(addr);

					geocoder.addressSearch(addr, function(result, status) {
						// 정상적으로 검색이 완료됐으면 
						console.log("ddd" + status);
						if (status === daum.maps.services.Status.OK) {
							var coords = new daum.maps.LatLng(result[0].y,
									result[0].x);

							console.log(coords.getLat());
							console.log(coords.getLng());

							document.getElementById("lat").value = coords
									.getLat();
							document.getElementById("lng").value = coords
									.getLng();

							document.getElementById("f").submit();
						}
					});
				}
			}).open();
		}

	</script>

</body>
</html>
