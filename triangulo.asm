.data

msg_N: 	 	.string "Digite valor de n: (Maior ou igual a 1):\n"
msg_K: 	 	.string "Digite valor de k: (Maior ou igual a 1 e menor ou igual que N):\n"
msg_Reslt:	.string "Resultado: "
	.text
	

pedeN:		
		addi s0, zero, 0	#s0 vai ser N
		li   a7, 4		#Seta para imprimir String
		la   a0, msg_N		#Carrega mensagem em a0
		ecall			#Imprime
		
		li a7, 5		#Pega o Int digitado
		ecall
		
		blt a0, t0, pedeN  	 #Testa se N < 1
		add s0, zero, a0
pedeK:		
		addi s1, zero, 0	#s1 vai ser K
		li 	a7, 4		#Seta para imprimir String
		la	a0, msg_K	#Carrega mensagem em a0
		ecall			#Imprime
		
		li a7, 5		#Pega o Int digitado 
		ecall
		
		blt a0, t0, pedeK	#Testa se K < 1
		blt s0, a0, pedeK	#Testa se N<K
		add s1, zero, a0

		
main:
		addi s0, s0, 0		#s0 vai ser N
		addi s1, s1, 0		#s1 vai ser K
		addi t0, zero, 1    	#t0 vale 1
		addi s2, s0, 0		#Auxiliar N
		addi s3, s1, 0		#Auxiliar K
		addi s4, zero, 0	#s4 vai ser o retorno
		jal ST_2
		nop 
		ebreak
				
ST_2:	
		beq s2, t0, else	#Testa se N igual de 1
		beq s3, t0, else1	#Testa se K igual de 1
		beq s3, zero, else	#Testa se K igual a 0
		beq s3, s2, else1	#Testa se K igual N
		
	
		sw s2, 0(sp)		#Salva o valor de N na pilha
		addi sp, sp, -4
		sw s3, 0(sp)		#Salva o valor de K na pilha
		addi sp, sp, -4
		sw ra, 0(sp)		#Salva endereço na pilha
		
		addi s2, s2, -1		#N - 1
		jal ST_2
		
		lw s2, 8(sp)		#Lê N
		lw s3, 4(sp)		#Lê K
		lw ra, 0(sp)		#Lê endereço																																				
		
		mul s4, s3, s4		#Multiplica K pelo retorno
		
		addi sp, sp, -4
		sw s4, 0(sp)		#Salva retorno na pilha
		addi sp, sp, -4
		
		addi s2, s2, -1		#N-1	
		addi s3, s3, -1		#K-1
		
		jal ST_2
	
		
		lw a0, 4(sp)		#Lê o retorno multiplicado																																				
		lw ra, 8(sp)
		lw s3, 12(sp)
		lw s2, 16(sp)
		add s4, a0, s4		#Soma retorno multiplicado com o retorno da outra parte
		addi sp, sp, 16
		ret					
		

else:
		beq s2, zero, else1	#Testa se N igual a 0
		addi s4, zero, 0
		ret			#Retorna 0
		
else1:		
		addi s4, zero, 1
		ret			#Retorna 1
		

	
