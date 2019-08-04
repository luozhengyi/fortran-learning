! this file demonstrates the interoperability between Fortran and C, especially, Fortran invoke C
module clab
    ! use, intrinsic :: iso_c_binding, only: c_int
    ! use :: iso_c_binding, only: c_int
    use iso_c_binding, only: c_int, c_ptr

    implicit none

    
    interface
        
        subroutine c_fun1() bind(c)
        end subroutine c_fun1

        integer(c_int) function c_fun2() bind(c)
            import c_int
        end function c_fun2

        subroutine c_fun3(arg) bind(c)
            import c_int
            integer(c_int), value :: arg    ! any dummy argument without value attr, is a pointer
        end subroutine

        integer(c_int) function c_fun4(arg) bind(c)
            import c_int
            integer(c_int), value :: arg
        end function

        subroutine c_fun5(arg) bind(c)
            import c_int
            integer(c_int) :: arg
        end subroutine

        integer(c_int) function c_fun6(arg) bind(c)
            import c_int
            integer(c_int) :: arg
        end function

        function c_fun7(arg) bind(c)
            import c_int
            import c_ptr
            integer(c_int) :: arg
            type(c_ptr) :: c_fun7
        end function
    end interface
end module clab

program main
    
    use clab
    use iso_c_binding, only: c_f_pointer
    implicit none
    
    integer :: int_res2
    integer :: int_res4
    integer :: int_res6
    type(c_ptr) :: int_res7
    integer, pointer :: pint_res7
    integer :: int_var3 = 30
    integer :: int_var4 = 40
    integer :: int_var5 = 50
    integer :: int_var6 = 60
    integer :: int_var7 = 70

    ! external function invoking
    call c_fun1()

    int_res2 = c_fun2();    print*, int_res2

    call c_fun3(int_var3);  print*, int_var3

    int_res4 = c_fun4(int_var4); print*, int_res4, int_var4

    call c_fun5(int_var5)

    int_res6 = c_fun6(int_var6); print*, int_res6, int_var6

    int_res7 = c_fun7(int_var7)
    call c_f_pointer(int_res7, pint_res7); print*, pint_res7, int_var7

end program main