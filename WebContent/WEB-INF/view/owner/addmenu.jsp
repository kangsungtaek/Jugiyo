<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.img_wrap {
	width: 100px;
	margin-top: 10px;
}

.img_wrap img {
	max-width: 100%;
}
</style>
<div style="height: 200px"></div>

<!--메뉴 추가 css + 파일업로드 시 필요한 css-->
<div class="w3-container"
	style="padding-left: 100px; padding-right: 100px">
	<form class="w3-container w3-card-4 w3-white" action="/owner/addmenu"
		method="post" name="menuInfo" enctype="multipart/form-data"
		id="addform" onsubmit="return checkValue();">
		<!-- 여기서부터 클론 -->
		<div id="default" class="each">
			<div>
				<div class="w3-third" style="padding-right: 10px; padding-top: 10px">
					<label>메뉴명</label> <input class="w3-input w3-border idx data"
						name="name" type="text" id="name" placeholder="ex)후라이드치킨" /><span
						id="menuidx" class="idx2" style="font-size: 11px"> </span>
				</div>
				<div class="w3-third"
					style="padding-bottom: 10px; padding-top: 10px">
					<label>가격(숫자만 입력해주세요)</label> <input
						class="w3-input w3-border idx data" name="price" type="text"
						id="price" placeholder="ex)10000" /><span id="priceidx"
						class="idx2" style="font-size: 11px"> </span>
				</div>
				<div class="w3-third" style="padding-left: 10px; padding-top: 10px">
					메뉴 종류 : <select name="type" class="data">
						<c:forEach items="${menuTypeList}" var="menu">
							<option value="${menu.NO }">${menu.NAME }</option>
						</c:forEach>
					</select>
				</div>
				<div class="w3-row">
					<div class="w3-half"
						style="padding-right: 10px; padding-bottom: 10px">
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
		</div>
		<!-- 여기까지 클론 -->
		<div id="plus"></div>
		<div class="w3-row" style="padding-bottom: 10px">
			<div class="w3-half">
				<button type="submit">확인</button>
			</div>
			<div class="w3-right">
				<button class="w3-button w3-small w3-black" id="bt" type="button">+</button>
			</div>
		</div>
	</form>

</div>
<!--입력안하면 못넘어가게 하는 스크립트처리 + 파일업로드 css처리할때 스크립트 처리 jquary-->
<script>
	function checkValue() {
		var cnt = 0;
		for (var i = 0; i < $(".idx").length; i++) {
			if ($(".idx").eq(i).val() == "") {
				$(".idx").eq(i).next().html("REQUIRED");
				cnt++;
			} else {
				$(".idx").eq(i).next().html("OKAY");
			}
		}
		if (cnt == 0) {
			var idx = 0;
			for (var i = 0; i < $(".data").length; i += 4) {
				$(".data").eq(i).attr("name", "menus[" + idx + "].name");
				$(".data").eq(i + 1).attr("name", "menus[" + idx + "].price");
				$(".data").eq(i + 2).attr("name", "menus[" + idx + "].type");
				$(".data").eq(i + 3).attr("name", "menus[" + idx + "].attach");
				idx++;
			}

			return true;
		} else {
			return false;
		}
	}

	/*
	$("#fake").on("click", function() {
		$("#ori").trigger("click");
	});
	$("#ori").on("change", function() {
		$("#fake").val(this.files[0].name);
	});
	$(document).ready(function() {
		$("#ori").on("change", handleImgFileSelect);
	});
	var sel_file;
	 */
	function Remove(target) {

		console.log($(target).prev().closest("div"));
		$(target).prev().closest("div").remove();
		$(target).remove();
		//ee.remove();
		//$(target).prev().closest("div").remove();
	};

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

	var e = $("#default").clone();
	//e.append("<button id='del' type ='button' onclick='Remove(this)'>삭제</button>");
	$("#bt").click(function() {
						e.removeAttr("id");
						$("#plus").append(e.html());
						$("#plus").append("<button id='del' type ='button' onclick='Remove(this)'>삭제</button>");
						//$("#del").click(function() {
						//	$(this).remove();
						//});
					});
</script>


