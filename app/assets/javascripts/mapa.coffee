$(document).ready ->
	$("iframe").load -> $(this).fadeIn(600)
	$("#wdg_logo").css("left", "65px")

	myOptions =
		center: new google.maps.LatLng(-23.5687, -46.5705)
		zoom: 11
		mapTypeId: google.maps.MapTypeId.ROADMAP
		streetViewControl: false
		overviewMapControl: true
		mapTypeControl: true
		mapTypeControlOptions: {
			style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR
			position: google.maps.ControlPosition.TOP_CENTER
		}
	map = new google.maps.Map(document.getElementById("mapa"), myOptions)

	marcadores = []
	last_marcador = ''
	window.use_streetview = false

	getMarkerById = (id) ->
		este = ''
		$.each(marcadores, (i,m) -> este = m if m.id == id)
		este

	loadMarkers = ->
		$.get("/marcadores", (data) ->
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
			if selected_tag = $('#maps_tags').attr("tag")
				filtra(selected_tag)
				console.log selected_tag
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
			new_marcador = marker
			window.new_marcador = marker
			$("#marker").hide()		
			window.position = event.latLng		
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
			$(document).mousemove((e) ->	
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
				window.position = null
				window.pov = null
				new_marcador = null
				panorama = map.getStreetView()
				closePanorama()
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

	$("#save-btn").click ->		
		$('#marcador_long').val window.position.lng()
		$('#marcador_lat').val window.position.lat()
		$('#marcador_use_streetview').val window.use_streetview
		if window.use_streetview && window.pov
			$('#marcador_heading').val window.pov.heading
			$('#marcador_zoom').val window.pov.zoom
			$('#marcador_pitch').val window.pov.pitch		
		$("#new_marcador").submit()

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

	google.maps.event.addListener(map.getStreetView(), 'position_changed', -> window.position = map.getStreetView().getPosition())
	google.maps.event.addListener(map.getStreetView(), 'pov_changed', -> window.pov = map.getStreetView().getPov())

	$("#street").click ->		
		sv = new google.maps.StreetViewService()
		sv.getPanoramaByLocation(window.position, 50, (data, status) ->
			if status == "OK"
				panorama = map.getStreetView()				
				pos = if window.position then window.position else window.new_marcador.position
				panorama.setPosition(pos)
				panorama.setPov(window.pov) if window.pov
				panorama.setVisible(true)
				$('#close-pano').fadeIn()
				new_marcador.setMap null
				window.use_streetview = true
				$('#cancel-street').fadeIn()
			else				
				alert "Não há StreetView nessa área."
		)		

	closePanorama = -> 
		panorama = map.getStreetView()
		if panorama.getVisible()			
			$('#close-pano').fadeOut()
			$('#cancel-street').fadeOut()
			panorama.setVisible(false)
			window.use_streetview = false
			new_marcador.position = window.position
			new_marcador.setMap map			

	$('#cancel-street').click -> closePanorama()

	filtra = (tag) ->
		closePanorama()		
		$.each(marcadores, (i,m) ->
			tem = false
			$.each(m.tags, (c,t) -> tem = true if t.urlized == tag)
			m.setMap null unless tem
		)
		window.marcadas = []
		window.marcadas.push tag unless $.inArray(tag, window.marcadas)>-1
		window.abre($('.abre.aberto.go')) if $('.abre.aberto.go').attr("fechado")=="0"				
		$('.tag>input').attr("checked", false)
		$("#tag-#{tag}").attr("checked", true)


	# click em tag do box de marcador
	$('.link').live('click', -> 
		box = $('.abre[toggle=".dados"]')
		box.click()
		id = $(this).attr("tag")
		label = $(this).text()
		$("#maps_tags").prepend($('<div/>').addClass('tag').attr('public', true).append("<input id='tag-#{id}' type='checkbox'>").append($("<span/>").addClass("branco").text(" #{label}")))
		filtra(id)
	)

	$('.tag>span').click ->
		$(this).prev().click()

	window.marcadas = []
	$.each($('.tag>input'), (i,t) ->
		tag = $(t).attr("id").replace("tag-", "")
		window.marcadas.push tag
	)
	$('.tag>input').live('change', ->
		closePanorama()		
		
		input = $(this)		
		checked = $(this).attr("checked") == "checked"
		
		# first click
		if $('input[type=checkbox]:checked').size() == 1
			window.marcadas = []
			$('.tag>input').attr("checked", false)
			$.each(marcadores, (i,m) -> m.setMap null)

		$(this).attr("checked", checked)
		tag = input.attr("id").replace("tag-", "")
		
		if input.attr("checked")
			window.marcadas.push tag unless $.inArray(tag, window.marcadas)>-1
		else
			window.marcadas.splice(window.marcadas.indexOf(tag), 1)

		$.each(marcadores, (i,m) ->
			tem = false
			$.each(m.tags, (c,t) -> tem = true if $.inArray(t.urlized, window.marcadas)>-1)
			if tem
				m.setMap map
			else
				m.setMap null
		)
		window.abre($('.abre.aberto.go')) if $('.abre.aberto.go').attr("fechado")=="0"
	)

	$('a.goToStreet').live('click', ->
		panorama = map.getStreetView()
		panorama.setPosition new google.maps.LatLng($(this).attr("lat"), $(this).attr("long"))
		panorama.setPov({
		    heading: parseFloat($(this).attr("heading"))
		    pitch: parseFloat($(this).attr("pitch"))
		    zoom: parseFloat($(this).attr("zoom"))
		  }
		)
		unless panorama.getVisible()
			panorama.setVisible(true) 
			$('#close-pano').fadeIn()
	)

	$('#close-pano').click -> closePanorama()
	
	# tags autocomplete
	$.get("/tags", (data) ->
		$("#autotags").autocomplete({ source: data },
			select: (e, ui) ->
				id = ui.item.urlized
				tag = $("#tag-#{id}")
				if tag.length == 0					
					label = ui.item.label
					$("#maps_tags").prepend($('<div/>').addClass('tag').attr('public', true).append("<input id='tag-#{id}' type='checkbox'>").append($("<span/>").addClass("branco").text(" #{label}")))
					$("#tag-#{id}").click()
				else
					tag.click() unless tag.is(':checked')

		)
	)

	$('#selectAll').click ->
			closePanorama()
			window.marcadas = []
			$('.tag>input').attr("checked", true)
			$.each($('.tag>input'), (i,t) ->
				tag = $(t).attr("id").replace("tag-", "")
				window.marcadas.push tag
			)
			$.each(marcadores, (i,m) -> 
				m.setMap map				
			)

	$('#deselectAll').click ->
			closePanorama() 
			window.marcadas = []
			$('.tag>input').attr("checked", false)
			$('.tag[public]').remove()
			$.each(marcadores, (i,m) -> m.setMap null)
