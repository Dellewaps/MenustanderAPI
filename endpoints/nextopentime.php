<?php
include_once("../database.inc");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Laver en connection til databasen og sætter den til en lokal variabel
$database = new Database();
$db = $database->getConnection();

$query = "SELECT * FROM opentimes WHERE open < NOW() && closed > NOW()";
$query2 = "SELECT * FROM opentimes WHERE open > NOW() ORDER BY Id ASC LIMIT 1;";
$stmt = $db->prepare($query);
$stmt2 = $db->prepare($query2);
    try {
        $stmt->execute();
        $stmt2->execute();
        $open_arr=array();
        $open_arr["records"]=array();
        $num = $stmt->rowCount();
        if ($num > 0) {
            $open_arr["open"] = 1;
        } else {
            $open_arr["open"] = 0;
            while ($row = $stmt2->fetch(PDO::FETCH_ASSOC)) {
                extract($row);
                $open_item=array(
                    "Id" => $Id,
                    "open" => $open,
                    "closed" => $closed,
                );
                
                // Tager dataet og pusher til det array som blev lavet til at store selve datasættet
                array_push($open_arr["records"], $open_item);
            }
            
        }
        
        http_response_code(200);
        $JSON = json_encode($open_arr);
        print_r($JSON);
    } catch (PDOException $e) {
        return($e);
    }
