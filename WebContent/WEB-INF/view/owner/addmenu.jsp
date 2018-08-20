<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<title>메뉴 등록</title>

<form action="/owner/addmenu" method="post" name="menuInfo">
	<table>
		<tr>
			<td>메뉴:</td>
				<td><input type="text" name="name">
			</td>
			
		</tr>
		<tr>
			<td>가격:</td>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<td>가게명:</td>
			<td><input type="text" name="store"></td>
		</tr>
		<tr><td><input type="submit" value="확인"/></td></tr>
	</table>
</form>


