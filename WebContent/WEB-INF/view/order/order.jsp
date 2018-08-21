<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<title>주문하기</title>


<body class="w3-content" style="max-width: 1000px">

	<div class="w3-container">
		<h2>주문하기</h2>

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
			<button onclick="myFunction('Demo1')"
				class="w3-button w3-block w3-left-align w3-light-grey">
				Accordion 1</button>
			<div class="w3-container">
				<div id="Demo1" class="w3-hide">
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
				class="w3-button w3-block w3-black w3-left-align">
				Accordion 2</button>
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

		function myFunction(id) {
			var x = document.getElementById(id);
			if (x.className.indexOf("w3-show") == -1) {
				x.className += " w3-show";
			} else {
				x.className = x.className.replace(" w3-show", "");
			}
		}
		
		$(".w3-bar").on("click",function(){
			window.alert($(this).attr("id"));
		});
	</script>

</body>

</html>
