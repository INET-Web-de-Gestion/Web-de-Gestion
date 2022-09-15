<?php

session_start();

if (isset($_SESSION['user_key'])) {
  header('Location: ../Home');
}

if($_POST){
  require "../tools.php";
  $email = $_POST['inp_email'];
  $password = $_POST['inp_password'];

  $record_user = get_user($email);

  if(count($record_user) > 0){
    if(password_verify($password, $record_user['password'])){
      $_SESSION["user_key"] = $record_user['user_key'];
      header("Location: https://localhost/Web-de-Gestion/Home/");
    }
  }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
</head>
<body>
  <form action="./index.php" method="POST">
    <div class="control">
      <label for="inp_email">Email</label>
      <input type="text" name="inp_email" id="inp_email">
    </div>
    <div class="control">
      <label for="inp_password">Password</label>
      <input type="password" name="inp_password" id="inp_password">
    </div>
    <div class="control">
      <input type="submit" value="Enviar">
    </div>
  </form>
</body>
</html>
