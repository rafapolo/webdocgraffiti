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
	$('.tag>input').on('change', ->
		input = $(this).next()
		tag = input.text()
		$('.video').each( ->
			video = $(this)
			tags = $(this).attr('tags').split(', ')
			$.each(tags, (x, i) -> 
				if i==tag
					o = video.css('opacity')
					if o == '1'
						if !input.is(":checked")
							video.css('opacity', 0.5)
					else
						if input.is(":checked")
							video.css('opacity', 1)
					
					
			)
		)
	)
	$('.container').fadeIn(500)
	$("#menu").addClass "active"		
	ceil = Math.ceil($(".tag").length / 4)
	$("#tags").css("height", (ceil * 22) + 13)

	$(".item").click -> abre($(this).next().children())		

	$('.video>a>img').hover(
		-> $(this).next().addClass "ativo"
		-> $(this).next().removeClass "ativo"
	)

	$('.abre').click -> abre($(this))
