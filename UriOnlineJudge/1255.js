var input = require('fs').readFileSync('inn', 'utf8');
var lines = input.split('\n');



var quantidade = Number(lines.shift());

for(var i = 0; i<quantidade; i++){
    var maior = 0;

    var linha = lines.shift();
    linha = linha.toLowerCase();
    
    var vetor = [];
    for(var j = 0; j<26; j++){
        vetor[j] = 0;
    }

    for(var j = 0; j<linha.length; j++){
        if(linha[j] >= 'a' && linha[j] <= 'z'){
            var casa = linha[j].charCodeAt() - 97;
            vetor[casa] += 1;
            if(vetor[casa] > maior){
                maior = vetor[casa];
            }
        }else{
        }

    }


    var saida = '';
    for(var j = 0; j<26; j++){
        if(vetor[j] == maior){
            saida += String.fromCharCode(j+97);
        }
    }

    console.log(saida);

}