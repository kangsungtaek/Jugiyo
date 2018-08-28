<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<form class="w3-container w3-card-4 w3-white" action="/owner/addedmenu"
		method="post" name="menuInfo" enctype="multipart/form-data"
		id="addform" onsubmit="return checkValue();">
		<div id="default" class="each">
			<div class="w3-half" style="padding-right: 10px; padding-top: 10px">
				<label>메뉴명</label> <input class="w3-input w3-border idx data"
					name="name" type="text" id="name" placeholder="ex)후라이드치킨" /><span
					id="menuidx" class="idx2" style="font-size: 11px"> </span>
			</div>
			<div class="w3-half" style="padding-bottom: 10px; padding-top: 10px">
				<label>가격(숫자만 입력해주세요)</label> <input
					class="w3-input w3-border idx data" name="price" type="text"
					id="price" placeholder="ex)10000" /><span id="priceidx"
					class="idx2" style="font-size: 11px"> </span>
			</div>
			<div class="w3-row">
				<div class="w3-half" style="padding-right: 10px; padding-bottom: 10px">
					<label>메뉴 이미지</label> <input class="w3-input w3-border data"
						name="attach" type="file" id="ori" style="display: none;"
						onchange="preview(this);"> <input
						class="w3-input w3-border fake" name="gg" type="text" readOnly
						onclick="choose(this);" />
				</div>
				<div class="w3-half">
					<div class="img_wrap">
						<img id="img" class="w3-round" />
					</div>
				</div>
			</div>
		</div>
	</form>