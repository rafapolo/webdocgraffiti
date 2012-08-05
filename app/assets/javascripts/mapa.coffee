$(document).ready ->
	$("#wdg_logo").css("left", "65px")

	myOptions =
		center: new google.maps.LatLng(-23.5687, -46.5705)
		zoom: 12
		mapTypeId: google.maps.MapTypeId.ROADMAP
	map = new google.maps.Map(document.getElementById("mapa"), myOptions)

	marcadores = []
	last_marcador = ''

	getMarkerById = (id) ->
		este = ''
		$.each(marcadores, (i,m) -> este = m if m.id == id)
		este

	loadMarkers = ->
		$.get("/marcadores", (data)->
			$.each(data, (i, m) ->
				pub = if m.bloco_id then false else true
				icon = unless pub then "/assets/markers/wdg_p.png" else "/assets/markers/user_p.png"
				marker = new google.maps.Marker(
					position: new google.maps.LatLng(m.lat, m.long)
					map: map
					icon: icon
					id: m.id
					title: m.titulo
					publico: pub
					tags: m.tags
				)
				google.maps.event.addListener(marker, 'click', ->
					if last_marcador
						last_marcador.setIcon if last_marcador.publico then "/assets/markers/user_p.png" else "/assets/markers/wdg_p.png"	
					last_marcador = marker
					marker.setIcon if marker.publico then "/assets/markers/user_g.png" else "/assets/markers/wdg_g.png"
					map.setCenter(marker.position)
					
					$("#togglao").click() unless $("#lateral").is(":visible")

					#changeCommentsURL()
					host = "http%3A%2F%2Fwebdocgraffiti.com.br"
					url = "http%3A%2F%2Fwebdocgraffiti.com.br%2Fmapa%2Fmarcador%2F#{marker.id}"
					src = "https://www.facebook.com/plugins/comments.php?api_key=380422978692298&channel_url=http%3A%2F%2Fstatic.ak.facebook.com%2Fconnect%2Fxd_arbiter.php%3Fversion%3D8%23cb%3Df1fad68578%26origin%3D#{host}%252Ff2957f35f%26domain%3D#{host}%26relation%3Dparent.parent&href=#{url}&locale=pt_BR&numposts=5&sdk=joey&colorscheme=dark"		
					$('.comment').attr("src", src)					
					
					box = $('.abre[toggle=".dados"]')
					box.click() if box.attr("fechado")=="0"
					$('.dados').text "carregando..."
					$.get("/marcadors/#{marker.id}", (data)->
						$('.dados').html(data)
					)
				)
				marcadores.push marker
			)
			if selected_marcador = parseInt($('.dados').attr("marcador"))
				google.maps.event.trigger(getMarkerById(selected_marcador), 'click')
		)
	loadMarkers()

	new_marcador = ''
	google.maps.event.addListener map, "click", (event) ->
		if ($("#marker").is(":visible"))
			marker = new google.maps.Marker(
				position: event.latLng
				map: map
				icon: "/assets/markers/user_p.png"
			)
			map.setCenter(marker.position)
			new_marcador = marker
			window.new_marcador = marker
			$("#marker").hide()
			$('#marcador_lat').val event.latLng.lat()
			$('#marcador_long').val event.latLng.lng()
			$("#passo-3").slideToggle()
			$("#marcador-titulo").focus()
			$(document).off("mousemove")

	$("#habilita-marker").click(
		(e)->			
			$("#marker").fadeIn(500)
			$("#marker").css("position", "fixed")
			$("#marker").css("top", e.pageY - 40)
			$("#marker").css("left", e.pageX - 22)
			$("#marcador_tags").val("")
			$("#create-marker").slideToggle()
			$('#save-marker').slideToggle()
			$(document).mousemove((e)->	
				$("#marker").css("top", e.pageY - 40)
				$("#marker").css("left", e.pageX - 22)
			)
	)

	$("#new_marcador").ajaxForm
		beforeSubmit: ->        
			$('#save-marker').slideToggle()
			$('#status').show()
			$('#status').text("Salvando...")
		success: (e) ->
			if e == "200"
				msg = "Ok. Marcador adicionado."
				$("#new_marcador")[0].reset()
				$("#marcador_tags").val("")
				$("#status").text(msg)
				$.each(marcadores, (i,e) -> e.setMap null)
				new_marcador.setMap null
				loadMarkers()
			else
				$("#status").text("Erro. Dados incompletos")
			$("#back-btn").show()

	$("#cancel-btn").click(->
		new_marcador.setMap null
		$("#marker").hide()
		$('#save-marker>p.caixa>input').val("")
		$("#create-marker").slideToggle()
		$('#save-marker').slideToggle()
		$("#passo-3").slideToggle()
	)

	$("#save-btn").click(->
		$("#new_marcador").submit()
	)

	$("#voltar-btn").click(->
		if $("#status").text() == "Ok. Marcador adicionado."
			$("#create-marker").slideToggle()
			$('#save-marker').hide()
			$("#passo-3").hide()
			$("#voltar-btn").hide()
			return
		$("#status").hide()
		$("#back-btn").hide()
		$('#save-marker').slideToggle()
	)


	filtra = (tag) ->
		$.each(marcadores, (i,m) ->
			tem = false
			$.each(m.tags, (c,t) -> tem = true if t.urlized == tag)
			m.setMap null unless tem
		)
		window.abre($('.abre.aberto.go')) if $('.abre.aberto.go').attr("fechado")=="0"		
		
		$('.tag>input').attr("checked", false)
		$("#tag-#{tag}").attr("checked", true)


	$('.link').live('click', -> filtra($(this).attr("tag")))

	$('.tag>span').click ->
		$(this).prev().click()

	marcadas = []
	$.each($('.tag>input'), (i,t) ->
		tag = $(t).attr("id").replace("tag-", "")
		marcadas.push tag
	)
	$('.tag>input').on('change', ->
		input = $(this)
		tag = input.attr("id").replace("tag-", "")
		
		if input.attr("checked")
			marcadas.push tag
		else
			marcadas.splice(marcadas.indexOf(tag), 1)

		$.each(marcadores, (i,m) ->
			tem = false
			$.each(m.tags, (c,t) -> tem = true if $.inArray(t.urlized, marcadas)>-1)			
			if tem
				m.setMap map
			else
				m.setMap null
		)
		window.abre($('.abre.aberto.go')) if $('.abre.aberto.go').attr("fechado")=="0"
	)

	$('#selectAll').click(
		-> 
			marcadas = []
			$('.tag>input').attr("checked", true)
			$.each($('.tag>input'), (i,t) ->
				tag = $(t).attr("id").replace("tag-", "")
				marcadas.push tag
			)
			$.each(marcadores, (i,m) -> 
				m.setMap map				
			)
		)
	

	$('#deselectAll').click(
		-> 
			marcadas = []
			$('.tag>input').attr("checked", false)
			$.each(marcadores, (i,m) -> m.setMap null)
	)

	$("#street").click ->
		panorama = map.getStreetView()
		panorama.setPosition(window.new_marcador.position)
		panorama.setVisible(true)


