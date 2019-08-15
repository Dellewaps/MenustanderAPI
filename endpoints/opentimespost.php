<?php
include_once ("../database.inc");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Ser efter om den requst der bliver sendt er en POST request
if($_SERVER["REQUEST_METHOD"] == "POST")
{
    //Laver en connection til databasen og sætter den til en lokal variabel
    $database = new Database();
    $db = $database->getConnection();

    
    //Sætter variabler til at være de informationer der kommer fra $post requster
    if(isset($_POST['opentime1']))
    {
        $opentime1 = (int)$_POST['opentime1'];
    }else 
    {
        $opentime1 = null; 
    }

    if (isset($_POST['closetime1']))
    {
        $closetime1 = (int)$_POST['closetime1'];
    }else
    {
        $closetime1 = null;
    }

    if (isset($_POST['opentime2']))
    {
        $opentime2 = (int)$_POST['opentime2'];
    }else
    {
        $opentime2 = null;
    }

    if (isset($_POST['closetime2']))
    {
        $closetime2 = (int)$_POST['closetime2'];
    }else
    {
        $closetime2 = null;
    }
     
    if (isset($_POST['opentime3']))
    {
        $opentime3 = (int)$_POST['opentime3'];
    }else
    {
        $opentime3 = null;
    }

    if (isset($_POST['closetime3']))
    {
        $closetime3 = (int)$_POST['closetime3'];
    }else
    {
        $closetime3 = null;
    }

    if (isset($_POST['opentime4']))
    {
        $opentime4 = (int)$_POST['opentime4'];
    }else
    {
        $opentime4 = null;
    }

    if (isset($_POST['closetime4']))
    {
        $closetime4 = (int)$_POST['closetime4'];
    }else
    {
        $closetime4 = null;
    }

    //Laver en query statment med det som skal sættes ind i databasen
    $query = " INSERT INTO opentimes (opentime1, closetime1, opentime2, closetime2, opentime3, closetime3, opentime4, closetime4) 
                VALUES ('$opentime1', '$closetime1', '$opentime2', '$closetime2', '$opentime3', '$closetime3', '$opentime4', '$closetime4') ";
    
    
    //Forbereder query statment for at checke at den er en valid query
    $stmt = $db->prepare($query);
        // Prøver at execute statement queriet for at se om der bliver meldt fejl af databasen
        try {
            // execute query og return den for at lave check på den
            $stmt->execute();
            $out['result'] = 1;
            $out['message'] = "Åbningstider er nu gemt";
            $json = json_encode($out);
            return print_r($json);
        } catch (PDOException $e) {
            // Returner error koden så der kan laves håndtering på den
            return ($e);
        }
}