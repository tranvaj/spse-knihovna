<?php
require_once 'vendor/autoload.php';

$loader = new \Twig\Loader\FilesystemLoader('views');
$twig = new \Twig\Environment($loader);

session_start();
if(isset($_SESSION['loggedin'])){
        header('Location: login/home.php');
      }
//do $zprava se ulozi zprava, ktera vypise chybne prihlaseni
      if (isset($_SESSION['message'])) {
            $zprava = $_SESSION['message'];
            unset($_SESSION['message']);
          } else {
            $zprava = "";
          }



echo $twig->render('index.html',  [

  'chybaPrihlaseni' => $zprava,

]);



/*
<!DOCTYPE html>
<html lang="cs">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php session_start();
          if(isset($_SESSION['loggedin'])){
            header('Location: login/home.php');
          }
    ?>
    <title>Knihovna</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/login.css">
  </head>
  <body>

    <div class="front">

      <div class="login">


			     <h1>VOŠ a SPŠE Knihovna</h1>

			     <form action="login/authenticate.php" method="post">

             <input type="text" name="username" placeholder="Přihlašovací jméno" id="username" required><br>
					   <input type="password" name="password" placeholder="Heslo" id="password" required>
             <?php
             //vypisuje chybu pri spatnem zadani hesla nebo jmena
             if (isset($_SESSION['message'])) {
                 echo $_SESSION['message'];
                 unset($_SESSION['message']);
               }
               ?>
            	 <input type="submit" value="Přihlasit">
			     </form>

		   </div>
    </div>

  </body>
</html>
*/
?>
