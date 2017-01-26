<?php
/*
  Run the SQL in PHP-obj-arr-2.sql for tables to manipulate
*/

// Include the user class
include('lib/loader.php');

$user = new users();

$user->get(['pk' => '1']);

echo $user->full_name;


echo '<pre>';
print_r($user);
echo '</pre>';

?>
