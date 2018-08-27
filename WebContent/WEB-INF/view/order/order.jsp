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
	<div class="w3-col" style="width: 10%">&nbsp;</div>
	<div class="w3-col" style="width: 70%">

		<!--  가게정보  -->
		<div class="w3-bar" id="${storeVo.no}">
			<span class="w3-bar-item w3-xlarge w3-right">${storeVo.star }</span>
			<img src="${storeVo.img}"
				class="w3-bar-item w3-circle w3-hide-small w3-padding-small"
				style="width: 85px">
			<div class="w3-bar-item">
				<span class="w3-large">${storeVo.name }</span><br> <span>${storeVo.addr }</span>
				<br /> <span class="w3-right-align w3-small">리뷰 : xxxx개</span>

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
							<li class="w3-bar menu" id="${menu.no }"><img
								src="${menu.fileUrl }" class="w3-round w3-right "
								style="width: 100px">
								<div class="w3-bar-item">
									<span class="w3-large">${menu.name }</span><br> <span>${menu.price }</span>
								</div></li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<!--  인기메뉴  -->
			<button onclick="menubarSelect('Demo2')"
				class="w3-button w3-block w3-black w3-left-align">인기 메뉴</button>
			<div class="w3-container">
				<div id="Demo2" class="w3-hide">
					<ul class="w3-ul w3-card-4">
						<c:forEach items="${menuList}" var="menu">
							<li class="w3-bar menu" id="${menu.no }"><img
								src="${menu.fileUrl }" class="w3-round w3-right "
								style="width: 100px">
								<div class="w3-bar-item">
									<span class="w3-large">${menu.name }</span><br> <span>${menu.price }</span>
								</div></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<!--  리뷰  -->
		<div id="review" class="w3-container tabs" style="display: none">
			<div class="w3-container w3-border w3-large w3-center">
				<p>
					<span>4.2</span><br /> <span>ㅁㅁㅁㅁ</span>
				</p>
			</div>

			<div class="w3-container w3-border">
				<form action="리뷰넘기기" method="post" enctype="multipart/form-data">
					<textarea rows="3" placeholder="리뷰를 작성해주세요"
						style="height: 100px; width: 900px; margin-top: 10px"></textarea>
					<div class="w3-row">
						<div class="w3-half w3-container w3-right-left">
							<input type="file" id="file" style="padding-bottom: 5px;">
						</div>
						<div class="w3-half w3-container w3-right-align">
							<input type="submit" value="등록">
						</div>
					</div>

				</form>
			</div>

			<div class="w3-container w3-border" style="min-height: 150px">
				<span class="w3-large">강성택님</span> <span class="w3-small">2018-08-24</span>
				<br /> <span class="w3-small">별점</span><br /> <span
					class="w3-small"> 시킨거 </span>
				<div class="w3-left-align w3-large">
					<p>리뷰</p>
				</div>

			</div>
		</div>



	</div>
	<!-- 장바구니 -->
	<div class="w3-col"
		style="width: 20%; padding-left: 10px; padding-right: 30px">
		<div class="scroll-menu  w3-border w3-container">
			<div class="w3-container w3-border-bottom">주문표</div>
			<div class="w3-container">
			
				<ul id="orderList">
					<c:forEach items="${sessionScope.orderList}" var="orderList">

						<li id="${orderList.no}">
							<div class='w3-row'>${orderList.name }</div>
							<div class='w3-left-align'>
								<span class='w3-button w3-small orderRemove' onclick='orderListRemove(this)'>X</span>
								<span id="price" >${orderList.price * orderList.cnt } </span> 
								<span class='w3-button w3-small' onclick='orderListMinus(this)'>-</span> 
								<span id="count">${orderList.cnt }</span> 
								<span class='w3-button w3-small' onclick='orderListPlus(this)'>+</span>
							</div>
						</li>
					</c:forEach>
				</ul>
				
				
			</div>
		</div>
		<div class='w3-row'  > <button class="w3-button w3-red" style="width:100%;">주문하기</button> </div>
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
	function orderListRemove(target){
		var no = $(target).closest('li').attr('id');
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/sendJson?no=" + no+"&mode=remove", true);
			xhr.onreadystatechange = function() {
				if (this.readyState == 4) {
					var obj = JSON.parse(this.responseText);
					console.log(obj);
					if(obj.result){
						$("#orderList").find("#"+no).remove();	
					}
				}
			}
		xhr.send();
	};
	//});
	
	// 장바구니 + 버튼
	function orderListPlus(target){
		var no = $(target).closest('li').attr('id');
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/sendJson?no=" + no+"&mode=plus", true);
			xhr.onreadystatechange = function() {
				if (this.readyState == 4) {
					var obj = JSON.parse(this.responseText);
					if(obj.result){
						//$("#orderList").find("#"+no).find("#count").text(parseInt($("#orderList").find("#"+no).find("#count").text())+1);
						$("#orderList").find("#"+no).find("#count").text(obj.menu.cnt);
						$("#orderList").find("#"+no).find("#price").text(obj.price);
					}
				}
			}
		xhr.send();
	};
	// 장바구니 - 버튼
	function orderListMinus(target){
		var no = $(target).closest('li').attr('id');
		var xhr = new XMLHttpRequest();
		xhr.open("get", "/sendJson?no=" + no+"&mode=minus", true);
			xhr.onreadystatechange = function() {
				if (this.readyState == 4) {
					var obj = JSON.parse(this.responseText);
					if(obj.result){
						//$("#orderList").find("#"+no).find("#count").text(parseInt($("#orderList").find("#"+no).find("#count").text())-1);
						$("#orderList").find("#"+no).find("#count").text(obj.menu.cnt);
						$("#orderList").find("#"+no).find("#price").text(obj.price);
					}
				}
			}
		xhr.send();
	};
	
	// 음식 클릭 이벤트 .
	$(".menu").on("click", function() {
		var xhr = new XMLHttpRequest();
		var no = this.id;
		xhr.open("get", "/sendJson?no=" + no+"&mode=add", true);
		xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
				var obj = JSON.parse(this.responseText);
					// 이미 클릭한 메뉴를 또 누를 경우 숫자만 증가 
					if (obj.overLap) {
						//$("#orderList").find("#"+obj.menu).find("#count").text(parseInt($("#orderList").find("#"+obj.menu).find("#count").text())+1);
						$("#orderList").find("#"+no).find("#count").text(obj.menu.cnt);
					// 새로운 메뉴 클릭시 메뉴 추가.
					} else {
						$("#orderList").append("<li id="+obj.menu.no+"> <div class='w3-row'>"
															+ obj.menu.name
															+ "</div>"
															+ "<div class='w3-left-align w3-small'><span class='w3-button w3-small orderRemove' onclick='orderListRemove(this)' >X</span> "
															+ " <span id ='price'>" + obj.menu.price +"</span>"
															+ " <span class='w3-button w3-small' onclick='orderListMinus(this)'>-</span> <span id='count'>"
															+ obj.menu.cnt
															+ "</span> <span class='w3-button w3-small' onclick='orderListPlus(this)'>+</span> </div></li>");
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