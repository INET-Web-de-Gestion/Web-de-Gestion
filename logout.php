<?php
  echo "En logout.php";
  
  session_start();

  session_unset();

  session_destroy();

  header('Location: https://localhost/Web-de-Gestion/Login');
?>
