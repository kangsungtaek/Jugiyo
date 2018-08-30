<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.w3-myfont {
	font-family: "Comic Sans MS", cursive, sans-serif;
}
#font{
	font-size: 16pt;
}
</style>

<div style="min-height: 50px"></div>

<div class="w3-center">
	<h4>JUGIYO : 맛집을 즐기자</h4>
	<h1 class="w3-xxxlarge w3-animate-bottom">${ sessionScope.vo.nickname }님의
		맛있는 일지</h1>
</div>
<hr />

<div class="w3-container">

	<div class="w3-container">
		<p class="w3-panel w3-padding-24 w3-orange"><span id="font">클린한 리뷰를 작성해주세요.</span>
		<br/><br/>
		당신의 솔직한 리뷰가 다른 사람의 선택에 영향을 줍니다.</p>
		<form action="writeReview" method="post" enctype="multipart/form-data" name="form">
			<input type="hidden" name="no" value="${ no }" />
			<ul class="w3-ul w3-center">
				<li>총점<small>(한번 결정하면 바꿀 수 없습니다.)</small>
				<span>
				<img id="image1" onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)" src="../../../images/star.jpg" style="height:15px; width:15px;" >
				<img id="image2" onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)" src="../../../images/star.jpg" style="height:15px; width:15px;">
				<img id="image3" onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)" src="../../../images/star.jpg" style="height:15px; width:15px;">
				<img id="image4" onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)" src="../../../images/star.jpg" style="height:15px; width:15px;">
				<img id="image5" onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)" src="../../../images/star.jpg" style="height:15px; width:15px;">
				</span>
				<input type="hidden" name="star" />
				</li>
				<li><textarea cols="50" rows="10" name="content"></textarea></li>
				<li>사진 <input type="file" class="w3-button" name="img" multiple></li>
				<li>
				<button class="w3-button w3-amber" type="submit">리뷰작성</button> 
				<button class="w3-button w3-amber" type="reset">재작성</button>
				</li>
			</ul>
		</form>
	</div>
</div>

<script>

var locked = 0;

function show(star) {
	if(locked) return;
	var i;
	var image;
	var el;

	for(i = 1; i <= star; i++) {
		image = "image" + i;
		el = document.getElementById(image);
		el.src = "../../images/star1.jpg"
	}
}

function noshow(star) {
	if(locked) return;
	var i;
	var image;
	var el;
	for(i=1; i<=star; i++) {
		image = "image" + i;
		el = document.getElementById(image);
		el.src="../../images/star.jpg";
	}
}

function lock(star) {
	show(star);
	locked=1;
}

function mark(star) {
	lock(star);
	console.log("총점" + star);
	document.form.star.value=star;
}
</script>