! this file demonstrates the execution control feature in Fortran

program ctrl
    implicit none


    logical :: res = .false.
    integer :: ret


    ret = 100
    res = test_if_else(-1,2,ret)    ! Error,if test_if_else define outside, 

    print* , ret
    call test_case(5)
    call test_associate()
    call test_loop(10)
    call test_where()



    contains
    logical function test_if_else(arg1, arg2, arg3)
        implicit none
        integer, intent(in) :: arg1     ! 'in' can't be modified in function body
        integer, intent(in) :: arg2
        integer, intent(inout) :: arg3
    
    
        if_name: if (arg1 > 0 .or. arg2 > 0) then   ! if_name is optional
            test_if_else = .true.
            if (arg1 > arg2) then
                arg3 = 2
            else if (arg1 == arg2) then
                arg3 = 1
            else
                arg3 = 0
            end if
        else
            test_if_else = .false.
            arg3 = -1
            ! return
        end if if_name
    end function test_if_else


    subroutine test_case(arg1)
        implicit none
        integer :: arg1   
        case_name: select case (arg1)   ! compiler will exam whether the case is overlapped
        case (:-1)                      ! case_name is optional
            print*, "negative"
        case (0)
            print*, "zero"
        case (1,2,3:10)
            print*, "positive:1-10"
        case (11:)          ! similar to matlab
            print*, "positive11"
        case default
            print*, "null"
        end select case_name
    end subroutine test_case
        
        
    subroutine test_loop(arg1)
        implicit none
        integer :: arg1  
        integer :: i = 0 
        integer :: j= 0
    
        ! lable-do-stmt
        loop1: do i = 1,10  ! loop1(the name of loop) is optional
            if(i == 3) then
                cycle loop1 ! loop1 is optional; "cycle" is the same as "continue" in c language
            else if (i >5) then
                exit        ! the same as "break" in c language
            end if
            print*, i   
        end do loop1


        loop2: do i = 1,3
            sub_loop2: do j = 1,3
                if(i == 2) then
                    cycle loop2
                end if
                print* , "j = ", j
            end do sub_loop2

            print*, "i = ", i  

        end do loop2


        i = 0
        do while(i <= 3)
            i = i + 1
        end do
        print*, i

        
    end subroutine test_loop

    subroutine test_associate
        implicit none
        real :: x = 1.0
        real :: y = 1.0
        character(len = 10) :: z = "hello"

        real, parameter :: u = 3.0
        integer, dimension(3) :: v = [1,2,3]
        ! integer :: d = 13
        ! integer :: e = 14   
         

        test1 : associate ( z => exp(-(x**2+y**2)) )    ! test1(the name of associate) is optional
            print *, z
        end associate test1
        print*, z
        
        test2: associate (a => u, b => v(2), z => z)
            ! a = a-1   ! equal to: u = u-1; but u is a constant;
            b = b-1     ! equal to: v(2) = v(2)-1;
            print*, a
            print*, b
            print*, z
        end associate test2


    end subroutine test_associate

    subroutine test_where()
        implicit none

        integer :: a(3,5), i , j
   
        do i = 1,3
            do j = 1, 5                
                a(i,j) = j-i          
            end do 
        end do
        
        Print *, 'The A array:'
        
        do i = lbound(a,1), ubound(a,1)
            write(*,*) (a(i,j), j = lbound(a,2), ubound(a,2))
        end do
        
        where( a<0 ) 
            a = 1 
        elsewhere
            a = 5
        end where
        
        Print *, 'The A array:'
        do i = lbound(a,1), ubound(a,1)
            write(*,*) (a(i,j), j = lbound(a,2), ubound(a,2))
        end do   

    end subroutine test_where
    
     
end program ctrl


