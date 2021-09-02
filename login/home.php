
<?php
// We need to use sessions, so you should always start sessions using the below code.
require_once '../vendor/autoload.php';


$loader = new \Twig\Loader\FilesystemLoader('../views');
$twig = new \Twig\Environment($loader);

session_start();
include '../classes/databasef.php';
// Hestli uzivatel neni prihlaseny, vrati se na index.php
if (!isset($_SESSION['loggedin'])) {
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
			if(!isset($_GET["nazevKnizky"])) {
				$sql = "SELECT a.knihaID, a.nazev, c.jmeno, c.prijmeni, a.pocet, a.poznamka FROM infokniha a INNER JOIN infokniha_spisovatel b ON a.knihaID = b.book_id INNER JOIN spisovatel c ON b.author_id = c.spisovatelID ORDER BY a.knihaID ASC";

			} else{
			 	$search = $_GET["nazevKnizky"];
			 	$sql = "SELECT a.knihaID, a.nazev, c.jmeno, c.prijmeni, a.pocet, a.poznamka FROM infokniha a INNER JOIN infokniha_spisovatel b ON a.knihaID = b.book_id INNER JOIN spisovatel c ON b.author_id = c.spisovatelID WHERE (a.knihaID LIKE '%$search%' OR a.nazev LIKE '%$search%' OR c.jmeno LIKE '%$search%' OR c.prijmeni LIKE '%$search%')";
			}
			$result = $conn->query($sql);
			$pageArr = $databaseConnect->getPageVar($result, 20); //(sql query, result per page)
			$page = $pageArr[0]; $number_of_pages = $pageArr[1]; $this_page_first_result = $pageArr[2]; $res_per_page = $pageArr[3];

			if(!isset($_GET["nazevKnizky"])) {
				$sql="SELECT a.knihaID, a.nazev, c.jmeno, c.prijmeni, a.pocet, a.poznamka FROM infokniha a INNER JOIN infokniha_spisovatel b ON a.knihaID = b.book_id INNER JOIN spisovatel c ON b.author_id = c.spisovatelID ORDER BY a.knihaID ASC LIMIT " . $this_page_first_result . ',' .  $res_per_page;

			}
			else {
				$sql="SELECT a.knihaID, a.nazev, c.jmeno, c.prijmeni, a.pocet, a.poznamka FROM infokniha a INNER JOIN infokniha_spisovatel b ON a.knihaID = b.book_id INNER JOIN spisovatel c ON b.author_id = c.spisovatelID WHERE (a.knihaID LIKE '%$search%' OR a.nazev LIKE '%$search%' OR c.jmeno LIKE '%$search%' OR c.prijmeni LIKE '%$search%') LIMIT " . $this_page_first_result . ',' . $res_per_page;
			}
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
    		$stranky .= '<li class="stranka"><a class="" href="home.php?page=' . $page . "&nazevKnizky=" . $_GET["nazevKnizky"] . '">' . $page . '</a> </li>';
		 	}

			}
			else {
				for($page=1;$page<=$number_of_pages;$page++)
				{
					$stranky .= '<li class="stranka"><a class="" href="home.php?page=' . $page . '">' . $page . '</a> </li>';
				}
			}



			
$blabla = "";
if(isset($_SESSION['isadmin'])){
$blabla = $_SESSION['isadmin'];

} else {

	$blabla = "";
}


			echo $twig->render('home.html',  [

			  'tabulkaPujceni' => $vypispujcek,
				'strankynav' => $stranky,
				'isadmin' => $blabla,

			]);
			 ?>
