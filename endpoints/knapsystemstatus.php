<?php
include_once ("../database.inc");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Laver en connection til databasen og sætter den til en lokal variabel
$database = new Database();
$db = $database->getConnection();

$query = "SELECT Status FROM kantine ORDER BY Id DESC LIMIT 1";
$stmt = $db->prepare($query);
    try{
        $stmt->execute();
         $kantine=array();
        $kantine["records"]=array();
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $kantinestatus=array(
                "Status" => $Status,
            );
            // Tager dataet og pusher til det array som blev lavet til at store selve datasættet
            array_push($kantine["records"], $kantinestatus);
        }
        http_response_code(200);
        $JSON = json_encode($kantine);
        print_r($JSON);
    } catch(PDOException $e){
        return($e);
    }
?>