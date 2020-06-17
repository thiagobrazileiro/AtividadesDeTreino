<?php

require_once'jarra.php';

class torneira{

  public function __construct(){

  }

  public function __destruct(){

  }

  public function encherJarra($jarra){
    $jarra->litroAtual = $jarra->litroMax;
  }

}



?>