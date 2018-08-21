<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<body>

	<div class="container">
		<div class="row">
			<tiles:insertAttribute name="top" />
		</div>
		<div class="row">
			<tiles:insertAttribute name="content" />
		</div>
		<div class="row">
			<tiles:insertAttribute name="bottom" />
		</div>
	</div>
</body>

</html>