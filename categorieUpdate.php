<!DOCTYPE html>

<html lang="en" data-theme="night">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5/themes.css" rel="stylesheet" type="text/css" />
    <title>UPDATE Category <?php  echo $_GET['code_cat'] ?> </title>
</head>
<body>
    <div class="flex flex-col items-center justify-center min-h-screen gap-5">
            <div class="bg-base-300 lg:w-1/4 p-10 h-auto rounded-lg shadow-lg"> 
                <div>
                    <h1 class="text-center text-3xl text-primary font-bold">Gestion_Com</h1>
                    <h2 class="text-center mt-2 text-lg text-default">Update category <?php  echo $_GET['code_cat'] ?> </h2>
                </div>
                <div class="mt-10 rounded-lg">
                    <form action="catUpdateTraitement.php" method="POST" class="bg-base-200 rounded-box p-5">
                        <input type="hidden" name="old_code_cat" value="<?php echo $_GET['code_cat'] ?>">
                        <label class="text-base">Code</label><br>
                        <input type="text" name="code_cat" value="<?php  echo $_GET['code_cat'] ?>" class="input mt-2 w-full"><br><br>

                        <label class="mt-2">Label</label><br>
                        <input type="text" name="libelle_cat" value="<?php  echo $_GET['libelle_cat'] ?>" class="input mt-2 w-full"><br>

                        <button type="Submit" class="btn btn-soft btn-success w-full mt-4">Update</button>
                    </form>  
                </div>
            </div>
        </div>
      
    </body>
</html>

