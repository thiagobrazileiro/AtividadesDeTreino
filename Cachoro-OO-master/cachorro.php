<?php
class cachorro{
    public $raca;

    public function __construct($raca){
        $this->raca = $raca;
        echo("Cachorro nasceu");
    }

    public function latir(){
        echo 'AUAU';
    }
}

$bob = new cachorro("Pudle");

?>