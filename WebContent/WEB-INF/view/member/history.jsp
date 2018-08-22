<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<div style="min-height:50px"></div>

<div class="w3-center">
  <h4>JUGIYO : 맛집을 즐기자</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom">${ sessionScope.vo.nickname }님의 맛있는 일지</h1>
</div>


<table class="w3-table-all">
	<thead>
		<tr class="w3-red">
			<td></td>
			<td>음식점</td>
			<td>주문한 메뉴</td>
			<td>주문날짜</td>
			<td colspan="2">비고</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="log" items="${ list }">
			<tr>
				<td></td>
				<td><a href="${pageContext.request.localAddr}/order/order">${ log.store }</a></td>
				<td>
				${ log.menu[0] }
				<c:if test="${ fn:length(log.menu) > 1 }">외 ${ fn:length(log.menu) - 1 }건</c:if>
				</td>
				<td>${ log.date }</td>
				<td><button onclick="location.href='writeReview'">리뷰작성하기</button></td>
				<td><button onclick="location.href=''">다시주문하기</button></td>
			</tr>
		</c:forEach>
	</tbody>
</table>