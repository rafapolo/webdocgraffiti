$(document).ready ->
	myOptions =
		center: new google.maps.LatLng(-23.5687, -46.5705)
		zoom: 12
		mapTypeId: google.maps.MapTypeId.ROADMAP

	map = new google.maps.Map(document.getElementById("mapa"), myOptions)
	marcadores = []
	google.maps.event.addListener map, "click", (event) ->
		if ($("#marker").is(":visible"))
			marker = new google.maps.Marker(
				position: event.latLng
				map: map
				icon: "/assets/markers/user_p.png"
			)
			marcadores.push marker
			$("#marker").hide()			
			$('#marcador_lat').val event.latLng["$a"]
			$('#marcador_long').val event.latLng["ab"]
			$("#passo-3").slideToggle()
			$("#togglao").click() if !($("#lateral").is(":visible"))
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
        $('#status').text("Salvando...")
      success: (e) ->
        $("#status").text("Ok")

	$("#cancel-btn").click(->
		if marcadores[0]
			marcadores[0].setMap null
			marcadores.pop marcadores[0]
		$("#marker").hide()
		$('#save-marker>p.caixa>input').val("")
		$("#create-marker").slideToggle()
		$('#save-marker').slideToggle()
		$("#passo-3").slideToggle()
	)

	$("#save-btn").click(->
		$("#passo-3").slideToggle()
		$("#new_marcador").submit()
	)