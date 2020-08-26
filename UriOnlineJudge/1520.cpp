#include <iostream>

using namespace std;

int main(){


    int caixas;
    while(cin >> caixas){

        int vetor[101];
        int parafuso;
        int soma = 0;
        int posicaofinal = 0;

        for(int i = 0; i<=100;i++){
        vetor[i] = 0;
        }

        for(int i = 0; i<caixas; i++){
            //Tratando entrada
            int valor1;
            int valor2;
            cin >> valor1;
            cin >> valor2; 

            for(int j =valor1; j<=valor2; j++){
                vetor[j] += 1;
            }

        }

        cin >> parafuso;

        if(vetor[parafuso] != 0){
            for(int i = 1; i<parafuso;i++){
                soma += vetor[i];
            }
        
            posicaofinal = soma + vetor[parafuso] - 1;

            cout << parafuso << " found from " << soma << " to " << posicaofinal << endl;
        }else{
            cout << parafuso << " not found" << endl;
        }

    }

return 0;
}