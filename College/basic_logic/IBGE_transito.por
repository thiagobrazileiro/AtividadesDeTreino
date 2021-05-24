programa {
	funcao inicio() {
		escreva("IBGE\n")
		cadeia maior_cidade = "AAA"
		cadeia menor_cidade = "AAA"
		cadeia codigo_cidade
		inteiro menor_numero_acidentes = 999999999
		inteiro maior_numero_acidentes = -1
		inteiro veiculos, acidentes
		inteiro quantidade_pequenas = 0
		inteiro quantidade_total = 0
		inteiro media_veiculos_total = 0
		inteiro media_pequenas = 0
		caracter resposta = 'S'
		faca{
		    escreva("Digite o codigo da cidade: ")
		    leia(codigo_cidade)
		    escreva("Agora digite o numero de veiculos de passeio desta cidade: ")
		    leia(veiculos)
		    escreva("Agora digite o numero de acidentes de trânsito com vítimas desta cidade: ")
		    leia(acidentes)
		    se (veiculos < 2000){
		        quantidade_pequenas = quantidade_pequenas + 1
		        media_pequenas = media_pequenas + acidentes
		    }
		    quantidade_total = quantidade_total + 1
		    media_veiculos_total = media_veiculos_total + veiculos
		    
		    se (acidentes < menor_numero_acidentes){
		        menor_numero_acidentes = acidentes
		        menor_cidade = codigo_cidade
		    }
		    
		    se (acidentes > maior_numero_acidentes){
		        maior_numero_acidentes = acidentes
		        maior_cidade = codigo_cidade
		    }
		    
		    escreva("Deseja adicionar dados de uma nova cidade ou deseja ver o resultado da pesquisa? Digite S para nova cidade e N para resultado da pesquisa ")
		    leia(resposta)
		}enquanto(resposta != 'N')
		
		limpa()
		
		media_pequenas = media_pequenas / quantidade_pequenas
		media_veiculos_total = media_veiculos_total / quantidade_total
		
		escreva("Menor indice de acidentes: ", menor_numero_acidentes, " Codigo da cidade: ", menor_cidade, "\n")
		escreva("Maior indice de acidentes: ", maior_numero_acidentes, " Codigo da cidade: ", maior_cidade, "\n")
		escreva("Media de veiculos por cidade: ", media_veiculos_total, "\n")
		escreva("Media de acidentes de trânsito nas cidades com menos de 2000 veículos de passeio: ", media_pequenas, "\n")
		
	}
}
