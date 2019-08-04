! this file demonstates the characteristics of procedure in Fortran


!
! all initialized variables are stored in data segment in fortran procedure
! similar to static variable in C language
!
subroutine sub1()
    implicit none
    integer :: int_var1 = 10
    print*, "sbu1_int_var1: ", int_var1
    int_var1 = int_var1 + 10
end subroutine sub1

!
! procedure pass argument by variable reference in fortran
!
function fun1(arg)
    implicit none
    integer :: fun1  ! can't be initialized
    integer :: arg
    arg = arg + 100
    print*, "arg: ", arg
    fun1 = fun1 + 1
end function fun1

subroutine sub2(pint_arg)
    implicit none
    integer, intent(out), pointer :: pint_arg
    integer, target :: int_var1 = 10
    ! integer, target :: int_var1   ! uninitialized variable will be destroyed when calling finished.
    ! int_var1 = 10
    pint_arg => int_var1
    print*, pint_arg
end subroutine sub2

program main
    implicit none

    integer :: int_res1
    integer, pointer :: pint_var1
    integer :: int_var2

    interface
        function fun1(arg)  ! explicit interface for external function is necessary, but not external subroutine
            implicit none
            integer :: arg
            integer :: fun1  
        end function fun1

        subroutine sub2(pint_arg)    ! if the external subroutine has pointer argument, the explicit interface is necessary
            implicit none
            integer, intent(out), pointer :: pint_arg
            integer, target :: int_var1
        end subroutine sub2
    end interface

    int_var2 = 10

    ! call external procedure: the local variables in procedure acts like static variables in C
    call sub1()
    call sub1()


    int_res1 = fun1(int_var2)
    print*, "int_res = ", int_res1, int_var2


    call sub2(pint_var1)
    print*, pint_var1


end program main