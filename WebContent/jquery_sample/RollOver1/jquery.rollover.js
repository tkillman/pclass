$.fn.rollover = function(){

	$(this).mouseover(function(){
		$(this).attr("src",$(this).attr("src").replace(/^(.+)(\.[a-z]+)$/, "$1_on$2"));
	}).mouseout(function(){
		$(this).attr("src",$(this).attr("src").replace(/^(.+)_on(\.[a-z]+)$/, "$1$2"));
	}).each(function(){
		$("<img>").attr("src",$(this).attr("src").replace(/^(.+)(\.[a-z]+)$/, "$1_on$2"));
	});
	
	return this;
}
/* preload
::: jquery에서 $(...)안에 html태그를 기술하면 
html코드를 내부적으로 만든다. 
내부적으로 만든 html은 해당html을 표시하라고
명령하지 않는한 브라우저에 표시되지 않는다. */
		