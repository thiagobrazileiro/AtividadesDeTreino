<?php 

require_once 'Cachorro.php';

class Invertido extends Cachorro{
  
  public function __construct(){
    echo("gato barriado nasceu\n");
  }
  
  
  public function latir(){
    echo("meaw meaw\n");
  }
  
  
  
}


?>