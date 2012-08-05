$ ->
	v = Popcorn.youtube('#video', $("#video").attr("video"))
	
	l = $("#lateral")
	v.on "play", -> $("#togglao").click() if l.is(":visible")
	v.on "pause", -> $("#togglao").click() if !l.is(":visible")
	v.on "ended", -> v.pause(0)

	$('.hiper').click -> v.pause()
	
	$('.video>img').hover(
		-> $(this).next().css("color", "#fe8a2d")
		-> $(this).next().css("color", "#B96B3B")
	)