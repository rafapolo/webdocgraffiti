$ ->
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
		$(".nav").fadeOut()
		w = $(document).width()
		metade = $(document).width()/2 - $(".info-box").width()/2
		$(".info-box").animate({left: "-="+w},'slow',
			-> 
				$(".info-box").css("left", w)
				$("#info").text "EPISODIO 3: BANKSY CONTRA-ATACA"
				$(".info-box").animate({left: metade},'slow', 
					->  $(".nav").fadeIn(200)
				)
		)

	$(".dir").click ->
		$('.nav').fadeOut()	
		w = $(document).width()
		metade = $(document).width()/2 - $(".info-box").width()/2
		$(".info-box").animate({left: "+="+w},'slow',
			-> 
				$(".info-box").css("left", -w)
				$("#info").text "EPISODIO 3: BANKSY CONTRA-ATACA"
				$(".info-box").animate({left: metade},'slow',
					-> $(".nav").fadeIn(200)
				)
		)			

	$(window).resize ->
		metade = ($(document).width()/2 - $(".logos").width()/2)
		$('#ensaio').css("top", $(document).height()/2)
		$('#ensaio').css("left", $(document).width()/2 + 300)
		$('#ensaio').fadeIn(400)
		$('.logos').css("margin-left", metade).fadeIn(400)
		$(".info-box").css("left", $(document).width()/2 - $(".info-box").width()/2)
