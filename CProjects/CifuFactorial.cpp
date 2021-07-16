#include <stdio.h>
int main()
{
    long n,i,f,e;
    f=i=1;
    e=0;
    printf("Ingrese el numero del que desea encontrar el factorial: ");
    scanf("%ld",&n);
   
    if (n==e){
	    printf("El factorial de %ld es : %ld",n,f);
	    return 0;	
	}
	if (n<e){
	    printf("El factorial de %ld no esta definido",n);
	    return 0;	
	}
    while(i<=n)
    {
        f*=i;
        i++;
    }
    printf("El factorial de %ld es : %ld",n,f);
    return 0;
}
