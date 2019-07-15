program variable
    implicit none

    ! type-specifier, [attr-specifier], [attr-specifier], ... [::] variable_name
    ! variable initialization: initialization expression must be constant expression
    
    integer :: int_var1

    ! variables with same type could be declared and initialized in single line, separated with ','
    complex :: cx_var2 = (2.0, 2.0), cx_var3

    ! variable name is case-insensitive, consists of a-z,A-Z,0-9 and (_), began with a letter
    integer:: I_AM_THE_variable_TO_TEST_LENGTH_35 = 35

    ! The separator :: could be omitted in variable declaration, but not in initialization
    integer int_var4         ! don't recommend
    ! integer int_var4 = 4   ! Error

    
    
    integer :: int_var5 = 50
    ! integer :: int_var6= int_var5    ! Error: "int_var5" doesn't satisfy constant expression


    print*, "I_am_the_variable_to_test_length_35", I_am_the_variable_to_test_length_35, &
            "complex variable", cx_var2

    ! the variables having implicit type(beginning with 'i/n/j/k/l/m/n), can occure after executable statement
    ! int_var5 = 50   ! true: 'implicit no is not declared'; false: otherwise


    ! print 
    print*, int_var4
    ! print*, int_var5

end program variable
