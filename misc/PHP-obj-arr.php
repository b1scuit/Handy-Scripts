<?Php

// The class

class Animal {

  public $noOfLegs;

  public $noOfEyes;

  public $name;


  public function __construct($name){
    $this->name = $name;

    return true;
  }

  public function breath(){

    return true;
  }

}

// The array of what your classes will be based on

$arrayOfAnimals =
[
  'Cow' => ['legs' => 4, 'eyes' => 2],
  'Duck' => ['legs' => 2, 'eyes' => 2],
  'Dog' => ['legs' => 4, 'eyes' => 2],
  'Spider' => ['legs' => 8, 'eyes' => 8]
];

$arrayOfObjects = [];

// Turning the array into instances of the class

foreach ($arrayOfAnimals as $key => $value){

  // Create an instance of the class
  $arrayOfObjects[$key] = new Animal($key);

  // Populate with inital values
  $arrayOfObjects[$key]->noOfLegs = $value['legs'];
  $arrayOfObjects[$key]->noOfEyes = $value['eyes'];

}

// What you would use this for

foreach($arrayOfObjects as $object){
  echo '<p>A ' . $object->name . ' has ' . $object->noOfEyes . ' eyes and ' . $object->noOfLegs . ' legs.</p>';
}

echo $arrayOfObjects['Cow']->noOfLegs;

?>
