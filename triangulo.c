#include <stdio.h>
#include <stdlib.h>
#include <string.h>
long int ST_2(int n, int k){
     long int a;
     if (n == 1){
         if(k == 1)
             return 1;
         else
             return 0;

     }
    else{
         a = k*ST_2(n-1, k) + ST_2(n-1, k-1);
     }
    
     printf("n= %d\n", n);
     printf("k= %d\n", k);
     printf("resposta= %ld\n", a);
     return a;
}



main(){
	int k=0,n=0;
	printf("digite o valor de n e k\n");
	scanf("%d", &n);
	scanf("%d", &k);
	if(n < 1){
		printf("valor de n tem que ser maior ou igual a 1");
	}
	else if(k < 1 || k > n){
		printf("valor deve ser maior que 1 e menor que n");
	}
	else{
		ST_2(n,k);
	}
}