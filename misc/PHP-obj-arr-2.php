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
  public $username;
  public $fullName;
  public $role;

  public function __construct($username){

    // Set the inital username so it is accessable across the class
    $this->username = $username;

    // Get the users info
    $info = $this->getInfo();

    // If info came back with anything
    if($info){
      // Assemble data
      $this->username = $info['username'];
      $this->fullName = $info['full_name'];
      $this->role = $info['role'];
    }
  }

  private function getInfo(){
    // Init MySQL connection (This has to be here because of encapsulation $conn cannot be used)
    $mysql = new mysqli('localhost', 'root', '', 'testDB');

    // Create and runa  query, there is no user input so MySQL injection protection is not needed
    $res = $mysql->query('select * from users where username = "' . $this->username . '"');

    // Organise the data and return the result
    if(!$res) {
      return false;
    }

    // Give the data back
    return $res->fetch_assoc();

    // Close MySQL connection
    $mysql->close();

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
$conn = new mysqli('localhost', 'root', '', 'testDB');

// Check you can connect
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get a list of all the usernames in the database
$res = $conn->query('select username from users');

// Close MySQL connection
$conn->close();


// Get the results
if ($res->num_rows > 0) {
    // output data of each row
    while($userData = $res->fetch_assoc()) {
      $arrayOfUsers[$userData['username']] = new User($userData['username']);
    }
}

// What you would use this for (List users, articals, comments etc..)
foreach($arrayOfUsers as $object){
  if($object->isAdmin()){
    echo '<p>' . $object->fullName .' is an admin</p>';
  } else {
    echo '<p>' . $object->fullName .' is not an admin</p>';
  }
}

// Using this to echo a perticular object's value from the array

?>
