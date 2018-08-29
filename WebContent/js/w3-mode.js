$(".mode").on("click", function(){
	console.log($(this).val());
	$("#hs").val($(this).val());
	$(".mode").removeClass("w3-red");
	$(this).addClass("w3-red");
});