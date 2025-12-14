<?php
    include 'config.php';

if (isset($_POST['code_cat']) && (!empty($_POST['code_cat']))){
  $new_code = $_POST['code_cat'];
}

if (isset($_POST['libelle_cat']) && (!empty($_POST['libelle_cat']))){
  $new_libelle = $_POST['libelle_cat'];
}

if (isset($_POST['old_code_cat']) && !empty($_POST['old_code_cat'])){
  $old_code = $_POST['old_code_cat'];
}

$con->query('SET FOREIGN_KEY_CHECKS=0');

$sqlQuery1 = "
        UPDATE PRODUIT
        SET Code_cat = :nouveau_code
        WHERE Code_cat = :ancien_code;
    ";
    
    $stmtProduit = $con->prepare($sqlQuery1);
    $stmtProduit->execute([
        ':nouveau_code' => $new_code, 
        ':ancien_code' => $old_code
    ]);

$sqlQuery2 = "UPDATE CATEGORIE
SET Code_cat = :new_code, Libelle_cat = :new_libelle
WHERE Code_cat = :old_code;";

$stmt = $con->prepare($sqlQuery2);
$stmt->execute([
        ':new_code' => $new_code,
        ':new_libelle' => $new_libelle,
        ':old_code' => $old_code
    ]);

$con->query('SET FOREIGN_KEY_CHECKS=1');

header('Location: categorieList.php');
?>