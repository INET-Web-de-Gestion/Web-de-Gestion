<?php

class database{
  
  public static function connect(){
    
    define("SERVER", "localhost");
    define("USERNAME", "root");
    define("PASSWORD", "");
    define("DATABASE", "inet");

    try{
      $connection = new PDO("mysql:host=" . SERVER . ";dbname=" . DATABASE . ";", USERNAME, PASSWORD);
    } catch(PDOException $e){
      die('Conexion a Base de Datos Fallida. <br>' . $e->getMessage());
    }
    
    return $connection;
  } 
}
