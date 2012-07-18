$(document).ready ->
	$("#wdg_logo").css("left", "65px")
	myOptions =
		center: new google.maps.LatLng(-23.5687, -46.5705)
		zoom: 12
		mapTypeId: google.maps.MapTypeId.ROADMAP

	map = new google.maps.Map(document.getElementById("mapadmin"), myOptions)
	
	marcadores = []
	bloco = $("#mapadmin").attr("bloco")
	$.get("/marcadores/#{bloco}", (data) ->
		$.each(data, (i, m) ->
			marker = new google.maps.Marker(
				position: new google.maps.LatLng(m.lat, m.long)
				map: map
				icon: "/assets/markers/wdg_p.png"
				id: m.id
				title: m.titulo
			)
			google.maps.event.addListener(marker, 'click', ->
				console.log marker
				id = marker.id
				$.get("/marcadors/#{id}/edit", (data) ->	
					infowindow = new google.maps.InfoWindow({content: data})
					infowindow.open(map, marker)
				)
				marcadores.push marker
			)
		)
	)	

	new_marcador = ""
	google.maps.event.addListener map, "click", (event) ->

			marker = new google.maps.Marker(
				position: event.latLng
				map: map
				icon: "/assets/markers/wdg_p.png"
			)
			new_marcador = marker		
			$.get("/marcadors/new", (data) ->	
				infowindow = new google.maps.InfoWindow({
	    			content: data,
				})
				infowindow.open(map, marker)

				setTimeout( 
					->
						$('#marcador_lat').val event.latLng.lat()
						$('#marcador_long').val event.latLng.lng()
						$('#marcador_bloco_id').val bloco
						$("#new_marcador").ajaxForm
							beforeSubmit: ->        
								$('#status').text("Salvando...")
							success: (e) ->
								if e == "200"
									$("#status").text("Ok. Marcador adicionado.")
									infowindow.close()
								else
									$("#status").text("Erro. Dados incompletos")
					, 200
				)
			)