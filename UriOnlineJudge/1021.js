// As notas consideradas são de 100, 50, 20, 10, 5, 2. 
// As moedas
// possíveis são de 1, 0.50, 0.25, 0.10, 0.05 e 0.01.
/*
NOTAS:
5 nota(s) de R$ 100.00
1 nota(s) de R$ 50.00
1 nota(s) de R$ 20.00
0 nota(s) de R$ 10.00
1 nota(s) de R$ 5.00
0 nota(s) de R$ 2.00
MOEDAS:
1 moeda(s) de R$ 1.00
1 moeda(s) de R$ 0.50
0 moeda(s) de R$ 0.25
2 moeda(s) de R$ 0.10
0 moeda(s) de R$ 0.05
3 moeda(s) de R$ 0.01
*/
Math.fmod = function (a,b) { return Number((a - (Math.floor(a / b) * b)).toPrecision(8)); };

var x = 576.73;
var aux;
var aux2;

console.log('NOTAS:');

x = x.toFixed(2);


aux = parseInt(x/100);
x = Math.fmod(x,100);
console.log(aux + ' nota(s) de R$ 100.00');


aux = parseInt(x/50);
x = Math.fmod(x,50);
console.log(aux + ' nota(s) de R$ 50.00');


aux = parseInt(x/20);
x = Math.fmod(x,20);
console.log(aux + ' nota(s) de R$ 20.00');


aux = parseInt(x/10);
x = Math.fmod(x,10);
console.log(aux + ' nota(s) de R$ 10.00');

aux = parseInt(x/5);
x = Math.fmod(x,5);
console.log(aux + ' nota(s) de R$ 5.00');


aux = parseInt(x/2);
x = Math.fmod(x,2);
console.log(aux + ' nota(s) de R$ 2.00');

console.log('MOEDAS:');

aux = parseInt(x);
x = Math.fmod(x,1);;
console.log(aux + ' moeda(s) de R$ 1.00');


aux = parseInt(x/0.5);
x = Math.fmod(x,0.5);
console.log(aux + ' moeda(s) de R$ 0.50');


aux = parseInt(x/0.25);
x = Math.fmod(x,0.25);
console.log(aux + ' moeda(s) de R$ 0.25');


aux = parseInt(x/0.10);
x = Math.fmod(x,0.10);
console.log(aux + ' moeda(s) de R$ 0.10');

aux = parseInt(x/0.05);
x = Math.fmod(x,0.05);
console.log(aux + ' moeda(s) de R$ 0.05');


aux = parseInt(x/0.01);
x = Math.fmod(x,0.01);


console.log(aux + ' moeda(s) de R$ 0.01');
