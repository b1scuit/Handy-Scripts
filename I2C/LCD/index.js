/*
  MCP2221 USB to i2c

  MCP23017 as LCD controller

  GPIOA P0 - P7 = LCD D0 - D7
  GPIOB P0 RS
  GPIOB P1 E

 */

var i2c = require('i2c');
var sleep = require('sleep');
var dateTime = require('node-datetime');
var commandLineArgs = require('command-line-args');
var getUsage = require('command-line-usage');
var isRoot = require('is-root');

const optionDefinitions = [
  { name: 'string', alias: 's', type:String, multiple: true, defaultValue: [ "Hello World", "Hello World", "Hello World", "Hello World" ]},
  { name: 'device', alias: 'y', type: Number, defaultValue: 7},
  { name: 'date', alias: 'd', type: Boolean, defaultValue: false },
  { name: 'help', alias: 'h', type: Boolean, defaultValue: false }

];

const sections = [
  {
    header : 'LCD Controller',
    content : 'meh, why not eh?'
  },
  {
    header : 'Options',
    optionList: optionDefinitions
  }
];

const options = commandLineArgs(optionDefinitions);

var gpio = new i2c(0x20, {device: '/dev/i2c-' + options.device});
// Set IODIRA to output
gpio.write([0x00, 0x00], function(err){console.log(err); });

// Set IODIRB to output
gpio.write([0x01, 0x00], function(err){console.log(err); });

main();

function writeA(value){
  gpio.write([0x12, value], function(err){ console.log(err); });
  return true;
}

function writeB(value){
  gpio.write([0x13, value], function(err){ console.log(err); });
  return true;
}

function sendInstruction(data){
  if(data != null){
    writeA(data);
  }
  sleep.usleep(1);
  writeB(0x02);
  sleep.usleep(1);
  writeB(0x00);

  return true;
}

function writeCharacter(data){
  writeA(data);

  writeB(0x03);
  sleep.usleep(1);
  writeB(0x00);

  return true;
}

function initalize(){


  // Clear both lines ready for use
  writeA(0x00);
  writeB(0x00);

  // Wake up the device

  // First wait
  sleep.msleep(15);
  sendInstruction(0x30);

  // Second wait
  sleep.msleep(5);
  sendInstruction();

  // Third Wait
  sleep.usleep(200);
  sendInstruction();

  // Function set
  sendInstruction(0x38);

  // Display Off
  sleep.msleep(5);
  sendInstruction();

  // Clear display
  sendInstruction(0x01);

  // Entry mode set
  sendInstruction(0x06);

  // Turn display on and set cursor
  sendInstruction(0x0F);

  // Relocate cursor
  writeA(0x80);
  sendInstruction();

  return true;
}


function writeSentance (data, line){

  //console.log('Writing : ' + data);

  if(line == 1){
    writeA(0x80);
    sendInstruction();
  } else if (line == 2){
    writeA(0xC0);
    sendInstruction();
  } else if (line == 3){
    writeA(0x94);
    sendInstruction();
  } else if (line == 4){
    writeA(0xD4);
    sendInstruction();
  }

  for (var i = 0, len = data.length; i < len; i++) {
    writeCharacter(data[i].charCodeAt());
  }

  return true;
}

  function other(){

  var dt;
  var formatted;

  while(1) {

    dt = dateTime.create();
    formatted = dt.format('Y-m-d H:M:S');

    writeSentance('Current Date: ', 2);
    writeSentance(formatted, 3);
  }

  return true;
}

function main(){
  // Check if root is running
  if(isRoot()){
    // Display help if requested
    if(options.help == true){
      const usage = getUsage(sections);
      console.log(usage);
    } else if (options.date == true){
      other();
    }  else {
      // Otherwise spin up the app
      initalize();

      console.log(options);


      var counter = 1 ;
      options.string.forEach(function(value){
        writeSentance(value, counter);
        counter++;
      })

      writeSentance(options.string[1], options.line);
      //other();
    }
  } else {
    console.log('This needs to run as root ');
  }

  return true;

}
