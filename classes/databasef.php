<?php


class Database_Knihovna{
  private $DATABASE_HOST;
  private $DATABASE_USER;
  private $DATABASE_PASS;
  private $DATABASE_NAME;
function __construct($host, $user, $pass, $name){
  $this->DATABASE_HOST = $host;
  $this->DATABASE_USER = $user;
  $this->DATABASE_PASS = $pass;
  $this->DATABASE_NAME = $name;

}

function connect(){
  $conn = mysqli_connect($this->DATABASE_HOST, $this->DATABASE_USER, $this->DATABASE_PASS, $this->DATABASE_NAME);
  $conn->set_charset('utf8');
  return $conn;

}

function getHost(){
  return $this->DATABASE_HOST;
}
function setHost($a){
  $DATABASE_HOST = $a;
}
function getUser(){
  return $this->DATABASE_USER;
}
function setUser($a){
  $DATABASE_USER = $a;
}
function getPass(){
  return $this->DATABASE_PASS;
}
function setPass($a){
  $DATABASE_PASS = $a;
}

function getUserID(){
  if (!isset($_SESSION['loggedin'])) {
    echo "Přihlašte se prosím. (Session not started/found)";
  }
  $sql = "SELECT student.studentID, student.username FROM `student` WHERE 1";
  $result = $this->querySend($sql);
  $studentID = 0;
  if ($result->num_rows > 0) {
      // output data of each row
      while($row = $result->fetch_assoc()) {
          foreach( $row as $field ){
              if($row["username"] == $_SESSION['name']){
                  $studentID = $row["studentID"];
              }


          }
      }
    } else {
      echo "Nebyly nalezeny žádné shodné výsledky.";
  }
  return $studentID ;

}

function verifyAvailability2($vypujcid){
  $sql = "SELECT vypujcky.pocetVypujcenych FROM `vypujcky` WHERE vypujckaID = '$vypujcid'";
  $result = $this->querySend($sql);
  if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        return $row["pocetVypujcenych"];
      }
    }

}

function verifyAvailability($knihaID){
  $sql = "SELECT infokniha.knihaID, pocet FROM `infokniha` WHERE 1";
  $result = $this->querySend($sql);
  if ($result->num_rows > 0) {
      // output data of each row
      while($row = $result->fetch_assoc()) {
          foreach( $row as $field ){
              if($row["knihaID"] == $knihaID){
                  if($row["pocet"] == 0){
                      return false;

                  }
                  else {
                     return $row["pocet"];
                  }
              }


          }
      }
    } else {
      echo "Databáze je prázdná.";
  }

}

function getPageVar($result, $results_per_page){
  $page = 0;
  $res_per_page = $results_per_page;
  $number_of_results = mysqli_num_rows($result);
  // determine number of total pages available
  $number_of_pages = ceil($number_of_results/$results_per_page);
  // determine which page number visitor is currently on
  if (!isset($_GET['page'])) {
    $page = 1;
  } else {
    $page = $_GET['page'];
  }
  // determine the sql LIMIT starting number for the results on the displaying page
  $this_page_first_result = ($page-1)*$results_per_page;

  $pageArray = array($page, $number_of_pages, $this_page_first_result, $res_per_page);
  return $pageArray;
}


function paginationIntoHtml($searchitem){

}





function querySend($sql){
  $result = $this->connect()->query($sql);
  return $result;
}



}


?>
