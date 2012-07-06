$(document).ready ->
	$("#wdg_logo").css("left", "65px")
	myOptions =
		center: new google.maps.LatLng(-23.5687, -46.5705)
		zoom: 12
		mapTypeId: google.maps.MapTypeId.ROADMAP

	map = new google.maps.Map(document.getElementById("mapa"), myOptions)
	
	marcadores = []
	$.get("/marcadores", (data)->
		$.each(data, (i, m) ->
			icon = if m.bloco_id then "/assets/markers/wdg_p.png" else "/assets/markers/user_p.png"
			marker = new google.maps.Marker(
				position: new google.maps.LatLng(m.lat, m.long)
				map: map
				icon: icon
				id: m.id
				title: m.titulo
			)
			google.maps.event.addListener(marker, 'click', ->
				$.get("/marcadors/#{marker.id}", (data)->					
					$('.dados').html data
					box = $('.abre[toggle=".dados"]')
					box.click() if box.attr("fechado")=="0"
				)    			
			)
			marcadores.push marker			
		)
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
			$('#marcador_lat').val event.latLng["$a"]
			$('#marcador_long').val event.latLng["ab"]
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