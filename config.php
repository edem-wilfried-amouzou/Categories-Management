<?php
$host = '127.0.0.1';
$port = 3307;
$db_name = 'Gestion_Com';
$username = 'root';
$password = 'will';

try{
    $con = new PDO("mysql:host=$host;port=$port;dbname=$db_name",$username,$password);
    
} catch (Exception $e){
    die("error: ".$e -> getMessage());
}


?>