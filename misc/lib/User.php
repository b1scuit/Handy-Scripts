<?php
include('controllerClass.php');
// Creating a user class
class User extends controllerClass {

  public function __construct($data){

    // Run the parent class's constructor
    parent::__construct($data);

    // Declare and generateany alias fields
    $this->genAlias([
      'full_name' => $this->firstname . ' ' . $this->surname,
      'isAdmin' => (bool) ($this->role == 'Admin'),
    ]);

  }
}

?>
