$ ->	
	$('.twitter').click ->
			url = escape(document.location.href)
			text = "WEBDOC GRAFFITI > #{url}"
			window.open "http://twitter.com/share?text=#{text}&lang=pt&url=#{url}"
			false
	
	$('.facebook').click -> 
			url = escape(document.location.href)
			text = escape(document.title)
			window.open "http://www.facebook.com/sharer.php?u=#{url}&t=#{text}"
			false

	$('.share>img').hover(
		-> $(this).attr("src", $(this).attr("src").replace("off", "on")),
		-> $(this).attr("src", $(this).attr("src").replace("on", "off"))
	)

	$.each($('.icon'), ->
		preload = $('<img />').attr('src', $(this).attr('src').replace('off', 'on'));
	)