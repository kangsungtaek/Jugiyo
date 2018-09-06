<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.star {
   color: #FFBB00;
}
</style>

<c:choose>
   <c:when test="${empty storeList}">
      <div class="w3-container w3-center w3-animate-fading">
         <h1>반경 3 KM 내의 등록된 음식점이 없습니다</h1>
         <p>(현재 강남구 만 조회가능하니 주소를 강남으로 다시 설정해주세요.)</p>
      </div>
   </c:when>
   <c:otherwise>
      <div class="w3-container"
         style="padding-left: 100px; padding-right: 100px;">
         <div class="w3-border">
            <ul class="w3-ul w3-card-4">
               <c:forEach items="${storeList}" var="store">
                  <li class="w3-bar cate" id="${store.no}"><span
                     class="w3-bar-item w3-xlarge w3-right"> <c:choose>
                           <c:when test="${ store.star == null || empty store.star }">
                              <i class="fa fa-star-o star"></i>
                              <i class="fa fa-star-o star"></i>
                              <i class="fa fa-star-o star"></i>
                              <i class="fa fa-star-o star"></i>
                              <i class="fa fa-star-o star"></i>
                           </c:when>
                           <c:otherwise>
                              <c:forEach var="i" begin="1" end="5" step="1">
                                 <c:choose>
                                    <c:when test="${store.star+0.5 eq i}">
                                       <i class="fa fa-star-half-o star"></i>
                                    </c:when>
                                    <c:when test="${store.star ge i}">
                                       <i class="fa fa-star star"></i>
                                    </c:when>
                                    <c:when test="${store.star lt i}">
                                       <i class="fa fa-star-o star"></i>
                                    </c:when>

                                 </c:choose>

                              </c:forEach>


                           </c:otherwise>
                        </c:choose>
                  </span> <img src="${pageContext.request.contextPath}${store.img}"
                     class="w3-bar-item w3-circle w3-hide-small w3-padding-small"
                     style="width: 85px">
                     <div class="w3-bar-item">
                        <span class="w3-large">${store.name }</span><br> <span>${store.addr }</span>
                        <br /> <span class="w3-right-align w3-small">리뷰 : ${ store.review }개</span>
                     </div></li>
               </c:forEach>
            </ul>
         </div>
      </div>
   </c:otherwise>
</c:choose>
<script>
   $(".cate").on("click", function() {
      location.href = "order/order?storeNo=" + $(this).attr("id");
   });
</script>