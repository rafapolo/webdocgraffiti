$ ->

	updateAtual = (pos) ->
		$.getJSON("/episodios/" + pos, (data) ->
			pos = "0" + pos if pos < 10			
			$("#atual").text "EPISODIO #{pos}: #{data.title}"			
			$("#atual").attr('href', data.href)
			$("#atual").attr('last', data.last)
			$('.background').hide()			
			$('.background').attr('src', data.capa)
			$('.background').fadeIn(700)
			if data.ensaio
				$("#ensaio").parent().attr("href", data.ensaio)
				$("#ensaio").parent().fadeIn(500)
			else
				$("#ensaio").parent().hide()
		)

	$("body").css "overflow", "hidden"
	$('.container').fadeIn(400)
	$("#menu").css "margin", "5px"		
	$("img.logos").load -> $(window).resize()
		
	$("img.nav").hover(
		-> $(this).attr "src", "/assets/setas/seta_e2.png", 
		-> $(this).attr "src", "/assets/setas/seta_e.png"
	)
	$("img.nav.dir").hover(
		-> $(this).attr "src", "/assets/setas/seta_d2.png", 
		-> $(this).attr "src", "/assets/setas/seta_d.png"
	)

	$(".esq").click ->
		pos = parseInt $(this).attr("nav")
		$(this).attr("nav", pos - 1)
		$('.dir').attr("nav", pos + 1)
		$(".nav").fadeOut()
		w = $(document).width()
		metade = $(document).width()/2 - $(".info-box").width()/2
		$(".info-box").animate({left: "-="+w},'slow',
			-> 
				$(".info-box").css("left", w)
				updateAtual(pos)
				$(".info-box").animate({left: metade},'slow', 
					->  
						$(".esq").fadeIn(200) if pos > 1
						$(".dir").fadeIn(200) if pos < $("#atual").attr('last')
				)
		)

	$(".dir").click ->
		pos = parseInt($(this).attr("nav"))
		$(this).attr("nav", pos + 1)
		$('.esq').attr("nav", pos - 1)
		$('.nav').fadeOut()	
		w = $(document).width()
		metade = $(document).width()/2 - $(".info-box").width()/2
		$(".info-box").animate({left: "+="+w},'slow',
			-> 
				$(".info-box").css("left", -w)
				updateAtual(pos)
				$(".info-box").animate({left: metade},'slow',
					->  
						$(".esq").fadeIn(200) if pos > 1
						$(".dir").fadeIn(200) if pos < parseInt($("#atual").attr('last'))
				)
		)		

	$(window).resize ->
		metade = ($(document).width()/2 - $(".logos").width()/2)
		$('#ensaio').css("top", $(document).height()/2)
		$('#ensaio').css("left", $(document).width()/2 + 300)
		$('#ensaio').fadeIn(400)
		$('.logos').css("margin-left", metade).fadeIn(400)
		$(".info-box").css("left", $(document).width()/2 - $(".info-box").width()/2)
