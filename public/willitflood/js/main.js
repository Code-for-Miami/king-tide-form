function initMap () {
  window.king = 2.5;
  loadStations();
  let     selector = document.querySelector("#kingme");
  let        input = document.getElementById("pac-input");
  let          map = new google.maps.Map(
                       document.getElementById("map"), {
                         center: { lat: 25.7823072, lng: -80.3010434 },
                         zoom: 12
                     });
  let autocomplete = new google.maps.places.Autocomplete(input);
  let       marker = new google.maps.Marker({ map: map });

  // Adds Places auto complete to Map
  autocomplete.bindTo("bounds", map);

  // Positions Places auto complete to top left of map
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  // Adds a Marker and Centers Map on Auto completed location
  autocomplete.addListener("place_changed", function () {
    let place = this.getPlace();

    if (!place.geometry) return;
    if (place.geometry.viewport === undefined) map.setZoom(17);

    map.setCenter( place.geometry.location ); // Centers Map on location
    map.fitBounds(place.geometry.viewport);
    marker.setPosition( place.geometry.location ); // Moves Marker to Location
  });

  // Runs Draw Calender on Auto Complete
  autocomplete.addListener("place_changed", function () {
    drawCalendar(map, this.getPlace())
  });

  // Refreshes Calender on Tide Level Limit Change
  selector.addEventListener("change", function(event) {
    let value = event.target.value;
    window.king = Number(value);
    drawCalendar(map);
  });
}

function drawCalendar(map, place) {
  if (!place.geometry) return;

  let       latitude = place.geometry.location.lat();
  let      longitude = place.geometry.location.lng();
  let       location = place.geometry.location;
  let closestStation = findClosestStation(lats, latitude, longitude);
  let stationDataUrl = "willitflood/tides/" + closestStation.id + "_annual.xml";
  let       distance = closestStation.distance.toPrecision(2);

  getElevation(location, function (elevation) {
    madComposer(elevation, distance)
  });

  loadXMLDoc(stationDataUrl);
}

/**
 * This uses the ‘Haversine’ formula to calculate the great-circle distance
 * between two points – that is, the shortest distance over the
 * earth’s surface – giving an ‘as-the-crow-flies’ distance between
 * the points (ignoring any hills they fly over, of course!).
 *
 * @param {number} lat1 - Latitude of the first coordinate
 * @param {number} lon1 - Longitude of the first coordinate
 * @param {number} lat2 - Latitude of the second coordinate
 * @param {number} lon2 - Longitude of the second coordinate
 *
 * @return {Number} The distance between the to points
 */
function getDistanceFromLatLonInMiles(lat1, lon1, lat2, lon2) {
  const RADIUS_OF_EARTH = 3959;

  let degrees2radians = function(degrees) {
    return degrees * (Math.PI / 180);
  }; // Degrees to Radians

  let  firstLatRadians = degrees2radians(lat1);
  let secondLatRadians = degrees2radians(lat2);
  let   halfLatRadians = degrees2radians(lat2 - lat1) / 2; // Latitude to Radians Divided by 2
  let   halfLonRadians = degrees2radians(lon2 - lon1) / 2; // Longitude to Radians Divided by 2

  // The square of half the chord length between the points
  let lengthSquared =
    Math.sin(halfLatRadians) * Math.sin(halfLatRadians) +
    Math.cos(firstLatRadians) * Math.cos(secondLatRadians) *
    Math.sin(halfLonRadians) * Math.sin(halfLonRadians);

  // The angular distance in radians
  let angular_distance_in_radians =
    2 * Math.atan2(Math.sqrt(lengthSquared), Math.sqrt(1 - lengthSquared));

  return RADIUS_OF_EARTH * angular_distance_in_radians // Distance in KM
}

/**
 * This calculates the distance to every station and then finds the closest one.
 *
 * @param {Array}  stations  - Array of Stations to search
 * @param {Number} latitude  - Latitude of Location
 * @param {Number} longitude - Longitude of Location
 *
 * @return {{ id: String, distance: Number }} Station
 */
function findClosestStation (stations, latitude, longitude) {
  return stations.map( (station) => {
    let distance = getDistanceFromLatLonInMiles(station[2], station[3], latitude, longitude);
    return {
      id: station[1], name: station[0],
      lat: station[2], lng: station[3],
      distance: Number(distance)
    }
  }).sort(function (station1, station2) {
    return station1.distance - station2.distance;
  })[0];
}

/**
 * Generates the elevation info madlib.
 *
 * @param {number} theElevation - The elevation in a location
 */
function madElevate (theElevation) {
  let lowElevation = theElevation < 3;
  let averageElevation = theElevation < 8;
  let highElevation = theElevation >= 8;

  function elevationLevel() {
    if (lowElevation) return "low";
    if (averageElevation) return "normal";
    if (highElevation) return "high for South Florida";
    return "unknown";
  }

  function floodLevel() {
    if (lowElevation) return "increased";
    if (averageElevation) return "average";
    if (highElevation) return "decreased";
    return "unknown";
  }

  return (
    "Your elevation of " +
    theElevation +
    " is " +
    elevationLevel() +
    "." +
    " The likelihood that you will see flooding during the high tides is " +
    floodLevel() +
    "."
  );
}

/**
 * Generates the distance info madlib.
 *
 * @param {number} distance - The distance in km to a station.
 */
function madDistance (distance) {

  function proximityText (distance) {
    if (distance > 2) return "The farther you are from the station, the longer it will take flooding from high tides, if any, to reach you.";
    return "The closer you are to the station, the more likely you are to see flooding around the time of the high tides."
  }

  return (
    "Your distance to the tide monitoring station is " + distance + " miles."
    + proximityText(distance)
  )

}

function madComposer (elevation, distance) {
  let elevationText = madElevate(elevation);
  let  distanceText = madDistance(distance);
  let      madLibEl = document.getElementById("madlib");

  madLibEl.style.display = "block";
  madLibEl.innerText = distanceText +' '+ elevationText;
}

function getElevation (location, callback) {
  let elevationService = new google.maps.ElevationService();
  elevationService.getElevationForLocations(
    { locations: [location] }, function ( results, status ) {
      if (status === "OK" && results[0]) {
        let elevation = (3.28084 * results[0].elevation).toPrecision(2);
        return callback(elevation)
      }
    }
  );
}

function loadStations() {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
      window.lats = JSON.parse(this.response);
    }
  };
  xmlhttp.open("GET", "willitflood/tides/stations.json", true);
  xmlhttp.send();
}

function loadXMLDoc (mystation) {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
      var months = loadArray(this);
      renderCalendar(months);
    }
  };
  xmlhttp.open("GET", mystation, true);
  xmlhttp.send();
}
