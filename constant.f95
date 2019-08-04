program constant
    implicit none


    ! named constant: has a name and PARAMETER attr; can be any of intrinsic type;
    ! literal constant: without a name

    real,parameter :: PI = 3.141592654  ! PI: name constant; 3.141592654: literal constant;
    ! integer, parameter :: MAX_INT16 = 65536
    integer :: MAX_INT16
    character(len = 10), parameter :: ch_out = "hello"
    parameter(MAX_INT16 = 65536)

    

    print*, PI
    print*, MAX_INT16
    print*, ch_out

end program constant
