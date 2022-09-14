<?php

session_start();

if (isset($_SESSION['user_key'])) {
  header('Location: ../Home');
}

?>
