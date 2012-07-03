$(document).ready ->
	myOptions =
		center: new google.maps.LatLng(-34.397, 150.644)
		zoom: 8
		mapTypeId: google.maps.MapTypeId.ROADMAP

	map = new google.maps.Map(document.getElementById("mapa"), myOptions)
	marcadores = []
	google.maps.event.addListener map, "click", (event) ->
		if ($("#marker").css("position")=="fixed")
			marker = new google.maps.Marker(
				position: event.latLng
				map: map
				icon: "/assets/markers/user_p.png"
			)
			marcadores.push marker
			$("#marker").hide()			
			$(document).off("mousemove")			
			$('#marcador-lat').val event.latLng["$a"]
			$('#marcador-long').val event.latLng["ab"]
			console.log event.latLng["ab"]
			$("#create-marker").slideToggle()
			$('#save-marker').slideToggle()

	$("#habilita-marker").click(
		(e)->			
			$("#marker").fadeIn(500)
			$("#marker").css("position", "fixed")
			$("#marker").css("top", e.pageY - 40)
			$("#marker").css("left", e.pageX - 22)
			$(document).mousemove((e)->	
				$("#marker").css("top", e.pageY - 40)
				$("#marker").css("left", e.pageX - 22)
			)
	)

	$("#cancel-marker").click(->
		marcadores[0].setMap null if marcadores[0]
		$('#save-marker>p.caixa>input').val("")
		$("#create-marker").slideToggle()
		$('#save-marker').slideToggle()
	)