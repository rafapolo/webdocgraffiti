$ ->	
	$('.twitter').click ->
			window.open "http://twitter.com/share?text=WEBDOC%20GRAFFITI&lang=pt&url=http://webdocgraffiti.com.br"
			false
	
	$('.facebook').click -> 
			window.open "http://www.facebook.com/sharer.php?u=http%3A//webdocgraffiti.com.br&t=WEBDOC%20GRAFFITI"
			false

	$('.share>img').hover(
		-> $(this).attr("src", $(this).attr("src").replace("off", "on")),
		-> $(this).attr("src", $(this).attr("src").replace("on", "off"))
	)

	$.each($('.icon'), ->
		preload = $('<img />').attr('src', $(this).attr('src').replace('off', 'on'));
	)