<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<title>JUGIYO관리자</title>
<style>
input, button, select {
	padding: 5px;
	font-size: 11pt;
	font-family: 맑은 고딕;
}
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
			<b> ▶ 주소 </b> | 
			<input type="text" name="addr" required />
		</p>
		<p>
			<b> ▶ 업종 </b> | 
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
		<p>
			<button type="submit">등록</button> <button type="reset">재작성</button>
		</p>
	</form>
</div>

</body>
</html>