<?php
  session_start();

  if (!isset($_SESSION['user_key'])) {
    header('Location: ../Login');
  }
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home</title>
</head>
<body>
  
  <a href="https://localhost/Web-de-Gestion/logout.php">Salir</a>
  <a href="https://localhost/Web-de-Gestion/Reservar/">Reservar</a>
  <?php
    require "C:/xampp/htdocs/Web-de-Gestion/tools.php";

    $user = get_user_by_key($_SESSION["user_key"]);

    echo "HOLA " . $user['name'];
  ?>
</body>
</html>
