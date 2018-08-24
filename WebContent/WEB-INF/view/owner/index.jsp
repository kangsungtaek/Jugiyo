<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<html>

  
<div class="w3-container">
	<a href = "/owner/addmenu"><input type="submit" value="메뉴등록"/></a>
<div class="w3-bar w3-white">
  <div class="w3-dropdown-hover">
    <button class="w3-button w3-light-gray">주문</button>
    <div class="w3-dropdown-content w3-bar-block w3-border">
      <a href="#" class="w3-bar-item w3-button">주문확인</a>
      <a href="#" class="w3-bar-item w3-button">today order</a>
    </div>
  </div>
  <div class="w3-dropdown-hover">
    <button class="w3-button w3-light-gray">메뉴</button>
    <div class="w3-dropdown-content w3-bar-block w3-border">
      <a href="#" class="w3-bar-item w3-button">메뉴추가</a>
      <a href="#" class="w3-bar-item w3-button">메뉴수정</a>
      <a href="#" class="w3-bar-item w3-button">메뉴확인</a>
    </div>
  </div>
  
  <div class="w3-dropdown-hover">
    <button class="w3-button w3-light-gray">갓택1</button>
    <div class="w3-dropdown-content w3-bar-block w3-border">
      <a href="#" class="w3-bar-item w3-button">갓택2</a>
      <a href="#" class="w3-bar-item w3-button">갓택3</a>
      <a href="#" class="w3-bar-item w3-button">갓택4</a>
    </div>
  </div>
  
  </div>

<button onclick="myFunction('Demo1')" class="w3-button w3-block w3-black w3-left-align">미확인 주문내역</button>
<div id="Demo1" class="w3-hide w3-container">
    <p><span id="idx">나 내려가고 싶어</span></p>
</div>

<button onclick="myFunction('Demo2')" class="w3-button w3-block w3-black w3-left-align">확인 주문내역</button>
<div id="Demo2" class="w3-hide w3-container">
    <p>Some other text..</p>
    <p id="idx2"><span id="sp"></span></p>
</div>

</div>


</body>
</html>
