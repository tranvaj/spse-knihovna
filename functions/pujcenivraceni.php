<?php


function display_data_returnbook($result) {

  if ($result->num_rows > 0) {
    $i = 0;

                  foreach($result as $key => $var){
                    $i++;
                    foreach($var as $k => $v){

                      $vypispujcek[$i][] = $v;

                    }


                  }



      }

  else {
      $vypispujcek = "";
    }
    return $vypispujcek;
}


function vratitKnizku($bookID, $pocetpujc, $poznamka, $vypujckaID, $databaseConnect){
  $pocetkvraceni = $databaseConnect->verifyAvailability2($vypujckaID);

  if( $databaseConnect->verifyAvailability2($vypujckaID) == $pocetpujc && $pocetpujc > 0 && $pocetpujc <= $pocetkvraceni ){
    echo "Vrácení proběhlo úspěšně.";
    $sql = "UPDATE vypujcky SET knihaVracena = '1', datum_vraceni = CURRENT_TIMESTAMP(), pocetVypujcenych = pocetVypujcenych - '$pocetpujc' WHERE vypujckaID = '$vypujckaID'";
    $databaseConnect->connect()->query($sql);
    $sql = "UPDATE infokniha SET pocet = pocet + '$pocetpujc', poznamka = '$poznamka' WHERE knihaID = '$bookID'";
    $databaseConnect->connect()->query($sql);
  } else if( $pocetpujc < $pocetkvraceni ){

    //echo "loll2222"; echo $pocetpujc . " "  .  $pocetkvraceni ;
    echo "Vrácení proběhlo úspěšně.";
    $sql = "UPDATE vypujcky SET knihaVracena = '0', datum_vraceni = CURRENT_TIMESTAMP(), pocetVypujcenych = pocetVypujcenych - '$pocetpujc' WHERE vypujckaID = '$vypujckaID'";
    $databaseConnect->connect()->query($sql);
    $sql = "UPDATE infokniha SET pocet = pocet + '$pocetpujc', poznamka = '$poznamka' WHERE knihaID = '$bookID'";
    $databaseConnect->connect()->query($sql);

  } else {
    echo "Vracení knihy se nezdařilo. Knihy už byly vráceny.";

  }

}
function odepisknihy($knihaid, $pocetknih, $databaseConnect){
  $sql = "UPDATE infokniha SET pocet = pocet - '$pocetknih' WHERE knihaID = '$knihaid'";
  $databaseConnect->connect()->query($sql);
}



function pridatKnizku($a,$b,$c,$d,$idspis,$databaseConnect){
if($c < 0){
  return false;
}

$aa = "";

  $sql = "INSERT INTO infokniha (ISBNID, nazev, pocet, poznamka) VALUES ('$a', '$b', '$c', '$d')";

    $databaseConnect->connect()->query($sql);

    $sql = "SELECT infokniha.knihaID FROM infokniha WHERE nazev = '$b' ORDER BY `infokniha`.`knihaID` ASC";
     $result = $databaseConnect->connect()->query($sql);


     if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {

             $aa = $row["knihaID"];


         }
       }
    $sql = "INSERT INTO infokniha_spisovatel (book_id,author_id) VALUES ('$aa','$idspis')";
  $databaseConnect->connect()->query($sql);


}

  function pujcitKnizku($bookID, $pocetpujc, $poznamka, $databaseConnect){

    $studentID = $databaseConnect->getUserID();

    if($databaseConnect->verifyAvailability($bookID) || $databaseConnect->verifyAvailability($bookID) > 0){
      $pocetDost = $databaseConnect->verifyAvailability($bookID);
      if($pocetDost < $pocetpujc){
          echo "Nastala chyba. (počet dostupných knížek je menší než počet požadovaných)";
      } else{
      $sql = "INSERT INTO vypujcky (studentID,knihaID,datum_pujcky,pocetVypujcenych,poznamkaVypujc) VALUES ('". $studentID ."', '". $bookID ."',  CURRENT_TIMESTAMP, '" . $pocetpujc ."', '" . $poznamka ."' )";
      $sql2 = "UPDATE infokniha SET pocet = pocet - " . $pocetpujc . " WHERE knihaID = ". $bookID .";";
      $databaseConnect->querySend($sql);
      $databaseConnect->querySend($sql2);
      echo "Půjčení proběhlo úspěšně.";
      header("Refresh:0");
    }
    } else {
      echo "Knížka již už nemá žádné dostupné exempláře.";

    }

  }

  function controlSession(){
    session_start();
    if (!isset($_SESSION['loggedin'])) {
      header('Location: ../index.php');
      exit();
    }
  }





?>
