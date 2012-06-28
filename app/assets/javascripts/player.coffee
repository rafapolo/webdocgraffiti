$ ->
	$('.video>img').hover(
		-> $(this).next().css("color", "#fe8a2d")
		-> $(this).next().css("color", "#B96B3B")
	)