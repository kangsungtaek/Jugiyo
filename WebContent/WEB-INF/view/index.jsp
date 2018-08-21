<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<tiles:insertAttribute name="top" />

<div class="w3-container">
	<p>
	
	</p>
</div>

<div class="w3-panel w3-padding-64 w3-orange" align="center">
  	<img src="../images/logo.png" onclick="location.href='/index'" style="width: 500px; height: 200px;" />
	<br />
	<input type="text" style="width: 500px;" placeholder="배달받으실 주소를 입력해주세요." onclick="getAddr()" />
</div>


<script>
	function getAddr() {
		window.open("/addr", "new browser", "width=500, height=250");
	}
</script>

<tiles:insertAttribute name="bottom" />