<?php
include_once ("../database.inc");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Ser efter om den requst der bliver sendt er en POST request
if($_SERVER["REQUEST_METHOD"] == "POST")
{
    // Laver en connection til databasen og sætter den til en lokal variabel
    $database = new Database();
    $db = $database->getConnection();

    
    // Sætter variabler til at være de informationer der kommer fra $post requster
    if(isset($_POST['sideone']))
    {
        $sideone = (int)$_POST['sideone'];
    }else 
    {
        $sideone = null; 
    }

    if (isset($_POST['sidetwo']))
    {
        $sidetwo = (int)$_POST['sidetwo'];
    }else
    {
        $sidetwo = null;
    }

    if (isset($_POST['sidethree']))
    {
        $sidethree = (int)$_POST['sidethree'];
    }else
    {
        $sidethree = null;
    }

    if (isset($_POST['sidefour']))
    {
        $sidefour = (int)$_POST['sidefour'];
    }else
    {
        $sidefour = null;
    }
     
    $description = $_POST['description'];

    

    // Laver en query statment med det som skal sættes ind i databasen
    $query = " INSERT INTO dailies (description, sideone, sidetwo, sidethree, sidefour) 
                VALUES ('$description', '$sideone', '$sidetwo', '$sidethree', '$sidefour') ";
    
    
    // Forbereder query statment for at checke at den er en valid query
    $stmt = $db->prepare($query);
        // Prøver at execute statement queriet for at se om der bliver meldt fejl af databasen
        try {
            // execute query og return den for at lave check på den
            $stmt->execute();
            $out['result'] = 1;
            $out['message'] = "Dagen's menu er nu gemt";
            $json = json_encode($out);
            return print_r($json);
        } catch (PDOException $e) {
            // Returner error koden så der kan laves håndtering på den
            return ($e);
        }
}