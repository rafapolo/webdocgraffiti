abre = (id) ->
	seta = $(id)
	$(seta.attr("toggle")).parent().slideToggle()		
	if seta.attr("fechado") == "0"
		seta.attr("fechado", "1")
		seta.rotate({animateTo:90})
	else
		seta.attr("fechado", "0")
		seta.rotate({animateTo:0})


$ ->
	$(".logos").load -> $(window).resize()
	$(".container").fadeIn(400, -> $(".logos").fadeIn(400))
	$("#menu").addClass "active"
	$('.abre').click -> abre($(this))
	$(".item").click -> abre($(this).next().children())

	$(window).resize ->
		metade = ($(document).width()/2 - $(".logos").width()/2)
		$('.logos').css("margin-left", metade).fadeIn(400)