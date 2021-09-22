module gfunc_module 
implicit none 
type :: geo 
    real, dimension(1:2) ::coordinates
    real :: weight 

end type 

contains 
    subroutine gfunc(v1, v2, final_v)
        type(geo), intent(in) :: v1, v2
        type(geo), intent(out) :: final_v

        final_v%coordinates = v1%coordinates * v1%weight + v2%coordinates * v2%weight 
        final_v%weight = v1%weight + v2%weight 
    end subroutine 

end module 