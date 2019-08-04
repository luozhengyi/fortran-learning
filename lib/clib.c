#include <stdio.h>
#include "clib.h"



void c_fun1(void)
{
	printf("C function\n");
}

int c_fun2(void)
{
	return 1;
}

void c_fun3(int arg)
{
	printf("actual argument is arg = %d\n", arg);
	--arg;
	printf("in c function: arg -1 = %d\n", arg);
}

int c_fun4(int arg)
{
	{
	printf("actual argument is arg = %d\n", arg);
	--arg;
	printf("in c function: arg -1 = %d\n", arg);
	return 1;
}
}

void c_fun5(int *parg)
{
	if(parg != 0)
	{
		printf("actual argument is arg = %d\n", *parg);
		--*parg;
		printf("in c function: arg -1 = %d\n", *parg);
	}
}


int c_fun6(int *parg)
{
	if(parg != 0)
	{
		printf("actual argument is arg = %d\n", *parg);
		--*parg;
		printf("in c function: arg -1 = %d\n", *parg);
	}
	return 1;
}

int* c_fun7(int* parg)
{
	if(parg != 0)
	{
		printf("actual argument is arg = %d\n", *parg);
		--*parg;
		return parg;
	}else
		return 0;
}