<?php
include_once ("../database.inc");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Ser efter om den requst der bliver sendt er en POST request
if($_SERVER["REQUEST_METHOD"] == "POST"){
    //Laver en connection til databasen og sætter den til en lokal variabel
    $database = new Database();
    $db = $database->getConnection();


    //Sætter variabler til at være de informationer der kommer fra $post requster
    $name = $_POST['name'];
    $plainpass = $_POST['password'];

    $selectquery = "SELECT password FROM users WHERE name = '$name';"; 
    

    //Forbereder query statment for at checke at den er en valid query
    $stmt = $db->prepare($selectquery);
        // Prøver at execute statement queriet for at se om der bliver meldt fejl af databasen
        try {
            // execute query og return den for at lave check på den
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            extract($row);
            $hashpass = password_verify ($plainpass, $password); 
            if($hashpass){
                $out['result'] = 1;
                $out['message'] = "Du er nu logget ind";
            }else{
                $out['result'] = 0;
                $out['message'] = "Der er sket en fejl";
            }
            
            $json = json_encode($out);
            return print_r($json);
        } catch (PDOException $e) {
            // Returner error koden så der kan laves håndtering på den
            echo $e;
            return ($e);
        }
}