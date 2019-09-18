<?php
include_once ("../database.inc");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Laver en connection til databasen og sætter den til en lokal variabel
$database = new Database();
$db = $database->getConnection();

// Laver en query statment med det som skal hentes fra databasen
$query = "SELECT * FROM weekmenus ORDER BY weekmenus.id desc limit 1";
$stmt = $db->prepare($query);
    try{
        $stmt->execute();
        $open_arr=array();
        $open_arr["records"]=array();
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $open_item=array(
                "mondaycheck" => $mondaycheck,
                "tuesdaycheck" => $tuesdaycheck,
                "wednesdaycheck" => $wednesdaycheck,
                "thursdaycheck" => $thursdaycheck,
                "fridaycheck" => $fridaycheck
            );
            // Tager dataet og pusher til det array som blev lavet til at store selve datasættet
            array_push($open_arr["records"], $open_item);
        }
        http_response_code(200);
        $JSON = json_encode($open_arr);
        print_r($JSON);
    } catch(PDOException $e){
        return($e);
    }