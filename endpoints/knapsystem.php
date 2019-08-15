<?php
include_once ("../database.inc");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

if(!empty($_POST['status']))
{
    //Laver en connection til databasen og sætter den til en lokal variabel
    $database = new Database();
    $db = $database->getConnection();

    $status = $_POST['status'];

    $query = "INSERT INTO kantine (Status) VALUES ('$status')";

    //Forbereder query statment for at checke at den er en valid query
    $stmt = $db->prepare($query);
        // Prøver at execute statement queriet for at se om der bliver meldt fejl af databasen
        try {
            // execute query og return den for at lave check på den
            $stmt->execute();
            $out['result'] = 1;
            $out['message'] = "status er ændret";
            $json = json_encode($out);
            return print_r($json);
        } catch (PDOException $e) {
            // Returner error koden så der kan laves håndtering på den
            return ($e);
        }
}
print_r($_POST) ;
?>