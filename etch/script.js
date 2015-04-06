var gridSize = 25;

$(document).ready(function(){
$(".pixel").css('height', 80);

	drawGrid();
	$(".pixel").on("mouseenter", function() {
		$(this).addClass("white") });
	
});

var drawGrid = function() {
	$("#container").empty()
	var boxSize = (900-gridSize)/gridSize-1;
	gridSize = gridSize * gridSize;
	for(var i=1; i<=gridSize; i++){
		$("#container").append("<div class='pixel'></div>"); }
	$(".pixel").height(boxSize);
	$(".pixel").width(boxSize);
}

$("#button").click(function() {
	gridSize = $("#sizeSelect").val();
	drawGrid();
	$(".pixel").on("mouseenter", function() {
	$(this).addClass("white") });
});