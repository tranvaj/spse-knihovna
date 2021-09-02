<?php

  include '../classes/databasef.php';
  include '../functions/pujcenivraceni.php';
  require_once '../vendor/autoload.php';


  $loader = new \Twig\Loader\FilesystemLoader('../views');
  $twig = new \Twig\Environment($loader);
  controlSession();
  $databaseConnect = new Database_Knihovna('localhost','root','','knihovna');
  $conn = $databaseConnect->connect();




          //do promenne se ulozi id prihlaseneho uzivatele
          $studentID = $databaseConnect->getUserID();

          //vypis vypujcek
          $sql = "SELECT a.vypujckaID, c.knihaID ,b.username, c.nazev, a.datum_pujcky, a.datum_vraceni, a.pocetVypujcenych, a.knihaVracena, a.poznamkaVypujc FROM vypujcky a INNER JOIN student b ON a.studentID = b.studentID INNER JOIN infokniha c ON a.knihaID = c.knihaID WHERE a.studentID = '" . $studentID . "' ORDER BY a.knihaVracena ASC, a.datum_pujcky DESC";
          $result = $conn->query($sql);
          $pageArr = $databaseConnect->getPageVar($result, 20);
          $page = $pageArr[0];
          $number_of_pages = $pageArr[1];
          $this_page_first_result = $pageArr[2];
          $res_per_page = $pageArr[3];


          $sql = "SELECT a.vypujckaID, c.knihaID,b.username, c.nazev, a.datum_pujcky, a.datum_vraceni, a.pocetVypujcenych, a.knihaVracena, a.poznamkaVypujc FROM vypujcky a INNER JOIN student b ON a.studentID = b.studentID INNER JOIN infokniha c ON a.knihaID = c.knihaID WHERE a.studentID = '" . $studentID . "' ORDER BY a.knihaVracena ASC, a.datum_pujcky DESC LIMIT ". $this_page_first_result . ',' .  $res_per_page;

          //ulozeni dotazu do promenne
          $result = $conn->query($sql);



                $vypispujcek = display_data_returnbook($result);
                $stranky = "";
      for($page = 1;$page<=$number_of_pages;$page++)
      {
        	$stranky .= '<li class="stranky"><a class="page-link" href="profile.php?page=' . $page . '">' . $page . '</a> </li>';
      }

      $blabla = "";
      if(isset($_SESSION['isadmin'])){
      $blabla = $_SESSION['isadmin'];

      } else {

      	$blabla = "";
      }

      echo $twig->render('profile.html',  [

        'tabulkaPujceni' => $vypispujcek,
        'strankynav' => $stranky,
        		'isadmin' => $blabla,
      ]);
      ?>
