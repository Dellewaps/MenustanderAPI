<?php
include_once ("../database.inc");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Laver en connection til databasen og sætter den til en lokal variabel
$database = new Database();
$db = $database->getConnection();
$weekdays = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday'];

$query = "SELECT * FROM weekmenus ORDER BY id DESC LIMIT 1";
$stmt = $db->prepare($query);
    try{
        $stmt->execute();
        $menu_arr=array();
        $menu_arr["records"]=array();
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $i = 0;
            while($i < count($weekdays)){
                $menu_item=array(
                    $weekdays[$i] => $row[$weekdays[$i].'check']
                );
                array_push($menu_arr["records"], $menu_item);
                $i++;
            }
            
            
        }
        http_response_code(200);
        $JSON = json_encode($menu_arr);
        print_r($JSON);
    } catch(PDOException $e){
        return($e);
    }