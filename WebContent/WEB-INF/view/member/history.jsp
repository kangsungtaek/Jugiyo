<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.w3-table-all {
   vertical-align: middle;
}
</style>

<div style="min-height:50px"></div>
<div class="w3-center">
  <h4>JUGIYO : 맛집을 즐기자</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom">${ sessionScope.vo.nickname }님의 맛있는 일지</h1>
</div>

<table class="w3-table-all w3-centered">
   <thead style="height: 40px;">
      <tr class="w3-red w3-row">
         <td class="w3-col" style="width:5%;"></td>
         <td class="w3-col" style="width:30%;">음식점</td>
         <td class="w3-col" style="width:35%;">주문한 메뉴</td>
         <td class="w3-col" style="width:10%; ">주문날짜</td>
         <td class="w3-col" style="width:20%;">비고</td>
      </tr>
   </thead>
   <tbody>
      <c:forEach var="log" items="${ list }" varStatus="vs">
         <tr class="w3-row">
            <td class="w3-col" style="width:5%;">${ vs.count }</td>
            <td class="w3-col w3-layout-middle" style="width:30%; "><a href="/order/order?storeNo=${log.storeNo}">${ log.storeName }</a></td>
            <td class="w3-col" style="width:35%;">
                  ${ log.orderList[0].name }
               <c:if test="${ fn:length(log.orderList) > 1 }">
                  외  ${ fn:length(log.orderList) - 1 } 
               </c:if>                                       
            </td>
            <td class="w3-col" style="width:10%;">
               <fmt:formatDate value="${ log.orderdate }" pattern="yyyy-MM-dd"/></td>
            <td class="w3-col" style="width:20%;">
               <c:choose>
                  <c:when test="${ log.reviewd == 'Y' }">
                     <button class="w3-btn w3-white w3-border w3-border-grey w3-round-large show">나의리뷰보기</button><br/>
                  </c:when>
                  <c:otherwise>
                     <button class="w3-btn w3-white w3-border w3-border-grey w3-round-large" onclick="location.href='writeReview?_id=${log.id}&storeNo=${log.storeNo}'">리뷰작성하기</button><br/>         
                  </c:otherwise>
               </c:choose>
               <button class="w3-btn w3-white w3-border w3-border-grey w3-round-large" onclick="location.href='reorder?id=${log.id}'">다시주문하기</button>
            </td>
         </tr>      
         <tr class="${ vs.count }" style="display: none"> 
            <td colspan="5">
            <span >▷ ${ log.review.star}<br/> ${ log.review.content } </span>
            </td>
         </tr>
      </c:forEach>
   </tbody>
</table>
         <script>
             $(".show").on("click",function(){
                $(this).parent().parent().next().toggle();
                //$(".${ vs.count }").toggle();
             });
          </script>