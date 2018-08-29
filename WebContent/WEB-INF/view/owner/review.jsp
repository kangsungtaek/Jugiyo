<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<div id="Demo1" class="w3-show w3-container">
    <ul class="w3-ul w3-center">
    	<c:forEach var="r" items="${ reviews }">
      		<c:if test="${ fn:length(r.img) > 0 }">
				<li>
				<c:forEach var="img" items="${ r.img }">
		      		<img src="${ img }" class="w3-bar-item w3-border w3-hide-small" style="width:85px; padding:1px; width:50%" >			
				</c:forEach>
				</li>
      		</c:if>
    		<li>${ r.nickname } (${ r.star }) </li>
    		<span class="w3-bar-item w3-button w3-white w3-xlarge w3-right" onclick="addReply"><small>댓글달기</small></span>
    		<span id = "reply"></span>
    	</c:forEach>
  	</ul>
</div>

<script>
function addReply() {
	document.getElementById("reply").innerHTML = "<input type='text' width:'150px;' />";
}
</script>