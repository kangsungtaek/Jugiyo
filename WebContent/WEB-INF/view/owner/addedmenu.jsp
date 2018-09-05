<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="w3-container"
	style="padding-top: 50px; padding-left: 100px; padding-right: 100px">
<div id="menuList"> 
		<div id="menu" class="w3-container t`abs" style="display: block">
			<button onclick="menubarSelect('Demo1')"
				class="w3-button w3-block w3-left-align w3-deep-orange" style="
    color: white !important;
				">추천
				메뉴</button>
			<div class="w3-container">
				<div id="Demo1">
					<ul class="w3-ul w3-card-4">
						<c:forEach items="${menuList}" var="menu">
							<c:if test="${menu.type eq 10 }">
								<li class="w3-bar menu" id="${menu.no }"><img
									src="${pageContext.request.contextPath}${menu.fileUri}" class="w3-round w3-right "
									style="width: 100px">
									<div class="w3-bar-item">
										<span class="w3-large">${menu.name }</span><br> <span>${menu.price }원</span>
										<p class="w3-small">
										<button type="button" id="del" onclick="menuDelete(this)" class="w3-btn w3-white w3-border w3-round-large">삭제</button>
											<button type="button" onclick="menuUpdate(this)" class="w3-btn w3-white w3-border w3-round-large">수정</button>
									</p>
									</div></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>

			<button onclick="menubarSelect('Demo2')"
				class="w3-button w3-block w3-deep-orange w3-left-align">메인 메뉴</button>
			<div class="w3-container">
				<div id="Demo2" class="w3-show">
					<ul class="w3-ul w3-card-4">
						<c:forEach items="${menuList}" var="menu">
							<c:if test="${menu.type eq 20 }">
								<li class="w3-bar menu" id="${menu.no }"><img
									src="${pageContext.request.contextPath}${menu.fileUri }" class="w3-round w3-right "
									style="width: 100px">
									<div class="w3-bar-item">
										<span class="w3-large">${menu.name }</span><br> <span>${menu.price }원</span>
										<p class="w3-small">
										<button type="button" id="del" onclick="menuDelete(this)" class="w3-btn w3-white w3-border w3-round-large">삭제</button>
											<button type="button" onclick="menuUpdate(this)" class="w3-btn w3-white w3-border w3-round-large">수정</button>
									</p>
									</div></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>
			</div>
			<button onclick="menubarSelect('Demo3')"
				class="w3-button w3-block w3-deep-orange w3-left-align">사이드 메뉴</button>
			<div class="w3-container">
				<div id="Demo3" class="w3-show">
					<ul class="w3-ul w3-card-4">
						<c:forEach items="${menuList}" var="menu">
							<c:if test="${menu.type eq 30 }">
								<li class="w3-bar menu" id="${menu.no }"><img
									src="${pageContext.request.contextPath}${menu.fileUri }" class="w3-round w3-right "
									style="width: 100px">
									<div class="w3-bar-item">
										<span class="w3-large">${menu.name }</span><br> <span>${menu.price }원</span>
										<p class="w3-small">
										<button type="button" id="del" onclick="menuDelete(this)" class="w3-btn w3-white w3-border w3-round-large">삭제</button>
											<button type="button" onclick="menuUpdate(this)" class="w3-btn w3-white w3-border w3-round-large">수정</button>
									</p>
									</div></li>
							</c:if>
						</c:forEach>

					</ul>
				</div>
			</div>
			<button onclick="menubarSelect('Demo4')"
				class="w3-button w3-block w3-deep-orange w3-left-align">음료</button>
			<div class="w3-container">
				<div id="Demo4" class="w3-show">
					<ul class="w3-ul w3-card-4">
						<c:forEach items="${menuList}" var="menu">
							<c:if test="${menu.type eq 40 }">
								<li class="w3-bar menu" id="${menu.no }"><img
									src="${pageContext.request.contextPath}${menu.fileUri }" class="w3-round w3-right "
									style="width: 100px">
									<div class="w3-bar-item">
										<span class="w3-large">${menu.name }</span><br> <span>${menu.price }원</span>
										<p class="w3-small">
										<button type="button" id="del" onclick="menuDelete(this)" class="w3-btn w3-white w3-border w3-round-large">삭제</button>
											<button type="button" onclick="menuUpdate(this)" class="w3-btn w3-white w3-border w3-round-large">수정</button>
									</p>
									</div></li>
							</c:if>
						</c:forEach>

					</ul>
				</div>
			</div>
		</div>
		</div>

</div>


<script>
	//
	
	
	
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
