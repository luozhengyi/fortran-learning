! this file demonstrates the derived types in Fortran


program type_derived

    implicit none
    
    ! deriverd type is a type that is no defined by the language


    ! struct: a scalar object
    call test_struct()

    


    
  
end program type_derived



subroutine test_struct()
    implicit none

    ! type declaration; :: is optional
    type :: Books 
        character(len = 50) :: title
        integer :: book_id
    end type Books


    ! declaring type variables
    type(Books) :: book1 = Books("fortran Programming",100) ! constructor to provide values;
    type(Books) :: book2 



    ! book1%title = "C Programming"
    ! book1%book_id =  6495407

    book2 = book1
    book2 = Books("call Bob", 200)
    book2%title = "call Allice"
    book2%book_id = 300

    ! display book info
    Print *, book1%title 
    Print *, book1%book_id  

    Print *, book2%title  
    Print *, book2%book_id  

    
end subroutine test_struct



subroutine interoperate_C
    use, intrinsic :: ISO_C_BINDING
    implicit none


    ! define C struct myctype
    ! typedef struct
    ! {
    !     int m,n;
    !     float r;
    ! }

    ! declare fortran derived type 
    
    type, BIND(C) ::myftype
            integer(c_int) :: i, j
            real(c_float) :: s
    end type myftype    ! myftype could interoperate with myctype


end subroutine interoperate_C





