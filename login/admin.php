<?php

  include '../classes/databasef.php';
  include '../functions/pujcenivraceni.php';
  require_once '../vendor/autoload.php';


  $loader = new \Twig\Loader\FilesystemLoader('../views');
  $twig = new \Twig\Environment($loader);
  session_start();
  if (!isset($_SESSION['loggedin'])) {
    header('Location: ../index.php');
    exit();
  } else if(!isset($_SESSION['isadmin'])){
    header('Location: ../index.php');
    exit();
  }






?>
