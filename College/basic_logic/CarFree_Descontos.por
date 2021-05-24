programa {
	funcao inicio() {
		escreva("CarFree\n")
		real valor
		real desconto = 0
		inteiro ano
		caracter resposta = 'S'
		faca{
		    escreva("Digite o valor do carro que deseja saber o desconto: ")
		    leia(valor)
		    escreva("Agora digite o ano de fabricacao do carro: ")
		    leia(ano)
		    se (ano > 2010){
		        desconto = valor*0.07
		        escreva("O desconto sera de: ", desconto, " e o valor total sera: ", valor-desconto,"\n")
		    }senao{
		        desconto = valor*0.12
		        escreva("O desconto sera de: ", desconto, " e o valor total sera: ", valor-desconto,"\n")
		    }
		    escreva("Deseja calcular o desconto para outro carro? Digite N para sair ou qualquer letra para continuar")
		    leia(resposta)
		}enquanto(resposta != 'N')
	}
}
