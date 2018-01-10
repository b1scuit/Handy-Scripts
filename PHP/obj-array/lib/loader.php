<?php
class config{
  public static $mysql;

  public function __construct(){
    self::$mysql = [
      'Server' => 'localhost',
      'User' => 'newuser',
      'Password' => '',
      'Database' => 'testDB'
    ];
  }
}

$config = new Config();
include('controllerClass.php');
include('users.php');

?>
