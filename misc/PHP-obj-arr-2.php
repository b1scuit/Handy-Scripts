<?php
/*

Run this SQL

CREATE DATABASE IF NOT EXISTS `testDB`;
USE `testDB` ;

CREATE TABLE IF NOT EXISTS `testDB`.`users` (
`id` INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
`username` VARCHAR(45) NULL DEFAULT NULL,
`full_name` VARCHAR(45) NULL DEFAULT NULL,
`role` VARCHAR(45) NULL DEFAULT NULL);

INSERT INTO `testDB`.`users` (`id`, `username`, `full_name`, `role`) VALUES (DEFAULT, 'Person1', 'Person one', 'Admin');
INSERT INTO `testDB`.`users` (`id`, `username`, `full_name`, `role`) VALUES (DEFAULT, 'Person2', 'Person Two', 'Moderator');
INSERT INTO `testDB`.`users` (`id`, `username`, `full_name`, `role`) VALUES (DEFAULT, 'Person3', 'Person Three', 'User');

 */

// Creating a user class
class User {

  public function __construct($data){

    // Turn all the MySQL fields into properties
    foreach($data as $key => $value){
      $this->{$key} = $value;
    }
    // Create any alias fields we would want
    $this->genFullName();

  }

  public function genFullName(){
    $this->{'full_name'} = $this->firstname . ' ' . $this->surname;
    return true;
  }


  // Check if the user is a member of the admin role
  public function isAdmin(){

    // If there's nothing in role, just send back no
    if(!$this->role) return false;

    // If there is generate a boolean value from comparing the role to the admin string
    return (bool) ($this->role == 'Admin');
  }
}


// Empty array initalized
$arrayOfUsers = [];

// Creating a MySQLi class
$conn = new mysqli('localhost', 'newuser', '', 'testDB');

// Check you can connect
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get a list of all the users in the database
$res = $conn->query('select * from users');

// Close MySQL connection
$conn->close();



// Get the results
if ($res->num_rows > 0) {
    // output data of each row
    while($userData = $res->fetch_assoc()) {
      $arrayOfUsers[$userData['username']] = new User($userData);
    }
}

// What you would use this for (List users, articals, comments etc..)
foreach($arrayOfUsers as $object){
  if($object->isAdmin()){
    echo '<p>' . $object->full_name .' is an admin</p>';
  } else {
    echo '<p>' . $object->full_name .' is not an admin</p>';
  }
}

// Using this to echo a perticular object's value from the array
$array
?>
