<?php
/*
  Run the SQL in PHP-obj-arr-2.sql for tables to manipulate
*/

// Include the user class
include('lib/User.php');

// Empty array initalized
$arrayOfUsers = [];

// Creating a MySQLi class
$conn = new mysqli('localhost', 'newuser', '', 'testDB');

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

  if($object->isAdmin){
    echo '<p>' . $object->full_name .' is an Admin</p>';
  }
  else if($object->isMod) {
    echo '<p>' . $object->full_name .' is a Moderator</p>';
  }
  else if($object->isUser){
    echo '<p>' . $object->full_name .' is a User</p>';
  }
  else {
    echo '<p>' . $object->full_name .' is unidentifyable </p>';
  }

}

// Using this to echo a perticular object's value from the array
echo 'Id of admin user : ' . $arrayOfUsers['Person1']->id;
?>
