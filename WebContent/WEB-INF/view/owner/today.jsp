<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div style="padding-top: 50px;">
	<button onclick="myFunction('Demo1')"
		class="w3-button w3-block w3-black w3-left-align">오늘의 총 매출액 :
		${todayPrice}원</button>
	<button onclick="myFunction('Demo1')"
		class="w3-button w3-block w3-black w3-left-align">총 주문 내역</button>

	<div id="Demo1" class="w3-show w3-container">
		<ul class="w3-ul w3-card-4">
			<c:forEach var="log" items="${logVo }">
				<c:if test="${log.delivery eq 'Y' }">
					<li class="w3-bar">
						<div class="w3-bar-item">
							<span class="w3-large"> <c:forEach var="m"
									items="${log.orderList }">
		      		${m.name } <small>${m.cnt }개</small>
								</c:forEach>
							</span><br> <span>${log.userId}님의 주문</span><br /> <span>주문시
								요청사항 : ${log.requested}</span>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
</div>
