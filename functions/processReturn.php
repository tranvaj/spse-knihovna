<?php
include '../classes/databasef.php';
include 'pujcenivraceni.php';
controlSession();


$databaseConnect = new Database_Knihovna('localhost','root','','knihovna');

if(isset($_POST['id1'])){
$a = $_POST['id1'];

if(isset($_POST['id3'])){
  $poznamka = $_POST['id3'];
} else {
  $poznamka = "";
}
$bookID = $_POST['id1'];
$pocetpujc = $_POST['id2'];
$vypujckaID = $_POST['id4'];

if( $_SESSION['name'] == $_POST['id5'] ){
  //echo "Nice";
  vratitKnizku($bookID, $pocetpujc, $poznamka, $_POST['id4'] ,$databaseConnect);
} else {
  echo "Nastalo k chybě. (Uživatelské jméno se neshoduje s uživatelem.)";
}
}




?>
