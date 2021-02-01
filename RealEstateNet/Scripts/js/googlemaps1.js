var MY_MAPTYPE_ID = 'style_KINESB';

function initialize() {
  var featureOpts = [
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#666666"
            }
        ]
    },
    {
    "featureType": 'all',
    "elementType": 'labels',
    "stylers": [
            { visibility: 'simplified' }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#e2e2e2"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            },
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#aadaff"
            },
            {
                "visibility": "on"
            }
        ]
    }
];
    var myGent = new google.maps.LatLng(41.7151, 44.8271);
    var Kine = new google.maps.LatLng(41.7151, 44.8271);
    var searchBox,
        infoWindow = '',
        addressEl = document.getElementById('propertyAddressGE'),
        latEl = document.getElementById('googleMapLat'),
        longEl = document.getElementById('googleMapLong');
  var mapOptions = {
    zoom: 11,
    mapTypeControl: true,
    zoomControl: true,
    zoomControlOptions: {
        style: google.maps.ZoomControlStyle.SMALL,
        position: google.maps.ControlPosition.LEFT_TOP,
        mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAPTYPE_ID]
    },
    mapTypeId: MY_MAPTYPE_ID,
    scaleControl: false,
    streetViewControl: false,
    center: myGent
  }
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);  
  var styledMapOptions = {
    name: 'style_KINESB'
  };

  var marker = new google.maps.Marker({
      position: Kine,
      map: map,
      animation: google.maps.Animation.DROP,
      draggable: true,
      //title: 'B4318, Gumfreston SA70 8RA, United Kingdom',
      icon: marker
  });

  var customMapType = new google.maps.StyledMapType(featureOpts, styledMapOptions);
  map.mapTypes.set(MY_MAPTYPE_ID, customMapType);

    searchBox = new google.maps.places.SearchBox(addressEl);

    google.maps.event.addListener(searchBox, 'places_changed', function () {
        var places = searchBox.getPlaces(),
            bounds = new google.maps.LatLngBounds(),
            i, place, lat, long, resultArray,
            addresss = places[0].formatted_address;

        for (i = 0; place = places[i]; i++) {
            bounds.extend(place.geometry.location);
            marker.setPosition(place.geometry.location);  // Set marker position new.
        }

        map.fitBounds(bounds);  // Fit to the bound
        map.setZoom(15); // This function sets the zoom to 15, meaning zooms to level 15.
        // console.log( map.getZoom() );

        lat = marker.getPosition().lat();
        long = marker.getPosition().lng();
        latEl.value = lat;
        longEl.value = long;

        resultArray = places[0].address_components;

        // Closes the previous info window if it already exists
        if (infoWindow) {
            infoWindow.close();
        }
        /**
         * Creates the info Window at the top of the marker
         */
        infoWindow = new google.maps.InfoWindow({
            content: addresss
        });

        infoWindow.open(map, marker);
    });

    google.maps.event.addListener(marker, "dragend", function (event) {
        var lat, long, address, resultArray, citi;

        console.log('i am dragged');
        lat = marker.getPosition().lat();
        long = marker.getPosition().lng();

        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({ latLng: marker.getPosition()}, function (result, status) {
            if (status == google.maps.GeocoderStatus.OK) {  // This line can also be written like if ( status == google.maps.GeocoderStatus.OK ) {
                address = result[0].formatted_address;
                resultArray = result[0].address_components;
                addressEl.value = address;
                latEl.value = lat;
                longEl.value = long;
            } else {
                console.log('Geocode was not successful for the following reason: ' + status);
            }

            // Closes the previous info window if it already exists
            if (infoWindow) {
                infoWindow.close();
            }

            /**
             * Creates the info Window at the top of the marker
             */
            infoWindow = new google.maps.InfoWindow({
                content: address
            });

            infoWindow.open(map, marker);
        });
    });
}
google.maps.event.addDomListener(window, 'load', initialize);





