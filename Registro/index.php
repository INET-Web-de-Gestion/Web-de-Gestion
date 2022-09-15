<?php

session_start();

if (isset($_SESSION['user_key'])) {
  header('Location: ../Home');
}

if($_POST){
  $name = $_POST['inp_name'];
  $surname = $_POST['inp_surname'];
  $email = $_POST['inp_email'];
  $password = $_POST['inp_password'];

  require "../database/database.php";

  $conecction = database::connect();

  $query = "insert into tb_users (name, surname, email, password) values (:name, :surname, :email, :password);";
  $stmt = $conecction->prepare($query);
  $stmt->bindParam(":name", $name);
  $stmt->bindParam(":surname", $surname);
  $stmt->bindParam(":email", $email);
  $password_hashed = password_hash($password, PASSWORD_BCRYPT);
  $stmt->bindParam(':password', $password_hashed);
  $stmt->execute();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registro</title>
</head>
<body>
  <form action="./" method="POST">
    <div class="control">
      <label for="inp_name">Nombre</label>
      <input require type="text" name="inp_name" id="inp_name">
    </div>
    <div class="control">
      <label for="inp_surname">Apellido</label>
      <input require type="text" name="inp_surname" id="inp_surname">
    </div>
    <div class="control">
      <label for="inp_email">Email</label>
      <input require type="email" name="inp_email" id="inp_email">
    </div>
    <div class="control">
      <label for="inp_password">Password</label>
      <input require type="password" name="inp_password" id="inp_password">
    </div>
    <div class="control">
      <input type="submit" name="submit" id="submit">
    </div>
  </form>
</body>
</html>
