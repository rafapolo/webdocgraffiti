$(document).ready ->
	myOptions =
		center: new google.maps.LatLng(-34.397, 150.644)
		zoom: 8
		mapTypeId: google.maps.MapTypeId.ROADMAP

	map = new google.maps.Map(document.getElementById("mapa"), myOptions)
	google.maps.event.addListener map, "click", (event) ->
		if ($("#marker").css("position")=="fixed")
			marker = new google.maps.Marker(
				position: event.latLng
				map: map
				icon: "/assets/markers/user_p.png"
			)
			$("#marker").css("position", "relative").css("top", "").css("left", "")
			$(document).off("mousemove")
			console.log event.latLng["$a"]
			console.log event.latLng["ab"]

	$("#habilita-marker").click(
		(e)->
			$("#marker").css("position", "fixed")
			$("#marker").css("top", e.pageY - 40)
			$("#marker").css("left", e.pageX - 22)
			$(document).mousemove((e)->	
				$("#marker").css("top", e.pageY - 40)
				$("#marker").css("left", e.pageX - 22)
			)
	)