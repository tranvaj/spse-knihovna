<?php
/*
--Vypsani zasifrovaneho hesla
$hashed_password = password_hash($_POST['password'], PASSWORD_DEFAULT);
var_dump($hashed_password);
*/

//Inicializace session
session_start();

//Prihlasovaci udaje do databaze
$DATABASE_HOST = 'localhost';
$DATABASE_USER = 'root';
$DATABASE_PASS = '';
$DATABASE_NAME = 'knihovna';
$con = mysqli_connect($DATABASE_HOST, $DATABASE_USER, $DATABASE_PASS, $DATABASE_NAME);
//Pri selhani prihlaseni se vypise chyba
if ( mysqli_connect_errno() ) {
	die ('Selhalo přihlašení MySQL: ' . mysqli_connect_error());
}
if ( !isset($_POST['username'], $_POST['password']) ) {
	die ('Prosím vyplňte pole pro přihlašení.');
}


// Prepare our SQL, preparing the SQL statement will prevent SQL injection.
//Bereme informace z SQL databaze
if ($stmt = $con->prepare('SELECT studentID, heslo FROM student WHERE username = ?')) {
	$stmt->bind_param('s', $_POST['username']);
	$stmt->execute();
	$stmt->store_result();
}

//Porovnavame zadane prihlasovaci udaje s udaji v databazi
if ($stmt->num_rows > 0) {
	$stmt->bind_result($id , $password);
	$stmt->fetch();
	if (password_verify($_POST['password'], $password))
  {
		session_regenerate_id();
		$_SESSION['loggedin'] = TRUE;
		$_SESSION['name'] = $_POST['username'];
		$_SESSION['id'] = $id;
		if($_SESSION['name'] == "sasekp"){
			$_SESSION['isadmin'] = TRUE;
		}


	header('Location: home.php');
	} else {
		$_SESSION['message'] = 'Přihlášení selhalo: Chybné přihlašovací údaje.';
		header('Location: ../index.php');


	}
} else {
	$_SESSION['message'] = 'Přihlášení selhalo: Chybné přihlašovací údaje.';
	header('Location: ../index.php');

}
$stmt->close();
?>
