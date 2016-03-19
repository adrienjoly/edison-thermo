/*jslint node:true,vars:true,bitwise:true,unparam:true */
/*jshint unused:true */

var TemperatureSensor = require('./TemperatureSensor');
var LcdDisplay = require('./LcdDisplay');

var tempSensor = new TemperatureSensor().start(500);
var display = new LcdDisplay();

// clear screen
display.setColor(0, 0, 255);
display.writeLines(['', '']);

tempSensor.on('temp', function onTemperature(celsius){
  console.log('temp', celsius);
  display.writeLines(['Temp.', ' ' + ('' + celsius).substr(0, 4) + ' celsius']);
});
