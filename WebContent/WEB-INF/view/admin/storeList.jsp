<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<div class="w3-container">
  <ul class="w3-ul w3-card-4">
     <c:forEach items="${storeList }" var="list">
    <li class="w3-bar">
      <a href="/admin/updateStore?no=${list.no }"><span class="w3-bar-item w3-button w3-white w3-xlarge w3-right">수정</span></a>
      <img src="${pageContext.request.contextPath}${list.img }" class="w3-bar-item w3-circle w3-hide-small" style="width:85px">
      <div class="w3-bar-item">
        <span class="w3-large">${list.name }</span><br>
      </div>
    </li>
    </c:forEach>
   
  </ul>
</div>

<script>
   
</script>



