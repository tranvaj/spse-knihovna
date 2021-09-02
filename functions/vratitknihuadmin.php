<?php
include '../classes/databasef.php';
include 'pujcenivraceni.php';
session_start();
if (!isset($_SESSION['loggedin'])) {
  header('Location: ../index.php');
  exit();
} else if(!isset($_SESSION['isadmin'])){
  header('Location: ../index.php');
  exit();
}


$databaseConnect = new Database_Knihovna('localhost','root','','knihovna');
if(isset($_POST['poznamka'])){
  $poznamka = $_POST['poznamka'];
} else {
  $poznamka = "";
}
$bookID = $_POST['bookID'];
$pocetpujc = $_POST['pocetpujc'];
$vypujckaID = $_POST['vypujckaID'];
vratitKnizku($bookID, $pocetpujc, $poznamka, $vypujckaID ,$databaseConnect);
header('Location: ../login/administrace.php');

?>
