<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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
		    		<h4>【${ r.nickname }님 (${ r.star })】</h4> 
		    		▶${ r.content } 
		    		<c:choose>
		    			<c:when test="${empty r.reply }">	
				    		<span class="w3-button w3-transparent w3-display-right show">댓글달기</span>
							<form action="/owner/replied" style="display: none">
					    		<input type="hidden" name="id" value="${ r.id }" /><br/>
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
