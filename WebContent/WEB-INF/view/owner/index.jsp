<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE html>
<html>
<title>사장님 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<div class="w3-container">
	<a href = "/owner/addmenu"><input type="submit" value="메뉴등록"/></a>


<button onclick="myFunction('Demo1')" class="w3-button w3-block w3-black w3-left-align">미확인 주문내역</button>
<div id="Demo1" class="w3-hide w3-container">
    <p><span id="idx">나 내려가고 싶어</span></p>
</div>

<button onclick="myFunction('Demo2')" class="w3-button w3-block w3-black w3-left-align">확인 주문내역</button>
<div id="Demo2" class="w3-hide w3-container">
    <p>Some other text..</p>
    <p id="idx2"><span id="sp"></span></p>
</div>

</div>
<script>
function myFunction(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace("w3-black", "w3-red");
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace("w3-red", "w3-black");
    }
}
	document.getElementById("idx").onclick=function(){
		var idx2=document.getElementsByTagName("idx");
		console.log(idx2);
		document.getElementById("sp").innerHTML=idx2;
	}

</script>

</body>
</html>
