<?php

require_once'torneira.php';
require_once'privada.php';
require_once'jarra.php';


class fase{
  public $litroEsperado;
  public $level;
  public $jarra1;
  public $jarra2;
  public $vitoria;

  public function __construct($level, $jarra1, $jarra2, $litroEsperado){
    $this->level = $level;
    $this->jarra1 = $jarra1;
    $this->jarra2 = $jarra2;
    $this->litroEsperado = $litroEsperado;
    $this->vitoria = 0;
    echo("Fase iniciada\n");
  }

  public function __destruct(){
    echo("A fase ".$this->level." acabou\n");
  }

 /* private function inicializaTudo(){
    $jarraUm = new jarra($jarra1);
    $jarraDois = new jarra($jarra2);
    $torneira = new torneira();
    $privada = new privada();
  }*/

  public function checaVitoria($jarra1, $jarra2){
    if (($jarra1 == $this->litroEsperado) || ($jarra2 == $this->litroEsperado)){
      $this->vitoria = 1;
      echo("Conseguiu completar a fase\n");
    }  
  }

}


?>