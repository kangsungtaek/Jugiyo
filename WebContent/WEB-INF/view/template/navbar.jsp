<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="w3-bar w3-border w3-round w3-light-grey">
  <div class="w3-dropdown-hover w3-xxlarge"><i class="fa fa-search"></i>
    <div class="w3-dropdown-content" style="width:250px">
      <input type="text" id="search" onkeypress="if(event.keyCode==13) {submit(this); return false;}" /> 
    </div>
  </div>
  <a href="/main?type=all" class="w3-bar-item w3-button cate">전체보기</a>
  <a href="/main?type=1" class="w3-bar-item w3-button cate">치킨</a>
  <a href="/main?type=2" class="w3-bar-item w3-button cate">피자/양식</a>
  <a href="/main?type=3" class="w3-bar-item w3-button cate">중국집</a>
  <a href="/main?type=4" class="w3-bar-item w3-button cate">한식</a>
  <a href="/main?type=5" class="w3-bar-item w3-button cate">일식/돈까스</a>
  <a href="/main?type=6" class="w3-bar-item w3-button cate">족발/보쌈</a>
  <a href="/main?type=7" class="w3-bar-item w3-button cate">야식</a>
  <a href="/main?type=8" class="w3-bar-item w3-button cate">분식</a>
  <a href="/main?type=9" class="w3-bar-item w3-button cate">카페/디저트</a>
  <div class="w3-dropdown-hover w3-xlarge" onclick="location.href='/order/random'">🎲
    <div class="w3-dropdown-content" style="width:250px">
      <h6>결정장애자인 당신을 위한</h6>
      <h6>메뉴랜덤추천!</h6>
    </div>
  </div>
</div>

<script>
/*   2018-08-25/ 강성택   click 이벤트 안되서 다시 main.jsp 에 추가 .. 
$(".cate").on("click", function() {
   location.href = "order/order?no=" + $(this).attr("id");
});
<<<<<<< HEAD

function submit(target) {
   var search = target.value;
   console.log(search + "/" + typeof search);
   location.href="/main/search?search="+search;
}

=======
*/
$(document).ready(function(){
    $("#search").keypress(function (e) {
     if (e.which == 13){
        console.log($(this).val());
         location.href="/main/search?search="+$(this).val();
     }
 });
});

</script>