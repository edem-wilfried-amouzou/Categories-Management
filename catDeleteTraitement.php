<?php
    include 'config.php';

if (isset($_POST['code_cat']) && (!empty($_POST['code_cat']))){
  $code = $_POST['code_cat'];
}


$con->query('SET FOREIGN_KEY_CHECKS=0');

$sqlQuery1 = "DELETE FROM PRODUIT WHERE Code_cat = :code;";
    
    $stmtProduit = $con->prepare($sqlQuery1);
    $stmtProduit->execute([
        ':code' => $code, 
    ]);

$sqlQuery2 = "DELETE FROM CATEGORIE WHERE Code_cat = :code;";

$stmt = $con->prepare($sqlQuery2);
$stmt->execute([
        ':code' => $code,
    ]);

$con->query('SET FOREIGN_KEY_CHECKS=1');

header('Location: categorieList.php');
?>