# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  navigator.geolocation.getCurrentPosition( initGoogleMaps )

initGoogleMaps = (position) ->
  map = $ "#gmap"
  location_field = $ "#flood_location"
  @address = $ "#flood_address"
  lat_field = $ "#flood_latitude"
  long_field = $ "#flood_longitude"
  geo = new google.maps.Geocoder
  fileFieldTemplate = $ '.duplicateable-file-field'

  # Helper functions
  postInitMap = (map) ->
    $('#mapwrap').height('400px').width 'auto'

  setLatLng = (lat, lng) ->
    lat_field.val lat
    long_field.val lng

  reverseGeocode = (latlng, addressField)->
    geo.geocode 'location': latlng, (results, status) ->
      if status == 'OK' && results[0]
        addressField.val results[0].formatted_address

  setCurrentPosition = (position, address) ->
    latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
    setLatLng latlng.lat(), latlng.lng()
    address.geocomplete map: "#gmap", location: latlng
    postInitMap()
    reverseGeocode latlng, address

  # Initialize geocoding plugins
  setCurrentPosition(position, address)

  #  $.geolocation.get(enableHighAccuracy: true).done (position) ->
  #    latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
  #    setLatLng latlng.lat(), latlng.lng()
  #    address.geocomplete map: "#gmap", location: latlng
  #    postInitMap()
  #    reverseGeocode latlng, address

  @address.on 'focus', ->
    address.geocomplete map: "#gmap"

  @address.on "geocode:result", (event, result)->
    setLatLng result.geometry.location.lat(), result.geometry.location.lng()
    postInitMap()

  # Click to add more file upload fields
  # id="flood_attachments_attributes_0_upload" name="flood[attachments_attributes][0][upload]"
  $("#fileAdd").on 'click', ->
    field = fileFieldTemplate.clone().removeClass 'duplicateable-file-field'
    num = $(":file").length
    name = field.attr('name').replace '[0]', "[#{num}]"
    id = field.attr('id').replace '_0_', "_#{num}_"
    wrap = $ "<div class='file-upload-div' />"
    field.attr(id: id, name: name).appendTo wrap
    wrap.appendTo "#fileFields"