<?php
include_once ("../database.inc");
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//Ser efter om den requst der bliver sendt er en POST request
if($_SERVER["REQUEST_METHOD"] == "POST"){
    //Laver en connection til databasen og sætter den til en lokal variabel
    $database = new Database();
    $db = $database->getConnection();

    //Skal ændres til hvor projektet ligger
    $target_dir = "C:\Users\Daniel-lånepc\Documents\Daniel\Projekter\MenuStander\Menu-vue\public\images/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

    // Check if file already exists
    if (file_exists($target_file)) {
        $out['result'] = 0;
        $out['message'] = "File already exists";
        $json = json_encode($out);
        return print_r($json);
    }

    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        
    } else {
        $out['result'] = 0;
        $out['message'] = "File upload failed";
        $json = json_encode($out);
        return print_r($json);
    }

    //Sætter variabler til at være de informationer der kommer fra $post requster
    $name = $_POST['name'];
    $accessories = $_POST['accessories'];
    $price = $_POST['price'];
    $photoname = $_FILES['image']['name'];


    //Laver en query statment med det som skal sættes ind i databasen
    $query = " INSERT INTO dishes (name, accessories, price, photo) VALUES ('$name', '$accessories', '$price', '$photoname') ";
    

    //Forbereder query statment for at checke at den er en valid query
    $stmt = $db->prepare($query);
        // Prøver at execute statement queriet for at se om der bliver meldt fejl af databasen
        try {
            // execute query og return den for at lave check på den
            $stmt->execute();
            $out['result'] = 1;
            $out['message'] = "Retten er nu gemt";
            $json = json_encode($out);
            return print_r($json);
        } catch (PDOException $e) {
            // Returner error koden så der kan laves håndtering på den
            return ($e);
        }
}

