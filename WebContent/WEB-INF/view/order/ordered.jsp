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

<!-- 전체 영역 - -->
<div class="w3-row">
	<!-- 왼쪽 공백  -->
	<div class="w3-col" style="width: 10%">&nbsp;</div>
	<div class="w3-col" style="width: 70%">
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
									<span id="price">${orderList.price * orderList.cnt } </span> <span
										id="count">${orderList.cnt }</span>
								</div>
							</li>
						</c:forEach>
					</ul>


				</div>
			</div>
			<div class='w3-row'>
				<button class="w3-button w3-red" style="width: 100%;">완료</button>
			</div>
		</div>
		<!-- ------장바구니 끝  -->
	</div>
</div>

<script>

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
</script>