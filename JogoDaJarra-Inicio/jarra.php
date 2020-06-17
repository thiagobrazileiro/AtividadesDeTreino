<?php

class jarra{

  public $litroMax;
  public $litroAtual;

  public function __construct($litroMax){
    $this->litroMax = $litroMax;
    $this->litroAtual = 0;
  }

  public function __destruct(){

  }

  public function transferirLitro($jarra){
    if($jarra->litroAtual < $jarra->litroMax){
     
      $capacidade = $jarra->litroMax - $jarra->litroAtual;
      if($this->litroAtual > $capacidade){
        $this->litroAtual = $this->litroAtual - $capacidade;
        $jarra->litroAtual = $jarra->litroMax;
      }
      else{
        $jarra->litroAtual = $jarra->litroAtual + $this->litroAtual;
        $this->litroAtual = 0;
      }

    }
  }

}




?>