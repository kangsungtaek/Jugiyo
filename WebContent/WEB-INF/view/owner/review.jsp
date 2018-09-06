<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.star {
	color: #FFBB00;
}
</style>
<div class="w3-container">
	<ul class="w3-ul w3-card-4">
		<c:choose>
    		<c:when test="${ fn:length(reviews) <= 0 }">
    			<li class="w3-display-container">등록된 리뷰가 없습니다.</li>
    		</c:when>
    		<c:otherwise>
		    	<c:forEach var="r" items="${ reviews }">
					<li class="w3-display-container">
		      		<c:if test="${ fn:length(r.img) > 0 }">
						<c:forEach var="img" items="${ r.img }">
							<img src="${ img }" class="w3-border" style="padding:1px; width:10%; height: 10%;">
						</c:forEach>
						<br/>
		      		</c:if>
		    		<h4>【${ r.nickname }님 
		    		<c:choose>
									<c:when test="${ r.star == null || empty r.star }">
										<i class="fa fa-star-o star"></i>
										<i class="fa fa-star-o star"></i>
										<i class="fa fa-star-o star"></i>
										<i class="fa fa-star-o star"></i>
										<i class="fa fa-star-o star"></i>
									</c:when>
									<c:otherwise>
										<c:forEach var="i" begin="1" end="5" step="1">
											<c:choose>
												<c:when test="${r.star+0.5 eq i}">
													<i class="fa fa-star-half-o star"></i>
												</c:when>
												<c:when test="${r.star ge i}">
													<i class="fa fa-star star"></i>
												</c:when>
												<c:when test="${r.star lt i}">
													<i class="fa fa-star-o star"></i>
												</c:when>

											</c:choose>

										</c:forEach>


									</c:otherwise>
								</c:choose>
		    		
		    		
		    		】</h4> 
		    		▶${ r.content } 
		    		<c:choose>
		    			<c:when test="${empty r.reply }">	
				    		<span class="w3-button w3-transparent w3-display-right show">댓글달기</span>
							<form action="/owner/replied" style="display: none">
					    		<input type="hidden" name="id" value="${ r.logId }" /><br/>
								<input type="text" name="reply" style="width:200px; height: 20px;"/>
							</form>				    		
		    			</c:when>
		    			<c:otherwise>
		    				<span class="w3-button w3-transparent w3-display-right show">댓글보기</span>
				    		<span style="display: none"> ▷ ${r.reply }</span>
		    			</c:otherwise>
		    		</c:choose>
		    		</li>
		    	</c:forEach>
		    	<script>
		    		$(".show").on("click",function(){
		    			$(this).next().toggle();
		    		});
		    	</script>
    		</c:otherwise>
    	</c:choose>
	</ul>					
</div>
