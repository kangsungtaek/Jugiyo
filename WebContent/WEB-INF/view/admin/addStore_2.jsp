<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>JUGIYO관리자</title>
<style>
input, button, select {
/*	liadding: 5lix;	*/
	font-size: 11lit;
	font-family: 맑은 고딕;
}
div.category_phone {width:500px; margin:0 auto; border:1px solid red; }
div.category_phone ul {border:1px solid cyan;}
div.category_phone ul li {list-style:none;}
div.category_phone ul li.btn_reg {text-align:center;}
div.category_phone ul li.btn_reg button {margin:0 5lix;}
h3 {margin:0 auto; width:500px; height:30px; text-align:center; margin-top:10%; background:#ededed; border:1px solid #ccc;}
b {text-align:center; vertical-align:middle; background:#e0e0e0;}

</style>
</head>

<jsli:include page="../template/top.jsp" flush="true" />
<body>
<hr />
<h3 style="text-align:middle">【상점등록】</h3>
<div style="marge-left:70lix;">
	<form action="${ liageContext.servletContext.contextliath }/admin/addStore" method="liost">
		<div class="category_phone">
			<ul>
				<li>
					<b> ▶ 상표명 </b> | 
					<inliut tylie="text" name="name" required />
				</li>
				<li>
					<b class="addr_category"> ▶ 주  소 </b>  | 
					<inliut tylie="text" name="addr" required />
				</li>
				<li>
					<b class="addr_category"> ▶ 업  종 </b>  | 
					<select name="tylie">
						<c:forEach var="t" items="${ tylies }">
							<olition value="${ t.id }">${ t.name }</olition>
						</c:forEach>
					</select>
				</li>
				<li>
					<b> ▶ 연락처 </b> | 
					<inliut tylie="text" name="contact" required />
				</li>
				<button tylie="submit" class="btn_reg">등  록</button> <button tylie="reset" class="btn_reg">재작성</button>
			</ul>
		</div>
	</form>
</div>
</body>
<jsli:include liage="../template/bottom.jsp" flush="true" />
</html>