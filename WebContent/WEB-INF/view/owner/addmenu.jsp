<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.img_wrap{
	width: 100px;
	margin-top: 10px;
}
.img_wrap img{
	max-width: 100%;
}
</style>
	<div style="height: 200px"></div>
	
	<!--메뉴 추가 css + 파일업로드 시 필요한 css-->
	
		<div class="w3-container" style="padding-left: 100px; padding-right: 100px">
			<form class="w3-container w3-card-4 w3-white" action="/owner/addmenu"
				method="post" name="menuInfo" enctype="multipart/form-data">
				  
			<div id="menuadd">
				<div class="w3-half" style="padding-right: 10px">
				
					<label>메뉴명</label> <input class="w3-input w3-border" name="name"
						type="text" id="name" placeholder="ex)후라이드치킨" /> <span
						id="menuidx" style="font-size: 11px"></span>
				</div>

				<div class="w3-half">
					<label>가격(숫자만 입력해주세요)</label> <input class="w3-input w3-border"
						name="price" type="text" id="price" placeholder="ex)10000" /> <span
						id="priceidx" style="font-size: 11px"></span>
				</div>
				<div class="w3-row">
					<div class="w3-half">
						<label>메뉴 이미지</label> <input class="w3-input w3-border" name="gg"
							type="file" id="ori" style="display: none;"> <input
							class="w3-input w3-border" name="gg" type="text" readOnly
							id="fake">
					</div>
					<div class="w3-half">
					<div class="img_wrap">
						<img id="img" class="w3-round"/>
					</div>
					</div>
				</div>
				</div>
				
				<div id="temp" class="w3-row">
				
				</div>
				<p>
					<input type="submit" value="확인" onclick="return checkValue()" />
					<button type="button">추가</button>
				</p>
			</form>
		
	</div>



<!--입력안하면 못넘어가게 하는 스크립트처리 + 파일업로드 css처리할때 스크립트 처리 jquary-->
<script>
	function checkValue() {
		var form = document.menuInfo;
		var check = true;

		if (!form.name.value) {
			document.getElementById("menuidx").innerHTML = "메뉴를 입력하세요";
			check = false;
		}
		if (!form.price.value) {
			document.getElementById("priceidx").innerHTML = "가격을 입력하세요";
			check = false;
		}
		
		return check;
		
	}
		
		
		$("#fake").on("click", function() {
			$("#ori").trigger("click");
		});
		$("#ori").on("change", function() {
			$("#fake").val(this.files[0].name);
		});

	
	
	$("button").click(function(){		
		$("#menuadd").clone().appendTo($("#temp"));
	});
	
	var sel_file;
	
	$(document).ready(function(){
		$("#ori").on("change",handleImgFileSelect);
	});
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file=f;
			
			var reader = new FileReader();
			reader.onload=function(e){
				$("#img").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
			
		});
	}
	
</script>


