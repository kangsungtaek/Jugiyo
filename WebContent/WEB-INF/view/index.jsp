<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>JUGIYO</title>
</head>
<body>
	<div align="center">
		<img src="../imgages/logo.png" style="width: 270px; height: 90px;"
			onclick=<c:redirect url="/WEB-INF/view/index" />>
		<input type="text" style="width: 270px;" placeholder="배달받으실 주소를 입력해주세요." 
			onclick=<c:redirect url="/WEB-INF/view/addr" /> />
	</div>
</body>
</html>