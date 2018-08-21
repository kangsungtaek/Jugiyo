<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<title>메뉴등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
	<div class="w3-row">
		<div class="w3-quarter">&nbsp;</div>
		<div class="w3-half">
			<form class="w3-container w3-card-4 w3-white"
				action="/owner/addmenu" method="post" name="menuInfo">
				
				<div class="w3-half" style="padding-right: 10px">
					<label>메뉴명</label>
					<input class="w3-input w3-border" name="name" type="text" id="name" placeholder="ex)후라이드치킨"/>
					<span id = "menuidx" style="font-size: 11px"></span>
				</div>



				<div class="w3-half">
					<label>가격(숫자만 입력해주세요)</label>
					<input class="w3-input w3-border" name="price" type="text" id="price" placeholder="ex)10000"/>
					<span id = "priceidx" style="font-size: 11px"></span>
				</div>
				
				<p>
					<input type="submit" value="확인" onclick="return checkValue()"/>
				</p>
			</form>
		</div>
		<div class="w3-quarter">&nbsp;</div>
	</div>
</body>

<script>
		function checkValue(){
			var form = document.menuInfo;
			var check = true;
			
			if(!form.name.value){
				document.getElementById("menuidx").innerHTML="메뉴를 입력하세요";
				check = false;
			}
			if(!form.price.value){
				document.getElementById("priceidx").innerHTML="가격을 입력하세요";
				check = false;
			}
			return check;
			
		}
</script>
</html>


