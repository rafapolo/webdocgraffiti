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
			#console.log t + ": " + checked
			ok = false
			return ok
		else
			#console.log t + ": " + !checked
	)
	ok

$(document).ready ->
	$('.container').fadeIn(500)
	$('.box').css("height", "")
	$('.box.in').css("height", "")
	$('.ensaio').height($('.ensaio').parent().height())
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
					#console.log video
					if outrasTagsTambem(checked, tags)
						#console.log "all!"
						if checked
							video.css('opacity', '1')
						else
							video.css('opacity', '0.3')
					else
						#console.log "not all!"
						video.css('opacity', '1') if parseFloat(video.css('opacity')) < 1
						#console.log video.css('opacity')
			)
		)
	)

	if selected_tag = $('#tags').attr('tag')
		abre($('.abre').first())
		$("#tag-#{selected_tag}").click()

	$('.video>a>img').hover(
		-> $(this).next().addClass "ativo"
		-> $(this).next().removeClass "ativo"
	)
