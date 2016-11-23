<!DOCTYPE html>
 <head>
  <meta charset="UTF-8">
  <title>ECHO POST</title> 
 </head>
 <body>
  <?php echo 'Hello ' . $_POST["name"]; ?>
  <br>
  <?php echo 'We will ship ' . $_POST["qty"] . ' of product id ' . $_POST["pid"] . ' in ' . $_POST["colour"] . '.<br>The cost is ' . ($_POST["price"]+$_POST["size"])*$_POST["qty"] . '.'; ?>
 </body>
</html>
