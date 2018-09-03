<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<div class="w3-center">
  <h4>JUGIYO : 맛집을 즐기자</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom">${ sessionScope.vo.nickname }님의 맛있는 일지</h1>
</div>

<div class="w3-container">
  <div class="w3-panel w3-red">
    <h2>사용가능한 쿠폰을 확인하세요.</h2>
  </div>
	  <ul class="w3-ul w3-center">
		  <c:choose>
			<c:when test="${ fn:length(list) > 0 }">
			    <c:forEach var="c" items="${list}">
			    	<li>${ c.name } | ${ c.sale } ${ c.unit }</li>
			    </c:forEach>
			</c:when>
			<c:otherwise>
				<li>사용가능한 쿠폰이 없습니다.</li>
			</c:otherwise>	  
		  </c:choose>
	  </ul>	
</div>