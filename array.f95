program array
    implicit none



    interface   ! interface should precede variables definition
        subroutine fillArray (mat)
            integer, dimension(:,:), intent (out) :: mat 
            integer :: i,j         
        end subroutine fillArray      

        subroutine printArray (mat)
            integer, dimension(:,:) :: mat 
            integer :: i,j         
        end subroutine printArray   
    end interface

    integer :: i, j

    ! declare a one-dimensional array containing 5 elements
    real, dimension(5) :: re_nums1

    ! create a 5 x 5 two-dimensional array
    integer, dimension(5,5) :: int_mat1

    ! declare an array with some explicit lower bound
    real, dimension(2:6) :: re_nums2
    integer, dimension(-3:1,0:4) :: int_mat2

    ! declare a dynamic array
    real, dimension (:,:), allocatable :: int2d_mat
    procedure(fillArray), pointer :: pf_fillArray => fillArray


    



    ! assining values
    re_nums1(1) = 1.0
    do i = 2,5
        re_nums1(i) = i
    end do

    ! One-dimensional array can be directly assigned values with (/ /), called array constructor
    re_nums2 = (/ 1.0, 2.0, 3.0, 4.0, 5.0/)  ! no spaces allowed between the brackets ‘( ‘and the back slash ‘/’
    
    !assigning some values to the array matrix
    do i=-3,1
        do j = 0, 4
            int_mat2(i,j) = i+j
        end do
    end do

    ! allocate memory sapce for dynamic array
    allocate ( int2d_mat(5,5) )


    


    ! passing array to procedure
    ! call fillArray (int_mat1)
    call pf_fillArray(int_mat1)
    call printArray (int_mat1)


    ! Array Sections: array([lower]:[upper][:stride], ...)


    ! destroy the memory of dynamic array
    deallocate (int2d_mat)  

end program array




subroutine fillArray (mat)
    implicit none

    ! the actural argument could be only a 5*5 matrix
    integer, dimension(5,5), intent(out) :: mat
    integer :: i,j

    do i = 1,5
        do j = 1,5
            mat(i,j) = i + j
        end do
    end do

end subroutine fillArray 


subroutine printArray (mat)
    implicit none

    ! the actural argument could be only a 5*5 matrix
    integer, dimension(:,:) :: mat
    integer :: i,j
    integer, dimension(1:2) :: int1_size


    int1_size = shape(mat)
    do i = 1,int1_size(1)
        do j = 1,int1_size(2)
            ! mat(i,j) = i + j
            print*, mat(i,j)
        end do
    end do

end subroutine printArray 