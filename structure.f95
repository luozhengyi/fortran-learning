program prog_name

    use mdl_demo

    ! comment
    implicit none   ! indicate compiler to check all variables type
    
    ! variable declaration and initialization
    integer :: int_var1
    integer :: int_var2 = 2
    integer :: int_var3
    integer :: int_res1
 
    
    ! multiple statements in single line
    int_var1 = 1; int_var3 = int_var1 + int_var2


    ! Error: all declaration and initialization statements must precede first executable statement
    !integer :: int_var0 = 0


    ! Continuation statements
    print *, &
        'int_var1 = ', int_var1, &
        'int_var2 = ', int_var2, &
        'int_var3 = ', int_var3

    ! subroutine invoked
    call setBookID(10)   
    ! function call
    print *, 'Book_id = ', getBookID()


    int_res1 = myfactorial(10)
    print*, "result of (10!) : ",int_res1

end program prog_name ! prog_name is optional

 

