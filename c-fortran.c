#include <stdio.h>
#include "./lib/flib.h"


int main(int agrc, char* argv[])
{
    int iVar2 = 20;
    int iVar3 = 30;
    int iRes4 = 0;
    int iVar5 = 50;
    int *pRes5 = NULL;

    f_proc1();

    f_proc2(iVar2);
    printf("iVar2 = %d\n", iVar2);

    f_proc3(&iVar3);
    printf("iVar3 = %d\n", iVar3);

    iRes4 = f_proc4();
    printf("iRes = %d\n", iRes4);

    pRes5 = f_proc5(&iVar5);
    if(pRes5 != NULL)
    {
        printf("*pRes5 = %d\n", *pRes5);
    }
       

    return 0;
}
