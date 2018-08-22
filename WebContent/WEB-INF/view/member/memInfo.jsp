<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

<div style="min-height:50px"></div>

<div class="w3-center">
  <h4>JUGIYO : 맛집을 즐기자</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom">${ sessionScope.vo.nickname }님의 맛있는 일지</h1>
</div>


<div class="w3-row-padding w3-center w3-margin-top">
<div class="w3-third">
  <div class="w3-card w3-container" style="min-height:460px" onclick="location.href='/login/history'">
  <h3>주문내역</h3><br>
  <i class="fa fa-desktop w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
  <p>${ sessionScope.vo.nickname }님의 맛있는 행보를 확인하세요.</p>
  </div>
</div>

<div class="w3-third">
  <div class="w3-card w3-container" style="min-height:460px">
  <h3>포인트</h3><br>
  <i class="fa fa-css3 w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
  <p>맛있는 주문만큼 쌓이는 포인트</p>
  </div>
</div>

<div class="w3-third">
  <div class="w3-card w3-container" style="min-height:460px">
  <h3>멤버쉽등급</h3><br>
  <i class="fa fa-diamond w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
  <p>당신의 멤버쉽등급은 --입니다.</p>
  </div>
</div>
</div>

