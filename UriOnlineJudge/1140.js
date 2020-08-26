var input = require('fs').readFileSync('inn', 'utf8');
var lines = input.split('\n');

var linha = lines.shift(); 


while(linha != '*'){

    linha = linha.toLowerCase();
    var diferente = false;
    var palavras = linha.split(' ');
    var letra = palavras[0][0];

    for(var i=0; i<palavras.length;i++){
        if(palavras[i][0] != letra){
            diferente = true;
        }
    }

    if(!diferente){
        console.log('Y');
    }else{
        console.log('N');
    }

    linha = lines.shift()
}