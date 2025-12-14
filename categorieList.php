<?php
    include 'config.php';
    $sqlQuery = 'SELECT * From CATEGORIE;';
    $stmt = $con->query($sqlQuery);
    $data = $stmt-> fetchAll();
?>
<!DOCTYPE html>
<html lang="en" data-theme="night">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion_Com</title>
    <!-- <link rel="stylesheet" href="categorieList.css"> -->
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5/themes.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="flex flex-col items-center justify-center min-h-screen gap-5">
        <div class="bg-base-300 w-3/4 p-10 h-auto rounded-lg shadow-lg"> 
            <div>
                <h1 class="text-center text-3xl text-primary font-bold">Gestion_Com</h1>
                <h2 class="text-center mt-2 text-lg text-default">List of categories</h2>
            </div>
            <div class="mt-10 rounded-lg">
                <table class="table border rounded-b-none border-spacing-1 table-zebra w-full text-center text-lg">
                    <thead>
                        <tr>
                            <th class="text-primary text-xl">CODE</th>
                            <th class="text-primary text-xl" >LABEL</th>
                            <th class="text-primary text-xl" >UPDATE</th>
                            <th class="text-primary text-xl" >DELETE</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            foreach($data as $row){
                                echo '<tr >';
                                echo '<td>'.$row['Code_cat'].'</td>';
                                echo '<td>'.$row['Libelle_cat'].'</td>';
                                echo '<td><a href="categorieUpdate.php?code_cat='.$row['Code_cat'].'&libelle_cat='.$row['Libelle_cat'].'" class="btn btn-soft btn-secondary">Update</a></td>';
                                echo '<td><a href="categorieDelete.php?code_cat='.$row['Code_cat'].'&libelle_cat='.$row['Libelle_cat'].'" class="btn btn-soft btn-error">Delete</a></td>';
                                echo '</tr>';
                            }
                        ?>
                    </tbody>
                </table>
                <a href="categorieAdd.php" class="btn btn-soft btn-success w-full rounded-lg rounded-t-none mt-2">Add new category</a>
        </div>
    </div>
</body>
</html>