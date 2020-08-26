var input = require('fs').readFileSync('inn', 'utf8');
var lines = input.split('\n');


var numero = lines.shift();
var vetor = ['F','A','C','E'];
var diferente = false;
var contador = 0;
for(var i =0; i<numero; i++){
    diferente = false;

    var linha = lines.shift();
    var temporario = linha.split(' ');
    var ajuda = 3;
    for(var j = vetor.length -4; j<vetor.length; j++){
        if(temporario[ajuda][0] != vetor[j]){
            diferente = true;
        }
        ajuda -= 1;
    }
    
    if(!diferente){
        contador += 1;
        if(vetor.length > 4){
            for(var j = 0; j<4; j++){
                vetor.pop();
            }
        }
    }else{
        for(var j = 0; j<4; j++){
            vetor.push(temporario[j][0]);
        }
    }  
       

    
}
console.log(contador);