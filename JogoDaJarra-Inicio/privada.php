<?php

require_once'jarra.php';

class privada{

  public function __construct(){

  }

  public function __destruct(){

  }

  public function esvaziarJarra($jarra){
    $jarra->litroAtual = 0;
  }

}



?>