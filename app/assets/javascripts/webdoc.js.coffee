window.abre = (id) ->
	seta = $(id)
	$(seta.attr("toggle")).parent().slideToggle()		
	if seta.attr("fechado") == "0"
		seta.attr("fechado", "1")
		seta.rotate({animateTo:90})
	else		
		seta.attr("fechado", "0")
		seta.rotate({animateTo:0})

$ ->
 	alert("O Internet Explorer, seu navegador, não cumpre com os modernos padrões abertos exigidos para a correta visualização do site. Recomendamos o Google Chrome ou o Mozilla Firefox.") if $.browser.msie
	$("iframe").load -> $(this).fadeIn(600)
	$('.box-head').hover(
		-> 
			$(this).children().css("color", "#fe8a2d")
			$(this).children().next().css("color", "#fe8a2d")
		-> 
			$(this).children().css("color", "#b96b3b")
			$(this).children().next().css("color", "#b96b3b")
	)	
