#include <stdio.h>


int main(){
    int num;

    printf("Enter the number of disks : ");
    scanf("%d", &num);

    towers(num, 1, 3, 2);
    return 0;
}


void towers(int discos, int origem, int destino, int auxiliar){
    if(discos == 1){
        printf("[%d, %d]\n", origem, destino);
        return;
    }

    towers(discos - 1, origem, auxiliar, destino);
    printf("[%d, %d]\n", origem, destino);
    towers(discos - 1, auxiliar, destino, origem);
}
