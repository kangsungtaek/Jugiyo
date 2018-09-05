<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
<!--
장바구니 -->.scroll-menu {
	text-align: center;
	padding: 10px 10px;
	width: 250px;
}

.scroll-fixed {
	position: fixed;
	top: 0px;
}

textarea {
    width: 100%;
    height: 150px;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    background-color: #f8f8f8;
    resize: none;
}
</style>

<!-- 전체 영역 - -->
<div class="w3-row">
	<!-- 왼쪽 공백  -->
	<div class="w3-col" style="width: 70%">
	<!--  가게정보  -->
		<div class="w3-bar" id="${storeVo.no}" style="padding-bottom: 10px">
			<span class="w3-bar-item w3-xlarge w3-right">
			<c:choose>
				<c:when test="${ store.star == null }">
					0.0
				</c:when>
				<c:otherwise>
					${store.star }
				</c:otherwise>
			</c:choose>
			</span>
			<img src="${pageContext.request.contextPath}${storeVo.img}"
				class="w3-bar-item w3-circle w3-hide-small w3-padding-small"
				style="width: 85px">
			<div class="w3-bar-item">
				<span class="w3-large">${storeVo.name }</span><br> <span>${storeVo.addr }</span>
				<br />
			</div>
		</div>
		<div class="w3-container">
			<button onclick="myFunction2('Demo1')"
				class="w3-button w3-block w3-black w3-left-align">배달정보</button>
			<div id="Demo1" class="w3-show w3-container">
				
					<p>
						<label>주소</label>
						<label class="fa fa-map-marker"></label> 
							<input class="w3-input w3-border" value="${addr }"  name="addr" 
							id="addr" type="text" placeholder="배달받을 주소를 입력해주세요."
							 onclick="sample4_execDaumPostcode()" form="form1" />
					</p>

					<p>
						<label>휴대폰번호</label>
						<label class="fa fa-phone"></label> 
						 <input class="w3-input w3-border"
							name="contact" type="text" value="${member.contact }" form="form1" >
					</p>
				
			</div>

			<button onclick="myFunction2('Demo2')"
				class="w3-button w3-block w3-black w3-left-align">주문시 요청사항</button>
			<div id="Demo2" class="w3-show w3-container">
			<p></p>
			<textarea name="requested" placeholder="주문시 요청사항이 있으시면 남겨주세요" form="form1" ></textarea>
			<p></p>
			</div>
			
			<button onclick="myFunction2('Demo3')"
				class="w3-button w3-block w3-black w3-left-align">결제수단 선택</button>
			<div id="Demo3" class="w3-hide w3-container">
			
			<div class="w3-bar">
			<p></p>
  				<button class="w3-bar-item w3-button w3-black" id="cacheBtn" style="width:50%" onclick="paymenSelect(this)">
  				 <i class="fa fa-cache"></i>현금
  				 <input class="w3-radio" type="radio" name="payment" id="cacheRadio" value="cache" form="form1" checked>
  				</button>
  				<button class="w3-bar-item w3-button w3-black" id="cardBtn" style="width:50%" onclick="paymenSelect(this)">
  				 <i class="fa fa-credit-card"></i>카드
  				 <input class="w3-radio" type="radio" name="payment" id="cardRadio" value="card" form="form1"  >
  				</button>
			<p>&nbsp;</p>
			</div>
		
			</div>
			
			<button onclick="myFunction2('Demo4')"
				class="w3-button w3-block w3-black w3-left-align">할인방법 선택</button>

			<div id="Demo4" class="w3-show w3-container">
			<p></p>
  				쿠폰 <input type="radio" name ="discount" id="copunDiscount" value="coupon" form="form1" onclick="discountSelect(this)" > 
  					<select name="coupon" disabled="disabled" id="coupon" form ="form1" > 
  						<option selected disabled hidden>쿠폰선택</option>
					<c:choose>
						<c:when test="${empty coupons}">
							<option value= "null"> 쿠폰 없음 </option>
						</c:when>
						<c:otherwise>
							<c:forEach var="c" items="${ coupons }">
									<option value="${ c.id }">${c.name}|${c.sale}|${c.unit}</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</select>
				<button type="button" disabled="disabled" id="couponApp" >적용</button>
  				<br/>
  				내 포인트  <input  type="radio" name ="discount" id="pointDiscount" value="point" form="form1" onclick="discountSelect(this)" >
  					<input type="text" disabled="disabled"  name="myPoint" id="myPoint" value="${member.point }" > 
  					<small>최대 3천원</small>
  					<button type="button" disabled="disabled" id="pointApp" >적용</button>
  			    포인트 사용 금액 : <input type="text" readonly="readonly" name="point" id="point" form ="form1"> 
			<p>&nbsp;</p>
			</div>
		</div>

	</div>
	<div class="w3-col"
		style="width: 30%; padding-left: 10px; padding-right: 30px">
		<form action="/order/ordered" method="post" id="form1">
		<div class="scroll-menu  w3-container">
				<div class="w3-border">
					<div class="w3-container w3-border-bottom w3-padding-16 w3-light-grey">
						<span class="fa fa-shopping-cart"></span> 주문표
					</div>
					<div class="w3-container w3-border-bottom w3-padding-16">
						${storeVo.name }
					</div>
					<div class="w3-container w3-sand w3-padding-16" id="orderDiv">
						<ul id="orderList">
							<c:forEach items="${sessionScope.orderList}" var="orderList">
								<li id="${orderList.no}">
								<div class='w3-row' >
									<div class='w3-half w3-right-left' style="padding: 5px;">${orderList.name } X
										 <span id="count"> ${orderList.cnt }</span> 
									</div>
									<div class='w3-half w3-right-align'>
										 <span id="price"> ${orderList.price * orderList.cnt } 원</span> 
									 </div>
								</div>
								</li>
							</c:forEach>
						</ul>
						총 가격 : <span id="totalPrice"> ${sessionScope.totalPrice}</span> <br />
						할인 가격 : <span id="salsePrice">0</span> <br />  <span 
							id="sumPrice">최종 가격 :  ${sessionScope.totalPrice} </span> <br />

					</div>
				</div>
				<div class='w3-row'>
			<button class="w3-button w3-red" type="submit" style="width: 100%;">완료</button>
		</div>
		</div>

		</form>
	</div>
	<!-- ------장바구니 끝  -->
	<input type="hidden" value="${storeVo.no }" name="storeNo" form="form1">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	// 결제수단 선택
	function paymenSelect(target){
		if(target.id == "cardBtn"){
			$("#cardRadio").prop("checked", true);
			$("#cacheRadio").prop("checked", false);
		}else{
			$("#cardRadio").prop("checked", false);
			$("#cacheRadio").prop("checked", true);
		}
	}

	//할인수단 선택
	function saleSelect(target) {
		console.log(target.id);
		$(".c").removeClass("w3-red");
		$("#target.id").addClass("w3-red");
	}
	// 할인방법 선택
	function discountSelect(target){
		if(target.id == "copunDiscount"){
			$("#coupon").prop("disabled", false);
			$("#myPoint").prop("disabled", true);
			$("#pointApp").prop("disabled", true);
			$("#couponApp").prop("disabled",false);
		}else{
			$("#coupon").prop("disabled", true);
			$("#myPoint").prop("disabled", false);
			$("#pointApp").prop("disabled", false);
			$("#couponApp").prop("disabled", true);
		}
	}
	
	$("#myPoint").on("change", function(){
		var aa  = $(this).val();
		if( aa > ${member.point}){
			aa = ${member.point};
		}
		console.log(aa);
		if( aa > 3000){
			aa = 3000;
		}
		$(this).val(aa);
	});
	
	// 포인트 적용 
	// 1. 포인트 적용시 쿠폰선택못함 
	$("#pointApp").on("click", function(){
		var point = $("#myPoint").val();
		
		if(point > 3000){
			window.alert("포인트는 최대 3000 포인트 까지 가능합니다.");
		}else{
			$("#point").val(point);
			$("#salsePrice").text(point);
			$("#sumPrice").text($("#totalPrice").text() - point);
			//$("#copunDiscount").prop("disabled", true);
			
		}
	});
	
	// 쿠폰 적용
	$("#couponApp").on("click", function(){
		
		var aa = $("#coupon").find(":selected").html().split('|');
		console.log(aa[1]);
		
		if(aa[2] == "%"){
			$("#salsePrice").text(Math.round((aa[1] * 0.01) *  $("#totalPrice").text()));
			$("#sumPrice").text($("#totalPrice").text() - Math.round((aa[1] * 0.01) *  $("#totalPrice").text()));
		}else{
			$("#salsePrice").text(aa[1]);
			$("#sumPrice").text($("#totalPrice").text() - aa[1]);
		}
		$("#pointDiscount").prop("disabled", true);
		

		
	});
	
	//장바구니 스크롤
	$(function() {
		$(document).ready(function() {
			var scrollOffset = $('.scroll-menu').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > scrollOffset.top) {
					$('.scroll-menu').addClass('scroll-fixed');
				} else {
					$('.scroll-menu').removeClass('scroll-fixed');
				}
			});
		});
	});

	function myFunction2(id) {
		var x = document.getElementById(id);
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace("w3-black", "w3-red");
		} else {
			x.className = x.className.replace(" w3-show", "");
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace("w3-red", "w3-black");
		}
	}
	
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

                var addr = data.zonecode + "/" + fullRoadAddr;
                document.getElementById("addr").value = addr;
            }
        }).open();
    }
	
</script>