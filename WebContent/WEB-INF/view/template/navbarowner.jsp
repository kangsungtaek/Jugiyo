<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 메뉴bar에 있는 dropdown -->
	<div class="w3-bar w3-light-gray w3-bottombar">
		<div class="w3-dropdown-hover">
			<button class="w3-button w3-light-gray">주문관리</button>
			<div class="w3-dropdown-content w3-bar-block w3-border">
				<a href="/owner/index" class="w3-bar-item w3-button">지금 도착한 주문</a> <a
					href="/owner/today" class="w3-bar-item w3-button">주문현황</a>
			</div>
		</div>
		<div class="w3-dropdown-hover">
			<button class="w3-button w3-light-gray">메뉴관리</button>
			<div class="w3-dropdown-content w3-bar-block w3-border">
				<a href="/owner/addedmenu" class="w3-bar-item w3-button">메뉴현황/수정</a>
				<a href="/owner/addmenu" class="w3-bar-item w3-button">메뉴추가</a>
			</div>
		</div>
		<div class="w3-dropdown-hover">
			<button class="w3-button w3-light-gray">리뷰관리</button>
			<div class="w3-dropdown-content w3-bar-block w3-border">
				<a href="#" class="w3-bar-item w3-button">공지등록</a> <a href="#"
					class="w3-bar-item w3-button">리뷰관리</a>
			</div>
		</div>
		<div class="w3-dropdown-hover">
			<button class="w3-button w3-light-gray">통계</button>
			<div class="w3-dropdown-content w3-bar-block w3-border">
				<a href="/owner/salesstats" class="w3-bar-item w3-button">매출통계</a> <a
					href="/owner/menustats" class="w3-bar-item w3-button">메뉴통계</a>
			</div>
			
		</div>
		<div align="right">
				<button class="w3-button w3-light-gray">${sessionScope.login.name}</button>
			</div>
	</div>
	
	
	<script>
					var idx=0;
					var ws = new WebSocket(
							"ws://${pageContext.request.localAddr}/ws/conn.do");
					ws.onmessage = function(ret) {
						console.log(ret.data);
						var obj = JSON.parse(ret.data);
						switch (obj.mode) {
						case "login":
							loginhandle(obj);
							break;
						case "message":
							messageHandle(obj);
							break;
						case "order":
							orderHandle(obj);
							break;
						}
					};
					
					
					function messageHandle(obj) {
						var id = "a_"+idx;
						idx++;
						var html = "<span class="w3-tag w3-blue">New!</span>";

						document.getElementById("alertLogin").innerHTML += html;
						window
								.setInterval(
										function() {
											document
													.getElementById(id).innerHTML = "";
										}, 5000);
					}
					
					function loginhandle(obj) {
						var html = "<span id=\""+ obj.user.id + "\">"
								+ obj.user.id + " <small>" + obj.user.name
								+ "/" + obj.user.dname + " " + obj.user.pname;
						html += "로그인함.</small></span>";
						document.getElementById("alertLogin").innerHTML += html;
						window
								.setInterval(
										function() {
											document
													.getElementById(obj.user.id).innerHTML = "";
										}, 3000);
					}
					
					function orderHandle(obj){
						
					}
				</script>
