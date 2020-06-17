<?php

require_once'torneira.php';
require_once'privada.php';
require_once'fase.php';
require_once'jarra.php';


echo("Qual level você deseja jogar? (1, 2  ou 3) \n");
$level = readline();
$fase = new fase($level,5,3,4);


$jarraUm = new jarra(5);
$jarraDois = new jarra(3);
$torneira = new torneira();
$privada = new privada();

while($fase->vitoria != 1){
  echo("Jarra1 tem ".$jarraUm->litroAtual." Litros            Jarra2 tem ".$jarraDois->litroAtual." Litros\n");
  echo("\n");
  echo("Digite o numero do menu que você deseja: \n");
  echo("1 - Encher Jarra1\n");
  echo("2 - Encher Jarra2\n");
  echo("3 - Esvaziar Jarra1\n");
  echo("4 - Esvaziar Jarra2\n");
  echo("5 - Transferir agua de Jarra1 para Jarra2\n");
  echo("6 - Transferir agua de Jarra2 para Jarra1\n");
  $escolha = readline();

  if($escolha == 1){
    $torneira->encherJarra($jarraUm);
    $fase->checaVitoria($jarraUm->litroAtual,$jarraDois->litroAtual);
  }
  if($escolha == 2){
    $torneira->encherJarra($jarraDois);
    $fase->checaVitoria($jarraUm->litroAtual,$jarraDois->litroAtual);
  }
  if($escolha == 3){
    $privada->esvaziarJarra($jarraUm);
    $fase->checaVitoria($jarraUm->litroAtual,$jarraDois->litroAtual);
  }
  if($escolha == 4){
    $privada->esvaziarJarra($jarraDois);
    $fase->checaVitoria($jarraUm->litroAtual,$jarraDois->litroAtual);
  }
  if($escolha == 5){
    $jarraUm->transferirLitro($jarraDois);
    $fase->checaVitoria($jarraUm->litroAtual,$jarraDois->litroAtual);
  }
  if($escolha == 6){
    $jarraDois->transferirLitro($jarraUm);
    $fase->checaVitoria($jarraUm->litroAtual,$jarraDois->litroAtual);
  }

  echo("\n\n");

}


//echo("AAAA\n");

?>