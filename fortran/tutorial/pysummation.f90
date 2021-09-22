module gfunc1_interface 
    use iso_c_binding 
    use gfunc_module 
    implicit none 

    type, bind(c) :: geo 
        real(c_float), dimension(1:2) :: coordinates
        real(c_float) :: weight 
    end type 

    contains 

    subroutine c_gfunc(v1, v2, final_v) bind(c)
        type(geo), intent(in) :: v1, v2
        type(geo), intent(out) :: final_v
        call gfunc(v1, v2, final_v)

    end subroutine 

end module 
