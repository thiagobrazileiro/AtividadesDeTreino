var readlineSync = require('readline-sync');



var caixas = readlineSync.question();

while(caixas){

    var vetor = []; 
    var parafuso;
    var soma = 0;
    var posicaofinal =0;

    for(let i = 0; i<=100;i++){
        vetor[i] = 0;
    }

    for(let i = 0; i<caixas; i++){
        //Tratando entrada
        let entrada = readlineSync.question();
        let intervalo = entrada.split(" ");
        var valor1 = Number(intervalo[0]);
        var valor2 = Number(intervalo[1]);

        for(var j =valor1; j<=valor2; j++){
            vetor[j] += 1;
        }

    }

    parafuso = readlineSync.questionInt();
   
    if(vetor[parafuso] != 0){
        for(let i = 1; i<parafuso;i++){
            soma += vetor[i];
        }
    
        posicaofinal = soma + vetor[parafuso] - 1;

        console.log(parafuso,'found from',soma ,'to',posicaofinal);
    }else{
        console.log(parafuso,'not found');
    }
    



    caixas = readlineSync.question();
}