<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="w3-container"
	style="padding-top: 50px; padding-left: 100px; padding-right: 100px">

	<button onclick="menubarSelect('menuList')"
		class="w3-button w3-block w3-black w3-left-align">등록된 메뉴</button>
	<div class="w3-container">
		<div id="menuList" class="w3-show">
			<ul class="w3-ul w3-card-4">
				<c:forEach items="${menuList}" var="menu">
					<li class="w3-bar menu" id="${menu.no }"><img
						src="${pageContext.request.contextPath}${menu.fileUri }" class="w3-round w3-right " style="width: 100px">
						<div class="w3-bar-item">
							<span class="w3-large" style="padding-left: 10px">${menu.name }</span><br> <span style="padding-left: 10px">${menu.price }</span>
									<p class="w3-small">
										<button type="button" id="del" onclick="menuDelete(this)">삭제</button>
											<button type="button" onclick="menuUpdate(this)">수정</button>
									</p>
									
						</div></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<script>
	//
	
	
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
	
	
	//삭제버튼 스크립트 처리
	function menuDelete(target){
		 var no = $(target).closest('li').attr('id');
		 var xhr = new XMLHttpRequest();
		 xhr.open("get", "/sendJson?no=" + no+"&mode=menuDelete", true);
         xhr.onreadystatechange = function() {
            if (this.readyState == 4) {
               var obj = JSON.parse(this.responseText);
               console.log(obj);
               if(obj.rst){
	                  $("#menuList").find("#"+no).remove();   
	               }
	            }
	         }
	      xhr.send();
	   };
	  //수정버튼 스크립트처리
	  function menuUpdate(target){
		  var no = $(target).closest('li').attr('id');
		  location.href="/owner/updatemenu?no="+no;
	  }
	
</script>
