var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.split('\n');

var raio = Number(lines.shift());
var area = (raio*raio)*3.14159; 
console.log('A=' + area.toFixed(4));
