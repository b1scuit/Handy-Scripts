/*
  MCP2221 USB to i2c

  MCP23017 as LCD controller

  GPIOA P0 - P7 = LCD D0 - D7
  GPIOB P0 RS
  GPIOB P1 E

  You will need the typeIds.yaml file from https://developers.eveonline.com/resource/resources

 */

var i2c = require('i2c');
var sleep = require('sleep');
var dateTime = require('node-datetime');
var commandLineArgs = require('command-line-args');
var getUsage = require('command-line-usage');
var isRoot = require('is-root');
var os = require('os');
var request = require('request');
var prettyjson = require('prettyjson');
var parseString = require('xml2js').parseString;
var libxmljs = require("libxmljs");
var yaml = require('js-yaml');
var fs   = require('fs');


const optionDefinitions = [
  { name: 'string', alias: 's', type:String, multiple: true, defaultValue: [ "Hello World", "Hello World", "Hello World", "Hello World" ]},
  { name: 'device', alias: 'y', type: Number, defaultValue: 7},
  { name: 'date', alias: 'd', type: Boolean, defaultValue: false },
  { name: 'eveData', alias: 'e', type: Boolean, defaultValue: false },
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

var eveSite = 'https://api.eveonline.com/';


var gpio = new i2c(0x20, {device: '/dev/i2c-' + options.device});
// Set IODIRA to output
gpio.write([0x00, 0x00], function(err){ if(err != null) { console.log(err); } });

// Set IODIRB to output
gpio.write([0x01, 0x00], function(err){if(err != null) { console.log(err);} });

main();

function writeA(value){
  gpio.write([0x12, value], function(err){ return true; });
  return true;
}

function writeB(value){
  gpio.write([0x13, value], function(err){ return true; });
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

  sendInstruction(0x01);
  sendInstruction(0x80);

  writeSentance('Home:' + os.homedir(), 3);
  writeSentance('IP: ' + os.networkInterfaces().enp3s0[0].address, 4);

  while(1) {

    dt = dateTime.create();
    formatted = dt.format('H:M:S');

    writeSentance('Time : ' + formatted, 1);
    writeSentance('CPU usage: ' + parseFloat(os.loadavg()[0],2.3).toFixed(3) , 2);


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
      initalize();

      other();
    } else if (options.eveData == true){
      initalize();
      eveData();
    }  else {
      initalize();

      var counter = 1 ;
      options.string.forEach(function(value){
        writeSentance(value, counter);
        counter = counter + 1;
      })

      //other();
    }
  } else {
    console.log('This needs to run as root ');
  }

  return true;

}

function eveData(){


  count = 0;
  setInterval(function(){

    if(count == 0){
      getcharBal();
    }else if (count == 1){
      getTrainingSkill();
    } else if (count == 2){
      getCorpBal();
    }


    if(count == 2){
      count = 0;
    } else {
      count++;
    }

  }, 5000)

}

function getCorpBal(){


  request(eveSite+'/corp/AccountBalance.xml.aspx?characterID=0000000&keyID=0000000&vCode=00000000000000000000000000000000000000000000000000', function(err, res, body) {
    var xmlDoc = libxmljs.parseXmlString(body, { noblanks: true });
    var wallet = parseInt(xmlDoc.get('//row[@accountID="00000000000"]/@balance').value());

    // Clear the display
    sendInstruction(0x01);
    sendInstruction(0x80);

    writeSentance('Corporate Balance:', 2);
    writeSentance(wallet.toLocaleString() + ' ISK', 3);

  });

}

function getcharBal(){
  request(eveSite+'/char/AccountBalance.xml.aspx?characterID=0000000&keyID=0000000&vCode=00000000000000000000000000000000000000000000000000', function(err, res, body) {
    var xmlDoc = libxmljs.parseXmlString(body, { noblanks: true });
    var wallet = parseInt(xmlDoc.get('//row[@accountID="0000000000"]/@balance').value());

    // Clear the display
    sendInstruction(0x01);
    sendInstruction(0x80);

    writeSentance('Character Balance:', 2);
    writeSentance(wallet.toLocaleString() + ' ISK', 3);
  });
}

function getTrainingSkill(){
  request(eveSite+'/char/SkillQueue.xml.aspx?characterID=0000000&keyID=0000000&vCode=00000000000000000000000000000000000000000000000000', function(err, res, body) {
    var xmlDoc = libxmljs.parseXmlString(body, { noblanks: true });
    try {
      var doc = yaml.safeLoad(fs.readFileSync('typeIds.yaml', 'utf8'));

      var skill = doc[xmlDoc.get('//row[@queuePosition="0"]/@typeID').value()];
      var level = xmlDoc.get('//row[@queuePosition="0"]/@level').value();

      // Clear the display
      sendInstruction(0x01);
      sendInstruction(0x80);

      writeSentance('Training:', 1)
      writeSentance('lvl ' + level + ' ' + skill.name.en, 2);

      var skillTime = xmlDoc.get('//row[@queuePosition="0"]/@endTime').value();
      dt = dateTime.create(skillTime);
      formatted = dt.format('d/m H:M');
      writeSentance('Finishes on: ', 3);
      writeSentance(formatted, 4);

    } catch (e) {
      console.log(e);
    }

  });
}
