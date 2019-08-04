#ifndef __CLAB_H__
#define __CLAB_H__

/*
 * no return; no parameter; 
 * corresponding interface in fortran: subroutine ;
 */
extern void c_fun1(void);   // print "hello"

/*
 * return int; no parameter; 
 * corresponding interface in fortran: function ;
 */
extern int c_fun2(void);    // return 1

/*
 * no return int; int type parameter; 
 * corresponding interface in fortran: subroutine ;
 * note:
 * C-language function pass parameter by value copy
 * Fortran subroutine pass parameter by variable reference
 */
extern void c_fun3(int);


extern int c_fun4(int);


extern void c_fun5(int*);


extern int c_fun6(int*);


extern int* c_fun7(int*);




#endif  //__CLAB_H__
