<?php
include '../classes/databasef.php';
include 'pujcenivraceni.php';
controlSession();


$databaseConnect = new Database_Knihovna('localhost','root','','knihovna');

if(isset($_POST['id1'])){
$a = $_POST['id1'];

/*echo $a;
echo $_POST['id2'];
echo $_POST['id3'];
*/
if(isset($_POST['id3'])){
  $poznamka = $_POST['id3'];
} else {
  $poznamka = "";
}
$bookID = $_POST['id1'];
$pocetpujc = $_POST['id2'];
pujcitKnizku($bookID, $pocetpujc, $poznamka, $databaseConnect);
}



?>
