var input = require('fs').readFileSync('inn', 'utf8');
var lines = input.split('\n');

var nc = Number(lines.shift());

for(var i = 0; i< nc; i++){

    let valores = lines.shift().split(' ');
    var n = parseInt(valores[0]);
    var k = parseInt(valores[1]);
    var tamanho;

    let vetor = [];

    for(var j =1; j<= n; j++){
        vetor.push(j);
    }
    //console.log(vetor);
    var x = -1;

    tamanho = vetor.length;

    for(var j = 0; j< tamanho-1; j++){

        if(vetor.length == n){
            x += k;
        }else{
            x += k -1 ;
        }
        
        while(x > vetor.length-1){
            x = 0 + (x - vetor.length);
        }
        //console.log(x);
        vetor.splice(x ,1);
    }
    console.log(`Case ${i+1}: ${vetor[0]}`);
}
