<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>JUGIYO관리자</title>
<style>
input, button, select {
/*	padding: 5px;	*/
	font-size: 11pt;
	font-family: 맑은 고딕;
}
div,h3 {margin:0 auto; width:400px; padding:20px; border:1px solid #ccc;}
h3 {text-align:center;  margin-top:10%; background:#ededed;}
p.btn_reg {text-align:center;}
p.btn_reg button {margin:0 5px;}
b {text-align:center; background:#e0e0e0;}
.addr_category {vertical-align:middle;}
</style>
</head>
<body>

<h3>【상점등록】</h3>
<div style="marge-left:70px;">
	<form action="${ pageContext.servletContext.contextPath }/admin/addStore" method="post">
		<p>
			<b> ▶ 상표명 </b> | 
			<input type="text" name="name" required />
		</p>
		<p>
			<b class="addr_category"> ▶ 주&nbsp;&nbsp; 소 </b>  | 
			<input type="text" name="addr" required />
		</p>
		<p>
			<b class="addr_category"> ▶ 업&nbsp;&nbsp; 종 </b>  | 
			<select name="type">
				<c:forEach var="t" items="${ types }">
					<option value="${ t.id }">${ t.name }</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<b> ▶ 연락처 </b> | 
			<input type="text" name="contact" required />
		</p>
		<p class="btn_reg">
			<button type="submit">등  록</button> <button type="reset">재작성</button>
		</p>
	</form>
</div>

</body>
</html>