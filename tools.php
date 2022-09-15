<?php

function get_user($email){
  require "../database/database.php";

  $conecction = database::connect();
  $query = "SELECT * FROM tb_users WHERE email = :email;";
  $stmt = $conecction->prepare($query);
  $stmt->bindParam(":email", $email);
  $stmt->execute();

  $records = $stmt->fetch(PDO::FETCH_ASSOC);

  return $records;
}

function get_user_by_key($user_key){
  require "../database/database.php";

  $conecction = database::connect();
  $query = "SELECT * FROM tb_users WHERE user_key = :user_key;";
  $stmt = $conecction->prepare($query);
  $stmt->bindParam(":user_key", $user_key);
  $stmt->execute();

  $records = $stmt->fetch(PDO::FETCH_ASSOC);

  return $records;
}
