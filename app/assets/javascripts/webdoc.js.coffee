$ ->
	$("iframe").load -> $(this).fadeIn(600)

	$('.box-head').hover(
		-> 
			$(this).children().css("color", "#fe8a2d")
			$(this).children().next().css("color", "#fe8a2d")
		-> 
			$(this).children().css("color", "#b96b3b")
			$(this).children().next().css("color", "#b96b3b")
	)

	$(".abre").rotate(90) if $(".aberto").length	

