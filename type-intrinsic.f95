! this file demonstrates the intrinsic types in Fortran

program type_intrinsic
    implicit none

    ! Fortran provide five intrinsic data types.
    ! kind-selector sepcify bytewide for integer,real,complex,logical
    ! note: the bytewide specified by kind-selector should be support by processor
    ! Fortran does't provide "unsigned" type parameter


    call test_int()
    call test_re()
    call test_cx()
    call test_b()
    call test_ch()


    ! use kind() function to query the default bytewide of five intrinsic variable type
    print *, kind(0)            ! 4
    print *, kind(0.0)          ! 4
    print *, kind(0.0D0)        ! 8; double precision real
    print *, kind(.false.)      ! 4
    print *, kind('A')          ! 4



end program type_intrinsic




subroutine test_int()
    implicit none

    integer :: int_var1 = 65537_4                   ! bytewide = 4; 65537 = 0x10001; "_1" indicate the byte width of 65537;
    integer(kind = 2) :: int_var2 = -B'00001100'    ! = -12; ' ' can be replaced by " "; no blakspaces between B and '; 
    integer(kind = 4) :: int_var3 = O"15"           ! = 13
    ! integer(kind = 6) :: int_var3 = 13            ! Erro: integer bytewide should be pow(2,N)
    integer(kind = 8) :: int_var4 = Z'0E'           ! = 14

    ! integer
    print *, huge(int_var1)     ! huge() function return max value of variable could hold
    print *, int_var2/int_var3  ! = 0; int division
    print *, int_var3
    print *, int_var4
end subroutine test_int



subroutine test_re()
    implicit none

    real :: re_var1 = 2.1 
    ! real(kind = 6) :: re_var2 = 2.2   ! Error: real bytewide could be only 4/8  
    real(kind = 8) :: re_var2 = 2.2
    double precision :: dp_var1 = -2.3   ! double precison = real(kind =8)

    ! real
    print *, huge(re_var1)
    print *, re_var2/dp_var1    ! != 0; floating point division
end subroutine test_re




subroutine test_cx()
    implicit none

    complex :: cx_var1 = (3.1, 3.1)
    ! complex(kind = 6) :: cx_var2 = (3.2, 3.2) ! Error: complex bytewide could be only 4/8
    complex(kind = 8) :: cx_var2 = (3.2, 3.2)

    ! complex
    print*, cx_var1;   
end subroutine test_cx



subroutine test_b()
    implicit none

    logical :: b_var1 = .true.  ! There are only two logical values: .true. and .false.
    logical(kind =2) :: b_var2 = .false.

    ! logical
    print*, b_var1;  
end subroutine test_b


subroutine test_ch()
    implicit none

    character(len = 50) :: ch_var1 = 'hello, the world' ! a string with 10 charaters capacity
    ! character
    ch_var1 = "This is a demo to test intrinsic types"
    print*, ch_var1 
end subroutine test_ch