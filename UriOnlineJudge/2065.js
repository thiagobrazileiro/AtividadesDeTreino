var input = require('fs').readFileSync('inn', 'utf8');
var lines = input.split('\n');

var linha = lines.shift();
var numeros = linha.split(' ');


funcionarios = [];
clientes = [];
caixas = [];

linha = lines.shift();
funcionarios = linha.split(' ');


linha = lines.shift();
clientes = linha.split(' ');

for(var i=0; i<numeros[0];i++){
    caixas[i] = 0;
}

var menor = 0;
var menorI = 0;

while(clientes.length > 0){
    menor = Number(caixas[0]);
    menorI = 0; 
    for(var i = 0; i<numeros[0];i++){
        if(caixas[i]< menor){
            menorI = i;
            menor = caixas[i];
        }
    }

    caixas[menorI] += clientes[0]*funcionarios[menorI];
    clientes.shift();
}
var maiorI = 0;
var maior = 0;
for(var i = 0; i<parseInt(numeros[0]);i++){
    if(caixas[i]> maior){
        maiorI = i;
        maior = caixas[i];
    }
}

console.log(caixas[maiorI]);