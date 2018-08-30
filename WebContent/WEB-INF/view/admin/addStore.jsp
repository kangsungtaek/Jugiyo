<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>JUGIYO관리자</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
input, button, select {
	padding: 0;	
	font-size: 11pt;
	font-family: 맑은 고딕;
}
form {margin:0 auto; width:400px; height:300px; margin-top:100px; border:1px solid #ccc;}
h2 {width:396px; height:55px; text-align:center; position:relative; bottom:10px; background:#ededed; border:1px solid #ccc;}
h2 small {width:100%; height:auto; margin-top:3px; line-height:45px;}
div.reg_company {width:100%; height:300px;  border:1px solid #ccc;}
div ul li {width:310px; height:30px; line-height:30px; list-style:none;  position:relative; top:10px; border:1px solid #ccc;}
div ul li .addr_cotegory_type {width:250px; padding:0 5px;}
div ul li span {background:#c0c0c0; }
div p.btn_reg {text-align:center; margin:20px 10px;}
div p.btn_reg button {margin:0 20px; padding:2px;}
/*div ul.reg_category {width:100%; height:auto; margin-top:-30px;}*/
div ul.reg_category  {width:400px; height:178px;}
div ul.reg_category li {width:315px; height:40px; line-height:40px; margin-top:4px; padding:2px 10px;}
div ul.reg_category li input {width:190px; height:25px;}
/*div ul.reg_category li span {width:160px; height:40px; border:1px solid red;}*/
/*div.reg_company {width:360px; height:300px; border:1px solid red;}*/
hr {margin-top:20px; border:1px solid #EAEAEA;}
.size::-webkit-input-placeholder {margin:0 0 0 10px; padding-left:10px;}
.logo_addStore {width:auto; height:100px; line-height:50px;}
footer {margin-top:380px;}
p.shopReg {text-align:center;}
p.shopReg b.shopReg_inquiry {text-align:center;}
.hr_form {width:100%; height:auto; position:relative; top:50px;}
</style>
</head>
<body>
<a href="../../../index"><img src="../images/logo_s.png" class="logo_addStore"></a>
<hr />
	<div class="hr_form">
		<form action="${ pageContext.servletContext.contextPath }/admin/addStore" method="post">
			<div class="reg_company">
				<h2><small>【상점등록】</small></h2>
				<ul class="reg_category size">
					<li>
						 ▶ <span>상표명 </span> &nbsp;|
						<input type="text" class="input_size size" placeholder="상표명을 입력" name="name" required />
					</li>
					<li>
						 ▶ <span>주  &nbsp;&nbsp;소 </span> &nbsp;| 
						<input type="text" class="input_size size" placeholder="주소 입력" name="addr" required />
						<div id="map" style="width:500px;height:400px;"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09a2ead5f706292b477133ded73cc2fe"></script>
						<script>
							var container = document.getElementById('map');
							var options = {
								center: new daum.maps.LatLng(33.450701, 126.570667),
								level: 3
							};
					
							var map = new daum.maps.Map(container, options);
						</script>			
					</li>
					<li>
						▶ <span>업  &nbsp;&nbsp;종 </span> &nbsp;| 
						<select name="type">
							<c:forEach var="t" items="${ types }">
								<option value="${ t.id }">${ t.name }</option>
							</c:forEach>
						</select>
					</li>
					<li>
						 ▶ <span>연락처 </span> &nbsp;| 
						<input type="text" class="input_size size" placeholder="연락처 입력" name="contact" required />
					</li>
				</ul>
			</div>
			<p class="btn_reg">
				<button type="submit">등 &nbsp; 록</button> <button type="reset">재작성</button>
			</p>
		</form>
	</div>
	<footer class="w3-row-padding w3-padding-16 "><!-- footer -->
	    <div class="w3-col l10 s6 w3-red">
	      <p>
			<b>"저기요(JUGIYO)"</b><br />
			사장님을 흔히 부를 때 쓰는 표현과 장소를 가리키는 표현의 이중적인 의미를 가지고 있습니다.
		  </p>
	    </div>
	    <div class="w3-col l2 s6 w3-dark-grey">
	      <p class="shopReg">
	      	<b class="shopReg_inquiry">상점 등록 문의</b><br/>
	      	<b class="shopReg_inquiry">02-1588-1588</b>
	      </p>
	    </div>
	</footer><!--//footer -->
</body>
</html>