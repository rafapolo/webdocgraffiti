abre = (id) ->
	seta = $(id)
	$(seta.attr("toggle")).parent().slideToggle()		
	if seta.attr("fechado") == "0"
		seta.attr("fechado", "1")
		seta.rotate({animateTo:90})
	else		
		seta.attr("fechado", "0")
		seta.rotate({animateTo:0})

outrasTagsTambem = (checked, tags) ->		
	ok = true
	$.each(tags, (n, t) ->		
		if $("#tag-"+t).is(":checked") != checked			
			ok = false
			return ok
	)
	ok

$(document).ready ->
	$('.container').fadeIn(500)
	$('.box').css("height", "")
	$('.box.in').css("height", "")	
	$("#menu").addClass "active"		
	
	$("#tags").css("height", $("#tags").actual('height'))
	$(".item").click -> abre($(this).next().children())		
	
	$('.abre').click -> abre($(this))
	
	$('.tag>span').click ->
		$(this).prev().click()
	
	$('.tag>input').on('change', ->
		input = $(this)
		tag = input.attr("id").replace("tag-", "")
		checked = $(this).is(":checked")
		$('.video').each( ->
			video = $(this)
			tags = $(this).attr('tags').split(', ')
			$.each(tags, (x, i) -> 								
				if i==tag
					if outrasTagsTambem(checked, tags)
						if checked
							video.css('opacity', '1')
						else
							video.css('opacity', '0.3')
					else
						video.css('opacity', '1') if parseFloat(video.css('opacity')) < 1
			)
		)
	)

	if selected_tag = $('#tags').attr('tag')
		$('.video').css('opacity', '0.3')
		abre($('.abre').first())
		$("#tag-#{selected_tag}").click()

	$('.video>a>img').hover(
		-> $(this).next().addClass "ativo"
		-> $(this).next().removeClass "ativo"
	)

	$('img').load(-> $('.ensaio').height($('.ensaio').parent().height()))
