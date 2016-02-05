$(document).ready(function() {
  var googleMapsKey;

  var request = $.ajax({
      method: "get",
      url: '/traffic'
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

      console.log(lat);
      console.log(lng);
      console.log(accuracy);
    });


    request.fail(function (error) {
      var xyz = error;
    });
  }

  $(".excuse").on("submit", "#rating", function(event){
      event.preventDefault();
      var action = $(this).attr("action");
      var ratingData = $(this).serialize();
      var request = $.ajax({
          method: "post",
          url: action,
          data: ratingData
      });

      request.done(function(rating){
          $(this).find('#' + rating.rating_value).prop('checked', true);
      }.bind(this));
  });
  // $("form").on("submit", getLocationFromGMaps);

  // function initMap() {
  //    var map = new google.maps.Map(document.getElementById('map'), {
  //      zoom: 13,
  //      center: {lat: 47.62040000000000, lng: 122.34910000000000}
  //    });

  //    var trafficLayer = new google.maps.TrafficLayer();
  //    trafficLayer.setMap(map);
  //  }



});
