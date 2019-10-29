	.data

msg_N: 	 	.string "Digite valor de n: (Maior ou igual a 1)\n"
msg_K: 	 	.string "Digite valor de k: (Maior ou igual a 1 e menor ou igual que N)\n"

	.text

		addi s0, zero, 0	#s0 vai ser N
		addi s1, zero, 0	#s1 vai ser K
		addi t0, zero, 1    #t0 vale 1
pedeN:	la	a0, msg_N		#Carrega mensagem em a0
		li 	a7, 4			#Seta para imprimir String
		ecall				#Imprime
		li s0, 5			#Pega o Int digitado
		blt s0, t0, pedeN   #Testa se N < 1
pedeK:	la	a0, msg_K		#Carrega mensagem em a0
		li 	a7, 4			#Seta para imprimir String
		ecall				#Imprime
		li s1, 5			#Pega o Int digitado 
		blt s1, t0, pedeK	#Testa se K < 1
		bge s1, s0, pedeK	#Testa se K>=N


	
