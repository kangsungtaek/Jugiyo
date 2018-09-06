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
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- 전체 영역 - -->
<div class="w3-row">
	<!-- 왼쪽 공백  -->
	<div class="w3-col" style="width: 75%">

		<!--  가게정보  -->
		<div class="w3-bar" id="${storeVo.no}">
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
				<br /> <span class="w3-right-align w3-small">리뷰 : ${ storeVo.review }개</span>

			</div>
		</div>
		<!--  가게정보 끝 -->
		<!--  메뉴 / 리뷰 탭 -->
		<div class="w3-row">
			<a href="javascript:void(0)" onclick="openTabs(event, 'menu');">
				<div
					class="w3-half tablink w3-bottombar w3-hover-light-grey w3-padding w3-border-red">메뉴</div>
			</a> <a href="javascript:void(0)" onclick="openTabs(event, 'review');">
				<div
					class="w3-half tablink w3-bottombar w3-hover-light-grey w3-padding">리뷰</div>
			</a>
		</div>
		<!--  메뉴 / 리뷰 탭 끝 -->

		<!--  추천 메뉴 -->
		<div id="menu" class="w3-container tabs" style="display: block">
			<button onclick="menubarSelect('Demo1')"
				class="w3-button w3-block w3-left-align w3-light-grey">추천
				메뉴</button>
			<div class="w3-container">
				<div id="Demo1">
					<ul class="w3-ul w3-card-4">
						<c:forEach items="${menuList}" var="menu">
							<c:if test="${menu.type eq 10 }">
								<li class="w3-bar menu" id="${menu.no }"><img
									src="${pageContext.request.contextPath}${menu.fileUri}"
									class="w3-round w3-right " style="width: 100px">
									<div class="w3-bar-item">
										<span class="w3-large">${menu.name }</span><br> <span>${menu.price }</span>
									</div></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>

			<!--  메인메뉴  -->
			<button onclick="menubarSelect('Demo2')"
				class="w3-button w3-block w3-black w3-left-align">메인 메뉴</button>
			<div class="w3-container">
				<div id="Demo2" class="w3-hide">
					<ul class="w3-ul w3-card-4">
						<c:forEach items="${menuList}" var="menu">
							<c:if test="${menu.type eq 20 }">
								<li class="w3-bar menu" id="${menu.no }"><img
									src="${pageContext.request.contextPath}${menu.fileUri }"
									class="w3-round w3-right " style="width: 100px">
									<div class="w3-bar-item">
										<span class="w3-large">${menu.name }</span><br> <span>${menu.price }</span>
									</div></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!--  사이드메뉴  -->
			<button onclick="menubarSelect('Demo3')"
				class="w3-button w3-block w3-black w3-left-align">사이드 메뉴</button>
			<div class="w3-container">
				<div id="Demo3" class="w3-hide">
					<ul class="w3-ul w3-card-4">
						<c:forEach items="${menuList}" var="menu">
							<c:if test="${menu.type eq 30 }">
								<li class="w3-bar menu" id="${menu.no }"><img
									src="${pageContext.request.contextPath}${menu.fileUri }"
									class="w3-round w3-right " style="width: 100px">
									<div class="w3-bar-item">
										<span class="w3-large">${menu.name }</span><br> <span>${menu.price }</span>
									</div></li>
							</c:if>
						</c:forEach>

					</ul>
				</div>
			</div>
			<!--  음료  -->
			<button onclick="menubarSelect('Demo4')"
				class="w3-button w3-block w3-black w3-left-align">음료</button>
			<div class="w3-container">
				<div id="Demo4" class="w3-hide">
					<ul class="w3-ul w3-card-4">
						<c:forEach items="${menuList}" var="menu">
							<c:if test="${menu.type eq 40 }">
								<li class="w3-bar menu" id="${menu.no }"><img
									src="${pageContext.request.contextPath}${menu.fileUri }"
									class="w3-round w3-right " style="width: 100px">
									<div class="w3-bar-item">
										<span class="w3-large">${menu.name }</span><br> <span>${menu.price }</span>
									</div></li>
							</c:if>
						</c:forEach>

					</ul>
				</div>
			</div>
		</div>

		<!--  리뷰  -->
		<div id="review" class="w3-container tabs" style="display: none">
			<div class="w3-container w3-border w3-large w3-center">
				<p></p>
			</div>


			<div class="w3-container w3-border" style="min-height: 150px">
				<c:forEach var="r" items="${ reviews }">
					<c:if test="${ r.reviewd == 'Y'}">
						<span class="w3-large">${ r.review.nickname }님</span>
						<br />
						<span class="w3-small">별점 : ${ r.review.star }</span>
						<br />

						<span class="w3-small"> 
							주문내역 : 
							<c:forEach var="menu" items="${ r.orderList }" varStatus="vs">
							${ menu.name }
							<c:if test="${ !vs.last }">
								, 
							</c:if>
							</c:forEach> <br />
							<c:if test="${ fn:length(r.review.img) > 0 }">
								<c:forEach var="i" items="${ r.review.img }">
									<img src="${pageContext.request.contextPath}${ i }"
										style="width: 10%; height: 10%;" />
								</c:forEach>
							</c:if>
						</span>
						<div class="w3-left-align w3-large">
							<p>${ r.review.content }</p>
							<c:if test="${ r.review.reply ne null && !empty r.review.reply }">
								<p>
								<small>사장님댓글  ▶  ${  r.review.reply } </small>
								</p>
							</c:if>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>



	</div>
	<!-- 장바구니 -->
	<div class="w3-col"
		style="width: 25%; padding-left: 10px; padding-right: 30px">
		<div class="scroll-menu  w3-container">
			<div class="w3-border">
				<div class="w3-container w3-border-bottom">주문표</div>
				<div class="w3-container" id="orderDiv">
					<ul id="orderList">
						<c:forEach items="${sessionScope.orderList}" var="orderList">
							<li id="${orderList.no}">
								<div class='w3-row'>
									<div>${orderList.name }</div>
									<div class='w3-row'>
										<div class='w3-half w3-left-align'>
											<button class='w3-button w3-padding-small w3-tiny w3-red orderRemove w3-border'
												onclick='orderListRemove(this)'>X</button> <span id="price">
												${orderList.price * orderList.cnt }원</span>
										</div>
										<div class="w3-half w3-right-align">
											<button class="w3-button w3-border w3-padding-small w3-tiny" onclick='orderListMinus(this)'>-</button>
											<!-- <span class='w3-button w3-small' onclick='orderListMinus(this)'>-</span>  -->
											<span id="count">${orderList.cnt }</span>
											<button class="w3-button w3-border w3-padding-small w3-tiny" onclick='orderListPlus(this)'>+</button>
											<!-- <span class='w3-button w3-small' onclick='orderListPlus(this)'>+</span>  -->
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					총 가격 : <span id="totalPrice"> ${sessionScope.totalPrice}</span>
				</div>
			</div>
			<div class='w3-row'>
				<a href="/order/ordered?storeNo=${storeVo.no}"><button
						class="w3-button w3-red" style="width: 100%;">주문하기</button> </a>
			</div>
		</div>

	</div>
	<!-- ------장바구니 끝  -->
</div>

<script>
	// 메뉴 / 리뷰 탭 전환 함수 
	function openTabs(evt, tabsName) {
		var i, x, tablinks;
		x = document.getElementsByClassName("tabs");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < x.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(
					" w3-border-red", "");
		}
		document.getElementById(tabsName).style.display = "block";
		evt.currentTarget.firstElementChild.className += " w3-border-red";
	}

	// 메뉴 텝에서 추천메뉴/인기메뉴 bar 클릭할경우 음식리스트 나오게 하는 함수.
	function menubarSelect(id) {
		var x = document.getElementById(id);
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}
	// 장바구니 x 버튼
	//$(".orderRemove").on("click", function() {
	function orderListRemove(target) {
		var no = $(target).closest('li').attr('id');
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/sendJson?no=" + no + "&mode=remove", true);
		xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
				var obj = JSON.parse(this.responseText);
				console.log(obj);
				if (obj.result) {
					$("#orderList").find("#" + no).remove();
					$("#orderDiv").find("#totalPrice").text(obj.totalPrice);

				}
			}
		}
		xhr.send();
	};
	//});

	// 장바구니 + 버튼
	function orderListPlus(target) {
		var no = $(target).closest('li').attr('id');
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/sendJson?no=" + no + "&mode=plus", true);
		xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
				var obj = JSON.parse(this.responseText);
				if (obj.result) {
					//$("#orderList").find("#"+no).find("#count").text(parseInt($("#orderList").find("#"+no).find("#count").text())+1);
					$("#orderList").find("#" + no).find("#count").text(
							obj.menu.cnt);
					$("#orderList").find("#" + no).find("#price").text(
							obj.price);
					$("#orderDiv").find("#totalPrice").text(obj.totalPrice);
				}
			}
		}
		xhr.send();
	};
	// 장바구니 - 버튼
	function orderListMinus(target) {
		var no = $(target).closest('li').attr('id');
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/sendJson?no=" + no + "&mode=minus", true);
		xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
				var obj = JSON.parse(this.responseText);
				if (obj.result) {
					//$("#orderList").find("#"+no).find("#count").text(parseInt($("#orderList").find("#"+no).find("#count").text())-1);
					$("#orderList").find("#" + no).find("#count").text(
							obj.menu.cnt);
					$("#orderList").find("#" + no).find("#price").text(
							obj.price);
					$("#orderDiv").find("#totalPrice").text(obj.totalPrice);

				}
			}
		}
		xhr.send();
	};

	// 음식 클릭 이벤트 .
	$(".menu")
			.on(
					"click",
					function() {
						var xhr = new XMLHttpRequest();
						var no = this.id;
						xhr.open("get", "/sendJson?no=" + no + "&mode=add",
								true);
						xhr.onreadystatechange = function() {
							if (this.readyState == 4) {
								var obj = JSON.parse(this.responseText);
								// 이미 클릭한 메뉴를 또 누를 경우 숫자만 증가 
								if (obj.overLap) {
									//$("#orderList").find("#"+obj.menu).find("#count").text(parseInt($("#orderList").find("#"+obj.menu).find("#count").text())+1);
									$("#orderList").find("#" + no).find(
											"#count").text(obj.menu.cnt);
									$("#orderList").find("#" + no).find(
											"#price").text(obj.price);
									$("#orderDiv").find("#totalPrice").text(
											obj.totalPrice);

									// 새로운 메뉴 클릭시 메뉴 추가.
								} else {
									$("#orderList")
											.append(
													"<li id="+obj.menu.no+"> <div class='w3-row'>"
															+ "<div>" +obj.menu.name + "</div>"
															+ "<div class='w3-row'>" 
															+ "<div class='w3-half w3-left-align'><button class='w3-button w3-padding-small w3-tiny w3-red orderRemove w3-border' onclick='orderListRemove(this)' >X</button> "
															+ " <span id ='price'>"
															+ obj.menu.price
															+ "원 </span> </div>"
															+ "<div class='w3-half w3-right-align'>"
															+ " <button class='w3-button w3-border w3-padding-small w3-tiny' onclick='orderListMinus(this)'>-</button> <span id='count'>"
															+ obj.menu.cnt
															+ "</span> <button class='w3-button w3-border w3-padding-small w3-tiny' onclick='orderListPlus(this)'>+</button> </div></div></div></li>");
									$("#orderDiv").find("#totalPrice").text(
											obj.totalPrice);

								}
							}
						}
						xhr.send();

					});

	// 장바구니 스크롤
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
	//장바구니 끝 ..
</script>