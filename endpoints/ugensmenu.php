<?php
include_once ("../database.inc");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Laver en connection til databasen og sætter den til en lokal variabel
$database = new Database();
$db = $database->getConnection();

// Laver en query statment med det som skal hentes fra databasen
$query = "CALL sp_weekdays()";
$stmt = $db->prepare($query);
    try{
        $stmt->execute();
        $menu_arr=array();
        $menu_arr["records"]=array();
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $menu_item=array(
                "ID" => $id,
                "name" => $name,
                "accessories" => $accessories,
                "price" => $price,
                "photo" => $photo,
            );
            // Tager dataet og pusher til det array som blev lavet til at store selve datasættet
            array_push($menu_arr["records"], $menu_item);
        }
        http_response_code(200);
        $JSON = json_encode($menu_arr);
        print_r($JSON);
    } catch(PDOException $e){
        return($e);
    }
?>