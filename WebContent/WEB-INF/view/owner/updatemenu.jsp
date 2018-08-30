<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.img_wrap {
	width: 100px;
	margin-top: 10px;
}

.img_wrap img {
	max-width: 100%;
}
</style>
<form class="w3-container w3-card-4 w3-white" action="/owner/updatemenu"
	method="post" name="menuInfo" enctype="multipart/form-data"
	id="addform" onsubmit="return checkValue();">
	<input type="hidden" name="no" value="${menu.no }" /> <input
		type="hidden" name="store" value="${menu.store }" /> <input
		type="hidden" name="fileNo" value="${menu.fileNo }" />
	<div id="default" class="each">
		<div class="w3-third" style="padding-right: 10px; padding-top: 10px">
			<label>메뉴명</label> <input class="w3-input w3-border idx data"
				name="name" type="text" id="name" value="${menu.name }" /> <span
				id="menuidx" class="idx2" style="font-size: 11px"> </span>
		</div>
		<div class="w3-third" style="padding-bottom: 10px; padding-top: 10px">
			<label>가격(숫자만 입력해주세요)</label> <input
				class="w3-input w3-border idx data" name="price" type="text"
				id="price" value="${menu.price }" /><span id="priceidx"
				class="idx2" style="font-size: 11px"> </span>
		</div>
		<div class="w3-third" style="padding-left: 10px; padding-top: 10px">
			메뉴 종류 : <select name="type" class="data">
						<c:forEach items="${menuTypeList}" var="menutype">
							<c:choose>
								<c:when test="${menu.type eq menutype.NO }">
								<option value="${menutype.NO }" selected="selected" >${menutype.NAME }</option>
								</c:when>
								<c:otherwise>
								<option value="${menutype.NO }">${menutype.NAME }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
		</div>
		<div class="w3-row">
			<div class="w3-half"
				style="padding-right: 10px; padding-bottom: 10px">
				<label>메뉴 이미지</label> <input class="w3-input w3-border data"
					name="attach" type="file" id="ori" style="display: none;"
					onchange="preview(this);" value="${menu.fileUri }"> <input
					class="w3-input w3-border fake" name="gg" type="text" readOnly
					onclick="choose(this);" value="${menu.fileName }" />
			</div>
			<div class="w3-half">
				<div class="img_wrap">
					<img id="img"
						src="${pageContext.request.contextPath}${menu.fileUri}"
						class="w3-round" />
				</div>
			</div>
		</div>
	</div>
	<div class="w3-row" style="padding-bottom: 10px"></div>
	<div class="w3-center">
		<button type="submit">확인</button>
		<a href="/owner/addedmenu"><button type="button">뒤로가기</button></a>
	</div>
</form>
<script>
	function choose(target) {
		$(target).prev().trigger("click");
	};

	function preview(target) {
		$(target).next().val(target.files[0].name);

		var reader = new FileReader();
		reader.readAsDataURL(target.files[0]);

		reader.onload = function() {
			$(target).parent().next().find("img").attr("src", this.result);
		}
	}

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;

		});

	}
</script>