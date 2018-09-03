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
	height:30px;
	padding: 0;	
	font-size: 11pt;
	font-family: 맑은 고딕;
}
#header {width:100%; height:120px; background:#F15F5F; border:1px solid #ccc;}
#content {width:100%; height:682px; position:relative; top:0; border:1px solid #ccc;}
form {margin:0 auto; width:400px; height:300px; margin-top:150px;}
h2 {width:399px; height:60px; line-height:55px; text-align:center; position:relative; bottom:10px; background:#ededed; border:1px solid #ccc;}
div.reg_company {width:100%; height:300px; border:1px solid #ccc;}
div.reg_company ul.reg_category {width:100%; height:auto;}
div ul li {width:310px; height:30px; line-height:30px; margin:5px 0; list-style:none;}
div ul li .addr_cotegory_type {width:250px; padding:0 5px;}
div ul li span {font-weight:bold; color:#5D5D5D; padding:5px 5px; background:#c0c0c0; }
div.btn_reg {text-align:center; padding:15px 10px;}
.btn_reg button {padding:2px 10px 5px 10px; margin:10px 10px;}
div ul.reg_category  {width:400px; height:178px;}
div ul.reg_category li {width:315px; height:40px; line-height:40px; margin-top:4px; padding:2px 10px;}
div ul.reg_category li input {width:190px; height:30px;}
/*hr {margin-top:20px; border:1px solid #EAEAEA;}*/
.logo_addStore {width:auto; height:100px; line-height:50px;}
footer {width:100%; height:100px;  position:relative; margin-top:18px;}
p.shopReg {text-align:center;}
p.shopReg b.shopReg_inquiry {text-align:center;}
</style>
</head>
<body>
	<div id="header">
		<a href="../../../index">
			<img src="../images/logo_s.png" class="logo_addStore" alt="로고">
		</a>
	</div><!--// 헤더 -->
	<div id="content">
		<div style="marge-left:70px;">
			<form action="${ pageContext.servletContext.contextPath }/admin/addStore" method="post">
				<div class="reg_company">
					<h2>【상점등록】</h2>
					<ul class="reg_category size">
						<li>
							 ▶ <span>상표명 </span> &nbsp;|
							<input type="text" class="input_size"  name="name" required />
						</li>
						<li>
							 ▶ <span>주  &nbsp;&nbsp;소 </span> &nbsp;| 
							<input type="text" class="input_size" name="addr" required />
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
							<input type="text" class="input_size" name="contact" required />
						</li>
					</ul>
				</div>
				<div class="btn_reg">
					<button type="submit">등록</button> <button type="reset">취소</button>
				</div>
			</form>
		</div>
	</div><!--//컨텐츠 -->
	<footer class="w3-row-padding"><!-- w3-padding-16  -->
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
	</footer><!--//푸터 -->
</body>
</html>