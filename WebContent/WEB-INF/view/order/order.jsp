<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
<!-- 장바구니 -->
.scroll-menu {
	text-align: center;
	padding: 10px 10px;
	width: 250px;
}
.scroll-fixed {
	position: fixed;
	top: 0px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<div class="w3-container"
	style="padding-left: 150px; padding-right: 150px">
	<div class="w3-row">
		<a href="javascript:void(0)" onclick="openTabs(event, 'menu');">
			<div
				class="w3-half tablink w3-bottombar w3-hover-light-grey w3-padding w3-border-red">메뉴</div>
		</a> <a href="javascript:void(0)" onclick="openTabs(event, 'review');">
			<div
				class="w3-half tablink w3-bottombar w3-hover-light-grey w3-padding">리뷰</div>
		</a>

	</div>

	<div id="menu" class="w3-container tabs" style="display: block">
		<div class="w3-row">
			<div class="w3-container w3-threequarter">
				<button onclick="myFunction('Demo1')"
					class="w3-button w3-block w3-left-align w3-light-grey">추천
					메뉴</button>
				<div class="w3-container">
					<div id="Demo1">
						<ul class="w3-ul w3-card-4">
							<li class="w3-bar" id="f01"><img
								src="${pageContext.request.contextPath}/images/1.jpg"
								class="w3-round w3-right " style="width: 100px">
								<div class="w3-bar-item">
									<span class="w3-large">음식1</span><br> <span>3500원</span>
								</div></li>
							<li class="w3-bar" id="f02"><img
								src="${pageContext.request.contextPath}/images/1.jpg"
								class="w3-round w3-right " style="width: 100px">
								<div class="w3-bar-item">
									<span class="w3-large">음식2</span><br> <span>7000원</span>
								</div></li>

							<li class="w3-bar" id="f03"><img
								src="${pageContext.request.contextPath}/images/1.jpg"
								class="w3-round w3-right " style="width: 100px">
								<div class="w3-bar-item ">
									<span class="w3-large">음식3</span><br> <span>10000원</span>
								</div></li>
						</ul>
					</div>
				</div>
				<button onclick="myFunction('Demo2')"
					class="w3-button w3-block w3-black w3-left-align">인기 메뉴</button>
				<div class="w3-container">
					<div id="Demo2" class="w3-hide">
						<ul class="w3-ul w3-card-4">
							<li class="w3-bar"><img
								src="${pageContext.request.contextPath}/images/1.jpg"
								class="w3-round w3-right " style="width: 100px">
								<div class="w3-bar-item">
									<span class="w3-large">음식1</span><br> <span>3500원</span>
								</div></li>

							<li class="w3-bar"><img
								src="${pageContext.request.contextPath}/images/1.jpg"
								class="w3-round w3-right " style="width: 100px">
								<div class="w3-bar-item">
									<span class="w3-large">음식2</span><br> <span>7000원</span>
								</div></li>

							<li class="w3-bar"><img
								src="${pageContext.request.contextPath}/images/1.jpg"
								class="w3-round w3-right " style="width: 100px">
								<div class="w3-bar-item ">
									<span class="w3-large">음식3</span><br> <span>10000원</span>
								</div></li>
						</ul>
					</div>
				</div>

			</div>
			<div class="w3-container w3-quarter">
				<!-- --------장바구니 --------- -->
				<div class="scroll-menu  w3-border w3-container">
					
					<div class="w3-container w3-border-bottom">
					주문표
					</div>
					<div class="w3-container">
						<ul>
							<li>피자</li>
							<li>치킨</li>
						</ul>
					</div>
					
				</div>


				<!-- ------장바구니 끝  -->
			</div>
		</div>
	</div>
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
	function myFunction(id) {
		var x = document.getElementById(id);
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
		} else {
			x.className = x.className.replace(" w3-show", "");
		}
	}
	// 음식 클릭 이벤트 .
	$(".w3-bar").on("click", function() {
		window.alert($(this).attr("id"));
	});

	// 장바구니
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