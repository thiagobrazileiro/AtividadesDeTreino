function combina(x,y){
    switch(x){
        case 'B':
            if(y == 'S'){
                return true;
            }else{
                return false;
            }
            break;
        case 'S':
            if(y == 'B'){
                return true;
            }else{
                return false;
            }
            break;
        case 'C':
            if(y == 'F'){
                return true;
            }else{
                return false;
            }
            break;
        case 'F':
            if(y == 'C'){
                return true;
            }else{
                return false;
            }
            break;
        default:
            break;                   
    }
}

function contador(vet){
    var cont = 0;
    var direita = vet.length -1;
    var esquerda = direita -1;
    while(esquerda >= 0){
        if(combina(vet[direita],vet[esquerda])){
            vet.splice(esquerda,2);
            direita = vet.length -1;
            esquerda = vet.length -2;
            cont +=1;
        }else{
            esquerda -= 1;
            direita -= 1;
        }
    }
    return cont;

}

var input = require('fs').readFileSync('inn', 'utf8');
var lines = input.split('\n');

var linha; 


while(linha = lines.shift()){

    let vetor = linha.split('');
    
    console.log(contador(vetor));


}