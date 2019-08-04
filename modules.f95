! this file demonstrates the modules feature in Fortran

! @descp: module like a package including variables/constant/derived-type definiton/procedure(function/subroutine);
! @usage: 

module mdl_demo

    implicit none

    PUBLIC 
    ! type declaration; :: is optional
    type, private :: Books
        
        character(len = 50) :: title
        character(len = 50) :: author
        character(len = 150) :: subject
        integer :: book_id

    end type Books


    ! define a structure object
    type(Books) :: fortran_learning
    


    contains
    subroutine setBookID(id)  ! subroutine: invoked by "Call statement"
        implicit none

        integer :: id

        fortran_learning%book_id = id

    end subroutine setBookID

    function getBookID()   ! function: invoked in an expression
        implicit none

        integer :: getBookID
        getBookID = fortran_learning%book_id

    end function getBookID
    
    recursive function myfactorial (n) result (fac)  
        ! fac: function result; n: n!     
        implicit none     

        ! dummy arguments     
        integer :: fac     
        integer, intent (in) :: n     
        
        select case (n)         
            case (0:1)         
                fac = 1         
            case default    
                fac = n * myfactorial (n-1)  
        end select 
    
    end function myfactorial


end module mdl_demo