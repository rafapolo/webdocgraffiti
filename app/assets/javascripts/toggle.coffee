abre = (id) ->
	seta = $(id)
	$(seta.attr("toggle")).parent().slideToggle()	
	if seta.attr("fechado") == "0"
		$('.abre[fechado="1"]').each ->
			abre($(this))	
		seta.attr("fechado", "1")
		seta.rotate({animateTo:90})		
	else
		seta.attr("fechado", "0")
		seta.rotate({animateTo:0})

$ ->
	$("body").css "overflow", "hidden"		
	$("#menu").css("position", "")
	$("#menu").css("float", "left")
	$(".abre").click -> abre($(this))
	$(".item").click -> abre($(this).next().children())

	$(window).resize ->			
		$('#lateral').css("height", $(document).height())
		$('#togglao').css("left", $(document).width()-40)			
	$(window).resize()

	$("#togglao").hover(
		-> 
			src = $("#togglao").attr("src").replace("seta_d", "seta_d2")
			$("#togglao").attr("src", src)				
		-> 
			src = $("#togglao").attr("src").replace("seta_d2", "seta_d")
			$("#togglao").attr("src", src)	

	).click -> 
		$("#lateral").animate({width: 'toggle'})
		seta = $("#togglao")		
		if seta.attr("fechado")=="1"
			seta.attr("fechado", "0")
			seta.rotate({animateTo:-180})
		else
			seta.attr("fechado", "1")
			seta.rotate({animateTo:0})

	$(window).resize ->
		seta = $("#togglao")
		metade = ($(document).height()/2 - seta.height()/2 -30)
		seta.css("top", metade)

	$(document).keydown((e) ->
		if (e.keyCode == 37) # left
			$("#togglao").click() if !($("#lateral").is(":visible"))
		if (e.keyCode == 39) # right
			$("#togglao").click() if $("#lateral").is(":visible")
	)

	$("#togglao").load -> $(window).resize()

