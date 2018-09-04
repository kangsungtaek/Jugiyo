<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="w3-container"
	style="padding-left: 100px; padding-right: 100px;">
	<div class="w3-border">
		<ul class="w3-ul w3-card-4">
			<c:forEach items="${storeList}" var="store">
				<li class="w3-bar cate" id="${store.no}"><span
					class="w3-bar-item w3-xlarge w3-right">${store.star }</span> <img
					src="${store.img}"
					class="w3-bar-item w3-circle w3-hide-small w3-padding-small"
					style="width: 85px">
					<div class="w3-bar-item">
						<span class="w3-large">${store.name }</span><br> <span>${store.addr }</span>
						<br /> <span class="w3-right-align w3-small">리뷰 : xxxx개</span>
					</div></li>
			</c:forEach>
		</ul>
	</div>
</div>
<script>
$(".cate").on("click", function() {
	location.href = "order/order?storeNo=" + $(this).attr("id");
});
</script>
