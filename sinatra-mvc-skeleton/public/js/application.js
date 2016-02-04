$(document).ready(function() {
  var googleMapsKey;

  var request = $.ajax({
      method: "get",
      url: '/ttrraaffiicc'
    });
  request.done(function (secretGMapKey) {
    googleMapsKey = secretGMapKey;
  });

  function getLocationFromGMaps(event) {
    event.preventDefault();
    var request = $.ajax({
      method: "post",
      url: 'https://www.googleapis.com/geolocation/v1/geolocate?key=' + googleMapsKey,
      data: JSON.stringify({ "considerIp": "true"}),
      contentType: 'application/json'
    });

    request.done(function (response) {
      var lat = response.location.lat;
      var lng = response.location.lng;
      var accuracy = response.accuracy;
    });

    request.fail(function (error) {
      var xyz = error;
    });
  }


  $("form").on("submit", getLocationFromGMaps);
});
