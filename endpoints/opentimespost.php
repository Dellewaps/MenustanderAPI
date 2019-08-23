<?php
include_once("../database.inc");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Ser efter om den requst der bliver sendt er en POST request
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    //Laver en connection til databasen og sætter den til en lokal variabel
    $database = new Database();
    $db = $database->getConnection();

    if (isset($_POST['morningOpen']) && isset($_POST['morningClose'])) {
        //Sætter variabler til at være de informationer der kommer fra $post requster
        $Id = 1;
        $open = $_POST['morningOpen'];
        $closed = $_POST['morningClose'];

        //Laver en query statment med det som skal sættes ind i databasen
        $query = " UPDATE opentimes SET open = '$open', closed = '$closed' WHERE Id = $Id ";
        //Forbereder query statment for at checke at den er en valid query
        $stmt = $db->prepare($query);
        // execute query 
        $stmt->execute();
    }
    if (isset($_POST['beforeDinnerOpen']) && isset($_POST['beforeDinnerClose'])) {
        //Sætter variabler til at være de informationer der kommer fra $post requster
        $Id = 2;
        $open = $_POST['beforeDinnerOpen'];
        $closed = $_POST['beforeDinnerClose'];

        //Laver en query statment med det som skal sættes ind i databasen
        $query = " UPDATE opentimes SET open = '$open', closed = '$closed' WHERE Id = $Id ";
        //Forbereder query statment for at checke at den er en valid query
        $stmt = $db->prepare($query);
        // execute query 
        $stmt->execute();
        } 
    if (isset($_POST['dinnerOpen']) && isset($_POST['dinnerClose'])) {
        //Sætter variabler til at være de informationer der kommer fra $post requster
        $Id = 3;
        $open = $_POST['dinnerOpen'];
        $closed = $_POST['dinnerClose'];

        //Laver en query statment med det som skal sættes ind i databasen
        $query = " UPDATE opentimes SET open = '$open', closed = '$closed' WHERE Id = $Id ";
        //Forbereder query statment for at checke at den er en valid query
        $stmt = $db->prepare($query);
        // execute query 
        $stmt->execute();
    } 
    if (isset($_POST['afternoonOpen']) && isset($_POST['afternoonClose'])) {
        //Sætter variabler til at være de informationer der kommer fra $post requster
        $Id = 4;
        $open = $_POST['afternoonOpen'];
        $closed = $_POST['afternoonClose'];

        //Laver en query statment med det som skal sættes ind i databasen
        $query = " UPDATE opentimes SET open = '$open', closed = '$closed' WHERE Id = $Id ";
        //Forbereder query statment for at checke at den er en valid query
        $stmt = $db->prepare($query);
        // execute query 
        $stmt->execute();
    }     
    // Prøver at execute statement queriet for at se om der bliver meldt fejl af databasen
    try {
        //return den for at lave check på den
        $out['result'] = 1;
        $out['message'] = "Åbningstider er gemt";
        $json = json_encode($out);
        return print_r($json);
    } catch (PDOException $e) {
        // Returner error koden så der kan laves håndtering på den
        return ($e);
    }

}

