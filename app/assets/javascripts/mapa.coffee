$(document).ready ->
	$("#wdg_logo").css("left", "65px")

	myOptions =
		center: new google.maps.LatLng(-23.5687, -46.5705)
		zoom: 12
		mapTypeId: google.maps.MapTypeId.ROADMAP

	map = new google.maps.Map(document.getElementById("mapa"), myOptions)

	last_marcador = ''
	marcadores = []

	getMarkerById = (id) ->
		one = ''
		$.each(marcadores, (i,m) -> one = m if m.id == id)
		one

	loadMarkers = ->
		$.get("/marcadores", (data)->
			$.each(data, (i, m) ->
				publico = if m.bloco_id then false else true
				icon = unless publico then "/assets/markers/wdg_p.png" else "/assets/markers/user_p.png"
				marker = new google.maps.Marker(
					position: new google.maps.LatLng(m.lat, m.long)
					map: map
					icon: icon
					id: m.id
					title: m.titulo
					publico: publico
					tags: m.tags
				)
				google.maps.event.addListener(marker, 'click', ->
					console.log marker.tags
					if last_marcador
						last_marcador.setIcon if last_marcador.publico then "/assets/markers/user_p.png" else "/assets/markers/wdg_p.png"	
					last_marcador = marker
					marker.setIcon if marker.publico then "/assets/markers/user_g.png" else "/assets/markers/wdg_g.png"
					
					$("#togglao").click() unless $("#lateral").is(":visible")

					#changeCommentsURL()
					host = "http%3A%2F%2Fwebdocgraffiti.com.br"
					url = "http%3A%2F%2Fwebdocgraffiti.com.br%2Fmapa%2Fmarcador%2F#{marker.id}"
					src = "https://www.facebook.com/plugins/comments.php?api_key=380422978692298&channel_url=http%3A%2F%2Fstatic.ak.facebook.com%2Fconnect%2Fxd_arbiter.php%3Fversion%3D8%23cb%3Df1fad68578%26origin%3D#{host}%252Ff2957f35f%26domain%3D#{host}%26relation%3Dparent.parent&href=#{url}&locale=pt_BR&numposts=5&sdk=joey&colorscheme=dark"		
					$('.comment').attr("src", src)					

					$.get("/marcadors/#{marker.id}", (data)->
						$('.dados').html data
						box = $('.abre[toggle=".dados"]')
						box.click() if box.attr("fechado")=="0"
					)
				)
				marcadores.push marker
			)
			if selected_marcador = parseInt($('.dados').attr("marcador"))
				google.maps.event.trigger(getMarkerById(selected_marcador), 'click')
		)
	loadMarkers()

	$('.tag>span').click ->
		$(this).prev().click()

	$('.tag>input').on('change', ->
		input = $(this)
		tag = input.attr("id").replace("tag-", "")

		#$.each(marcadores, (i,m) ->
			#if
		)

	new_marcador = ""
	google.maps.event.addListener map, "click", (event) ->
		if ($("#marker").is(":visible"))
			marker = new google.maps.Marker(
				position: event.latLng
				map: map
				icon: "/assets/markers/user_p.png"
			)
			new_marcador = marker
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