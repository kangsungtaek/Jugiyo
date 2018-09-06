<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

<div style="min-height:50px"></div>

<div class="w3-center">
  <h4>JUGIYO : 맛집을 즐기자</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom">${ sessionScope.vo.nickname }님의 맛있는 일지</h1>
</div>


<div class="w3-row-padding w3-center w3-margin-top">
<div class="w3-third">
  <div class="w3-card w3-container" style="min-height:460px" onclick="location.href='/member/history'">
  <h3>주문내역</h3><br>
  <i class="fa fa-desktop w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
  <p>${ sessionScope.vo.nickname }님의 맛있는 행보를 확인하세요.</p>
  </div>
</div>

<div class="w3-third">
  <div class="w3-card w3-container" style="min-height:460px" onclick="sample4_execDaumPostcode()">
  <h3>내집등록</h3><br>
  <i class="fa fa-css3 w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
  <p>매번 입력할 필요없이 주소를 등록해주세요.</p>
  <p>[ 등록된 주소 ]<br/><span id="addr">${ sessionScope.vo.address}</span></p>
  </div>
</div>

<div class="w3-third">
  <div class="w3-card w3-container" style="min-height:460px" onclick="location.href='/member/coupon'">
  <h3>멤버쉽등급</h3><br>
  <i class="fa fa-diamond w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
  <p>맛있는 주문만큼 쌓이는 포인트 </p>
  <p>${ sessionScope.vo.nickname }님의 현재 포인트 : <b>${ sessionScope.vo.point }</b>
  <br/><small>(10000포인트부터 사용가능합니다.)</small></p>
  <p>당신의 멤버쉽등급은 <b>${sessionScope.vo.membership}</b>입니다.
     <br/> 사용가능한 쿠폰이 ${ fn:length(vo.coupons) }개 있습니다.
  </p>
  </div>
</div>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb011d80a6eb4b748c64a426b88f7b1d&libraries=services"></script>
<script>
var geocoder = new daum.maps.services.Geocoder();
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
                
                var addr = fullRoadAddr;
            console.log(addr);

            geocoder.addressSearch(addr, function(result, status) {
               // 정상적으로 검색이 완료됐으면 
               console.log("ddd" + status);
               if (status === daum.maps.services.Status.OK) {
                  var coords = new daum.maps.LatLng(result[0].y,
                        result[0].x);

                  console.log(coords.getLat());
                  console.log(coords.getLng());
                  
                      var xhr = new XMLHttpRequest();
                  xhr.open("get", "/member/addAddr?addr="+addr+"&xcor="+coords.getLat()+"&ycor="+coords.getLng(), true);
                  xhr.send();
               }
            });
                document.getElementById("addr").innerHTML = addr;
            }
        }).open();
    }
</script>