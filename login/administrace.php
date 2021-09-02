<?php

  include '../classes/databasef.php';
  include '../functions/pujcenivraceni.php';
  require_once '../vendor/autoload.php';


  $loader = new \Twig\Loader\FilesystemLoader('../views');
  $twig = new \Twig\Environment($loader);
  controlSession();
  if(!isset($_SESSION['isadmin'])){
    header('Location: ../index.php');
    exit();
  }

  $databaseConnect = new Database_Knihovna('localhost','root','','knihovna');
  $DATABASE_HOST = 'localhost';
  $DATABASE_USER = 'root';
  $DATABASE_PASS = '';
  $DATABASE_NAME = 'knihovna';
  $conn = $databaseConnect->connect();



  			// define how many results you want per page
  			// find out the number of results stored in database

  				$sql = "SELECT c.knihaID, vypujckaiD, b.username, datum_pujcky, datum_vraceni, knihaVracena, pocetVypujcenych, poznamkaVypujc FROM vypujcky a INNER JOIN student b ON a.studentID = b.studentID INNER JOIN infokniha c ON a.knihaID = c.knihaID ORDER BY a.knihaVracena ASC, a.datum_pujcky DESC ";

  			$result = $conn->query($sql);
  			$pageArr = $databaseConnect->getPageVar($result, 15); //(sql query, result per page)
  			$page = $pageArr[0]; $number_of_pages = $pageArr[1]; $this_page_first_result = $pageArr[2]; $res_per_page = $pageArr[3];

    				$sql="SELECT c.knihaID, vypujckaiD, b.username, datum_pujcky, datum_vraceni, knihaVracena, pocetVypujcenych, poznamkaVypujc FROM vypujcky a INNER JOIN student b ON a.studentID = b.studentID INNER JOIN infokniha c ON a.knihaID = c.knihaID ORDER BY a.knihaVracena ASC, a.datum_pujcky DESC LIMIT " . $this_page_first_result . ',' .  $res_per_page;


  				$result = $conn->query($sql);

  		if ($result->num_rows > 0) {
  			$i = 0;
  /*
  			$blabla = "<select class='custom-select' name='pocet'>" . "</select>";
  				while($row = $result->fetch_assoc()) {
  					$test = 0;
  					if($row['pocet'] == 0){
  						$test = "<option class='pocetk' value='1'>1</option>";
  					}
  				for($i = 1; $i<=$row['pocet']; $i++){
  					$test .= "<option class='pocetk' value='$i'>$i</option>";
  				}
  				$poznam = $row["poznamka"];
  				$tabulka = "<tr>
  				<td class='id align-middle'>" . $row["knihaID"].
  				"</td>
  				<td class='align-middle'>"	. $row["nazev"].
  				"</td>" . "
  				<td class='align-middle'>" . $row["jmeno"] . " " . $row["prijmeni"] .
  				"</td>". "
  				<td class='align-middle'>" . $row["pocet"] .
  				"</td>"  . "
  				<td class='poznamky align-middle'>" . $poznam .
  				"</td>" . "
  				<td id='pocetk' class='text-center align-middle'>" . "<select name='pocet' >" . $test . "</select></td>" .
  				"
  				<td class='text-center align-middle	'>
  					<button type='button' onclick='myAjax()' class='pujcitButton btn btn-outline-info'><span style='display:none' class='loadingbutton fas fa-spinner fa-spin mr-1'></span>Půjčit</button>
  					<button type='button' class='addField btn btn-outline-success'><span  class='fas fa-plus'></span></button>
  				</td></tr>";
  */
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
  			/*	echo "</table>"; //Close the table in HTML
  				echo "</div>";
  				echo "<nav class='navbar justify-content-center'><ul class='pagination'>";

  */
  	$stranky = "";
  			if(isset($_GET["nazevKnizky"])){

  			 for($page=1;$page<=$number_of_pages;$page++)
       	{
      		$stranky .= '<li class="stranka"><a class="" href="administrace.php?page=' . $page . "&nazevKnizky=" . $_GET["nazevKnizky"] . '">' . $page . '</a> </li>';
  		 	}

  			}
  			else {
  				for($page=1;$page<=$number_of_pages;$page++)
  				{
  					$stranky .= '<li class="stranka"><a class="" href="administrace.php?page=' . $page . '">' . $page . '</a> </li>';
  				}
  			}

      echo $twig->render('admin.html',  [

        'vypispujcek' => $vypispujcek,
        'strankynav' => $stranky,

      ]);
      ?>
