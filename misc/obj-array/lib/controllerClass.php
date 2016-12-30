<?php

// Creating a user class
class controllerClass {

  public function __construct($data){

    // Turn all the MySQL fields into properties
    $this->genAlias($data);

    return true;
  }

  // Create alias fields (A field that's made of other fields and
  //  dosn't actully exist, you can just pretend it does)
  protected function genAlias($aliasArr){

    // Generate any alias fields we may want
    foreach($aliasArr as $name => $value){
      $this->{$name} = $value;
    }

    return true;
  }
}

?>
