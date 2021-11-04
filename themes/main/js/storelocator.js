google.maps.event.addDomListener(window, 'load', initMap);

var map,
	geoInitFlag = 0,
	geoMarker;

function nl2br(str) {
	return str.replace(/\n/g, '<br />');
}

function initMap() {
	loadMap();
	loadMarkers();
	setupMapSelect();
	setupGeoLocator();
}

function setupGeoLocator() {

	$('#gpsBtn').on('click touchstart', function() {
		navigator.geolocation.getCurrentPosition(geoLocatorInit, geoLocatorError);
	});

	if('geolocation' in navigator) {
		TweenLite.to('#gpsBtn', 1, {
			css: {
				display:'inline',
				autoAlpha:1
			}
		});
	}
}

var geoMarker,
	curLat,
	curLng;

function geoLocatorInit(position) {

	curLat = position.coords.latitude;
	curLng = position.coords.longitude;

	if(geoInitFlag === 0) {

		geoMarker = new google.maps.Marker({ // set marker
			position: new google.maps.LatLng(curLat, curLng),
			map: map,
			title: 'Your Location within ' + position.coords.accuracy + ' meters',
			// icon: 'http://maps.google.com/mapfiles/kml/paddle/blu-circle.png',
			animation: google.maps.Animation.DROP,
		});
	} else {
		geoMarker.setPosition(new google.maps.LatLng(curLat, curLng)); // move marker
	}

	calculatePointDistance();
			
	centerMapOnMarker(geoMarker);
	geoInitFlag = 1;
}

function calculatePointDistance() {

	var nearestMarker,
		nearestDistance = 1000000, // farthest distance
		nearbyCount = 0,
		nearThreshold = 5,
		message; // km

	for(var i = 0; i < markers.length; i++) {

		var d = getDistance(curLat, curLng, markers[i].PRXData.lat, markers[i].PRXData.lng);

		if(d < nearestDistance) { // set nearest
			nearestDistance = d;
			nearestMarker = markers[i];
		}
				
		if(d <= nearThreshold) {
			nearbyCount++;
		}
	}

	message = 'You have ' + nearbyCount + ' store/s near your location. Showing the nearest store data below.';
			
	$('#gpsStatus').text(message).
	fadeIn();

	centerMapOnMarker(geoMarker);
	setMapPanel(nearestMarker);
}

function geoLocatorError(err) {
	switch(err.code) {
		case 1:
			$('#gpsStatus').text('You have denied access to your location.').fadeIn();
		break;
		case 2:
		case 3:
			$('#gpsStatus').text('Your position is currently unavailable.').fadeIn();
		break;
	}
}

function setupMapSelect() {
	$('.scrp-frame2__hldr').each(function() {
		var id = $(this).attr('id');

		$('#mapSelect_'+id).chosen().change(function(e, params) {

			var curMarker = getMarkerByName($(this).val());

			centerMapOnMarker(curMarker);
			setMapPanel(curMarker);

			$('.lbl').hide();
			$('#mapName_'+id).show();
			$('#mapLocation_'+id).show();
			$('#mapLandmark_'+id).show();
			$('#mapServices_'+id).show();
			$('#mapOperatingHr_'+id).show();

		});
	});
	
}

function getMarkerByName(name) {
	for(var i = 0; i < markers.length; i++) {
		if(markers[i].PRXData.name === name) {
			return markers[i];
		}
	}
}

function loadMap() {
	var mapOptions = {
		center: new google.maps.LatLng(14.550118, 121.028153),
		zoom: 12,
		scaleControl: true
	};

	map = new google.maps.Map($("#map")[0], mapOptions);
}

var markers = [],
    iconImage = themeDir + '/images/storelocator/Map-Pin.png',
	genIndex = 0;
	
function loadMarkers() {
	for(var i = 0; i < mapItems.length; i++) {

		var t = setTimeout(function() {
			dropMarker();
		}, (i + 1) * 300);
	}
}

function dropMarker() {

	markers[genIndex] = new google.maps.Marker({
		position: new google.maps.LatLng(mapItems[genIndex].lat, mapItems[genIndex].lng),
		map: map,
		title: mapItems[genIndex].name,
		icon: iconImage,
		animation: google.maps.Animation.DROP,			
	});

	markers[genIndex].PRXData = mapItems[genIndex];

	bindMarker(markers[genIndex]);
	genIndex++;
}

function bindMarker(marker) {
	google.maps.event.addListener(marker, 'click', function() {
		centerMapOnMarker(marker);
		setMapPanel(marker);
	});	
}

function centerMapOnMarker(marker) {
	map.setZoom(15);
	map.panTo(marker.getPosition());
}

function setMapPanel(marker) {

	$('.scrp-frame2__hldr').each(function() {
		var id = $(this).attr('id');

		$('#mapName_'+id).text(marker.PRXData.name);
		$('#mapLocation_'+id).text(marker.PRXData.location);
		$('#mapLandmark_'+id).text(marker.PRXData.landmark);
		$('#mapServices_'+id).text(marker.PRXData.services);
		$('#mapOperatingHr_'+id).text(marker.PRXData.ophours);
	});


	if (marker.PRXData.name == "") {
		$('.name-lbl').hide()
	} else {
		$('.name-lbl').show()
	}

	if (marker.PRXData.location == "") {
		$('.location-lbl').hide()
	} else {
		$('.location-lbl').show()
	}

	if (marker.PRXData.landmark == "") {
		$('.landmark-lbl').hide()
	} else {
		$('.landmark-lbl').show()
	}

	if (marker.PRXData.services == "") {
		$('.services-lbl').hide()
	} else {
		$('.services-lbl').show()
	}

	if (marker.PRXData.ophours == "") {
		$('.ophours-lbl').hide()
	} else {
		$('.ophours-lbl').show()
	}

	if($('#mapInfo').is(':hidden')) {
		TweenLite.to('#mapInfo', 1, {
			css: {
				display:'block',
				autoAlpha:1
			}
		});
	}
}

function getDistance(lat1, lng1, lat2, lng2) {

	// Haversine Formula
	var R = 6371, // km
		dLat = (lat2 - lat1).toRad(),
		dLon = (lng2 - lng1).toRad(),
		lat1 = lat1.toRad(),
		lat2 = lat2.toRad(),
			
		a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
		Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2), 
		c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a)), 
		d = R * c;

		return d;
}

if (typeof(Number.prototype.toRad) === "undefined") {
	Number.prototype.toRad = function() {
		return this * Math.PI / 180;
	}
}

function setupContactMap() {
	var mapOptions = {
		center: new google.maps.LatLng(contactLat, contactLng),
		zoom: 15,
		scaleControl: true
	},

	map = new google.maps.Map($("#contactMap")[0], mapOptions),
		contactLocation = new google.maps.Marker({
		position: new google.maps.LatLng(contactLat, contactLng),
		map: map,
		title: "Newdrafts",
		animation: google.maps.Animation.DROP
	});
}

		