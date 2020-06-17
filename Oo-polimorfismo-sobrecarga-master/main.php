<?php
require_once 'Cachorro.php';
require_once 'Invertido.php';

$dog = new Cachorro("branco","grande");

$dog->latir("aaa");

$gato = new Invertido();

$gato->latir();

?>