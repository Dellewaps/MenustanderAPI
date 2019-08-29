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
    if(isset($_POST['monday']))
    {
        $monday = (int)$_POST['monday'];
    }else 
    {
        $monday = null; 
    }

    if (isset($_POST['tuesday']))
    {
        $tuesday = (int)$_POST['tuesday'];
    }else
    {
        $tuesday = null;
    }

    if (isset($_POST['wednesday']))
    {
        $wednesday = (int)$_POST['wednesday'];
    }else
    {
        $wednesday = null;
    }

    if (isset($_POST['thursday']))
    {
        $thursday = (int)$_POST['thursday'];
    }else
    {
        $thursday = null;
    }
     
    if (isset($_POST['friday']))
    {
        $friday = (int)$_POST['friday'];
    }else
    {
        $friday = null;
    }

    $mondaycheck = $_POST['mondaycheck'];
    $tuesdaycheck = $_POST['tuesdaycheck'];
    $wednesdaycheck = $_POST['wednesdaycheck'];
    $thursdaycheck = $_POST['thursdaycheck'];
    $fridaycheck = $_POST['fridaycheck'];

    //Laver en query statment med det som skal sættes ind i databasen
    $query = " INSERT INTO weekmenus (monday, tuesday, wednesday, thursday, friday, mondaycheck, tuesdaycheck, wednesdaycheck, thursdaycheck, fridaycheck) 
                VALUES ('$monday', '$tuesday', '$wednesday', '$thursday', '$friday', '$mondaycheck', '$tuesdaycheck', '$wednesdaycheck', '$thursdaycheck', '$fridaycheck') ";
    
    
    //Forbereder query statment for at checke at den er en valid query
    $stmt = $db->prepare($query);
        // Prøver at execute statement queriet for at se om der bliver meldt fejl af databasen
        try {
            // execute query og return den for at lave check på den
            $stmt->execute();
            $out['result'] = 1;
            $out['message'] = "Ugen's menu er nu gemt";
            $json = json_encode($out);
            return print_r($json);
        } catch (PDOException $e) {
            // Returner error koden så der kan laves håndtering på den
            return ($e);
        }
}