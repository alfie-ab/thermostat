$(document).ready(function() {

  $("#selectCity").change(function(){
      var city = this.value;
      $.get("http://api.wunderground.com/api/80a7e4a889aa4897/geolookup/conditions/q/" + city + ".json", function(parsed_json) {
      var location = parsed_json['location']['city'];
      var temp_c = parsed_json['current_observation']['temp_c'];
      $('#location').text("Current temperature in " + location + " is: " + temp_c + " degrees");
    });
  });

  var thermostat = new Thermostat();
  updateTemperature();

  $('#temperature-up').click(function() {
    thermostat.increaseTemperature();
    updateTemperature();
    $.post("http://localhost:9292/temperature", { temp: thermostat._temperature });
  });

  $('#temperature-down').click(function() {
    thermostat.decreaseTemperature();
    updateTemperature();
  });

  $('#temperature-reset').click(function() {
    thermostat.resetTemperature();
    updateTemperature();
  });

  $('#powersaving-switch').click(function() {
    thermostat.powerSaveSwitch();
    $('#powersaving-status').text(thermostat._powerSaveMode);
  });

  function updateTemperature() {
    $('#temperature').text(thermostat.showTemperature());
    $('body').attr('class', thermostat.colourSwitch());
  }

});
