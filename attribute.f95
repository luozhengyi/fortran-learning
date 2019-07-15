! this file demonstrates the attribute in Fortran

module accessAttr  ! accessibility exist only in module

    implicit none
    private ! all variable/type/procedure is private, unless specified public explicit
    

    public :: rout2, fun1, fun2  ! indicate the accessiblity of rout2, test1 and test2


    integer :: int_var1 = 10
    integer,public :: int_var2 = 20

    type, public :: user    ! user type is accessable
        character(len = 10) :: name
        integer, private :: age
    end type user
    
    ! type :: student
    !     integer
    ! end type student


    

    contains
    subroutine  rout1()
        implicit none
    end subroutine rout1

    subroutine  rout2()
        implicit none

        type(user) :: Allice
        Allice%name = "Allice"
        Allice%age = 30
    end subroutine rout2

    integer function fun1()
        implicit none
    end function fun1

    integer function fun2()
        implicit none
    end function fun2
end module accessAttr

subroutine test_accessAttr()
    use accessAttr

    integer :: int_var1     ! int_var1 in access module is private,doesn't confilict
    ! integer :: int_var2   ! Error: confict with variable in access module
    integer :: int_var3


    type(user) :: Bob
    Bob%name = "Bob"
    ! Bob%age = 24  ! Error: private component of user type



    print* , int_var2
    ! call rout1()      ! Error: private
    int_var1 = fun1()
    int_var3 = fun2()
end subroutine test_accessAttr


module pointerAttr
    implicit none
    ! integer, pointer :: p1 ! pointer to integer  
    ! real, pointer, dimension (:) :: pra ! pointer to 1-dim real array  
    ! real, pointer, dimension (:,:) :: pra2 ! pointer to 2-dim real array

    

    contains
    subroutine test1()
        implicit none
        integer, target  :: int_var5 =50 ! variable only with target/pointer attr could be assigned to pointer
        integer, pointer :: pint_var5
        integer, pointer :: pint_var6
        integer, target  :: int_var6


        !!! pointerAttr test1() begin
        print*, "pointerAttr test1() begin"

        int_var6 = int_var5
        int_var6 = 60
        print*, int_var5

        pint_var5 => int_var5
        pint_var5 = 60
        print*, int_var5
        Print*, associated(pint_var5)   ! associated() return a logical value
        Print*, associated(pint_var5, int_var5)
        Print*, associated(pint_var5, int_var6)
        nullify(pint_var5)
        Print*, associated(pint_var5)
        print*, pint_var5

        allocate(pint_var6)     ! allocate space for a pointer object
        pint_var6 = 70
        print*, pint_var6
        deallocate(pint_var6)   ! empty the allocated storage space by the deallocate



        !!! pointerAttr test1() end
        print*, "pointerAttr test1() end"
    end subroutine test1









end module pointerAttr


subroutine test_pointerAttr()
    use pointerAttr
    implicit none

    call test1()


end subroutine test_pointerAttr

subroutine test_dataAttr()
    implicit none
    ! The data statement can be used for initialising more than one array, 
    ! or for array section initialisation.
    integer :: a(5), b(3,3), c(10),i, j

    data a /7,8,9,10,11/
    data i /0/, j /0/   ! equal to  " data i,j /0,0/ "
    data b(1,:) /1,1,1/ 
    data b(2,:)/2,2,2/ 
    data b(3,:)/3,3,3/ 
    data (c(i),i = 1,10,2) /4,5,6,7,8/  ! i = 1,10,2 equal to i=1:10:2
    data (c(i),i = 2,10,2)/5*2/ ! 5*2 stands for Initialising  5 elements with value 2
    
    
    Print *, 'The B array:'
    do i = lbound(b,1), ubound(b,1)
        write(*,*) (b(i,j), j = lbound(b,2), ubound(b,2))
    end do

    Print *, 'The C array:' 
    do j = 1, 10                
        print*, c(j)           
    end do   
end subroutine test_dataAttr



program attribute

    implicit none

    call test_accessAttr()
    call test_pointerAttr()
    call test_dataAttr()



end program