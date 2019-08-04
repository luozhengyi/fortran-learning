! this file demonstrates the enumeration types in Fortran


program enumeration
    implicit none

    call testEnum1();

end program enumeration



subroutine testEnum1()
    use, intrinsic :: iso_c_binding
    implicit none
    enum, bind(C)
        enumerator :: red = 4, blue = 9     ! if = appear, the :: is nessary
        enumerator yellow                   ! yellow = 10
    end enum
    print* , yellow
end subroutine testEnum1
