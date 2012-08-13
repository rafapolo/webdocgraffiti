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
	$(".item").click -> window.abre $(this).next().children()		
	
	$('.abre').click -> window.abre $(this)
	
	$('.tag>span').click ->
		$(this).prev().click()
	
	$('.tag>input').on('change', ->
		if $(".tag>input[checked]").size() == 0
			$('.video').css('opacity', '0.3')
		input = $(this)
		tag = input.attr("id").replace("tag-", "")
		checked = $(this).is(":checked")
		$(this).attr("checked", checked)
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

	$('.video').css('opacity', 1)

	if selected_tag = $('#tags').attr('tag')
		$('.video').css('opacity', '0.3')
		abre($('.abre').first())
		$("#tag-#{selected_tag}").click()

	$('.video>a>img').hover(
		-> $(this).next().addClass "ativo"
		-> $(this).next().removeClass "ativo"
	)
	
	$.each($(".box.in"), (i, e) ->
		$(this).css("height", $(e).actual("height"))
	)

	$('img').load(-> $('.ensaio').height($('.ensaio').parent().height()))

	$('#selectAll').click(
		-> 
			$('.tag>input').attr("checked", true)
			$('.tag>input').change()
			$('.video').css('opacity', '1')
		)

	$('#deselectAll').click(
		-> 
			$('.tag>input').attr("checked", false)
			$('.tag>input').change()
			$('.video').css('opacity', '0.3')
	)