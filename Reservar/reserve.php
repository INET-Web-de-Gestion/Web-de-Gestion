<?php

/*
  Funcionamiento del sistema de turnos.
  
  sabemos que hay varias formas de pedir un turno, en la carniceria, sacas
  un numero. Pero es un farmacia central por ejemplo sacas un numero en cierto horario.
  en cualquier forma de funcionamiento:
    + Si paso tu turno y sigue otro, perdiste el turno. Si queres tener un turno deberas sacar otro.
    + Los turnos funcionan como una pila FIFO (first in, firs out) o cola.
      lo primero que entra es lo primero en salir, como una orden de llegada.
  un turno basicamente consiste en bridarse de algo, de darse a tener el lugar.
  Los turnos los pueden hacer una persona o un grupo de personas.
  La aplicacion de los turnos es cuando:
  + No hay tanto espacio fisico en un lugar y necesitan de turnarse (la genta para poder
  entrar en un espacio fisico) o cuando el servicio que esperamos tener solo puede realizarse
  de a una persona y no varias *al mismo tiempo*.
    
  caracteristicas de los turnos:
    + Las personas no tienen el mismo tiempo e nel turno que las demas. difieren en cada una.
    una puede tardar mas o menos que otra.
  
  Los turnos se basan en el tiempo u orden de llegada.

  supongamos estas dos formas:

  En el banco hay que hacer una pila fifo enorme desde las 8 para que habra a las 10.
  el turno lo tenes luego de que pasen las personas de adelante.
  .*el metodo de reservamiento del turno* se basa en el orden a la llegada al banco.
  el turno se reserva llegando al banco.

  Existen Fulano y Mengano. Hoy es lunes y son las 12:00. Y Abre de 8:00 a 18:00 el museo.
  En el sitio del museo
   1ero. Entra Mengano y reserva su turno para el martes a las 10:00.
   2do. entra Fulano y reserva su turno para el lunes a las 13:00 (hoy).

  Por mas de que Mengano haya entrado primero al primero que le va a tocar es Fulano.
  
  En el museo se investigo y se concluyo que una persona/grupo de personas tardan en promedio 1h.
  El museo tiene una capacidad de 100 personas.

  Si cada turno dura 1h. entonces los turnos se reservan para las 8:00, 9:00, 10:00, etc.
  El sistema deja solo hasta 100 personas reservar para cada hora.

  Los turnos tiene el objetivo de:
  hacer que el museo no se colapse de gente.

  estaria bueno que solo esperes 15, 20 minutos en la cola.

  la cosa es el criterio, el algoritmo de darle la posibilidad al usuario de reservar un turno.

*/

session_start();
require "../database/database.php";

$conecction = database::connect();

$date = $_POST['inp_date'] . " " . $_POST['inp_schedule'];
$user_key = $_SESSION['user_key'];

$query = "insert into tb_turns (date, user_key) values (:date, :user_key);";
$stmt = $conecction->prepare($query);
$stmt->bindParam(":date", $date);
$stmt->bindParam(":user_key", $user_key);
$stmt->execute();
