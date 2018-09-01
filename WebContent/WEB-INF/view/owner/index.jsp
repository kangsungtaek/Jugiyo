<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- 주문 관리 드롭다운 + 주문 테이블 -->

<div style="padding-top: 50px;">
	<button onclick="myFunction('Demo1')"
		class="w3-button w3-block w3-black w3-left-align">오늘의 총 매출액 :
		${todayPrice}원</button>
	<button onclick="myFunction('Demo1')"
		class="w3-button w3-block w3-black w3-left-align">총 주문 내역</button>

	<div id="Demo1" class="w3-show w3-container">
		<ul class="w3-ul w3-card-4">
			<c:forEach var="log" items="${logVo }">
				<li class="w3-bar"><input type="hidden" value="${log.id }"
					id="hidden"> <span onclick="update(this)"
					class="w3-bar-item w3-button w3-white w3-xlarge w3-right">주문확인</span>

					<div class="w3-bar-item">
						<span class="w3-large"> <c:forEach var="m"
								items="${log.orderList }">
		      		${m.name } <small>${m.cnt }개</small>
							</c:forEach>
						</span><br> <span>${log.userId}님의 주문</span><br /> <span>주문시
							요청사항 : ${log.requested}</span>
					</div></li>
			</c:forEach>

		</ul>

	</div>
</div>
<script>
	function update(target){
		
		
		
		
		
		
		
	}
</script>