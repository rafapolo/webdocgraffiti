$ ->
	$("iframe").load -> $(this).fadeIn(600)
	v = Popcorn.youtube('#video', $("#video").attr("video"))
	window.player = v
	
	l = $("#lateral")
	v.on "play", -> $("#togglao").click() if l.is(":visible")
	v.on "pause", -> $("#togglao").click() if !l.is(":visible")
	v.on "ended", -> v.pause(0)

	$('.hiper').click -> window.player.pause()
	
	$('.video>img').hover(
		-> $(this).next().css("color", "#fe8a2d")
		-> $(this).next().css("color", "#B96B3B")
	)

	$('.sinopse').height $('.item').first().height() + 3
	$('.box.box-large').height $('.boxx.item').height() + 3

	window.abre($(".aberto"))