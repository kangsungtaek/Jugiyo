<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<table>
	<thead>
		<tr>
			<td></td>
			<td>음식점</td>
			<td>주문한 메뉴</td>
			<td>주문날짜</td>
			<td>비고</td>
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
				<td><button onclick="location.href=''">다시주문하기</button></td>
			</tr>
		</c:forEach>
	</tbody>
</table>