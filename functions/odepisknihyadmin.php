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

$knihaid = $_POST['knihaid'];
$pocetknih = $_POST['pocetknih'];
odepisknihy($knihaid, $pocetknih, $databaseConnect);

header('Location: ../login/administrace.php');
?>
