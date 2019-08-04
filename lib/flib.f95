subroutine f_proc1() bind(c)
    implicit none
    print*, "this is fortran subroutine"
end subroutine

subroutine f_proc2(arg) bind(c)
    use iso_c_binding, only: c_int
    implicit none
    integer(c_int), value :: arg
    print*, "the actual arg: ", arg;
    arg = arg - 1
    print*, "arg - 1 =  ", arg;
end subroutine

subroutine f_proc3(arg) bind(c)
    use iso_c_binding, only: c_int
    implicit none
    integer(c_int) :: arg
    print*, "the actual arg: ", arg;
    arg = arg - 1
    print*, "arg - 1 =  ", arg;
end subroutine

integer(c_int) function f_proc4() bind(c)
    use iso_c_binding, only: c_int
    implicit none
    f_proc4 = 40
end function

function f_proc5(arg) bind(c)
    use iso_c_binding, only: c_ptr, c_associated, c_null_ptr
    implicit none
    ! intger(c_int) :: arg  ! with this expression, arg can not be assigned to type(c_ptr)
    type(c_ptr), value :: arg 
    type(c_ptr) :: f_proc5
    if(c_associated(arg)) then
        f_proc5 = arg
    else
        f_proc5 = c_null_ptr
    end if
end function
