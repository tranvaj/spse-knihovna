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


$a = $_POST['ISBNID'];
$b = $_POST['nazev'];
$c = $_POST['pocet'];
$d = $_POST['poznamka'];



pridatKnizku($a,$b,$c,$d,$_POST["idspis"],$databaseConnect);

header('Location: ../login/administrace.php');

 ?>
