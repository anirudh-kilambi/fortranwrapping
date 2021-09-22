module interpolation_module 
use iso_c_binding
implicit none 

type, bind(c) :: geo
    real, dimension(2) :: coordinates 
    real :: weight 
end type geo

contains 

    subroutine geo_manipulate(v1, v2, v3)
        type(geo), intent(in) :: v1, v2
        type(geo), intent(out) :: v3

        v3%coordinates = v1%coordinates * v1%weight + v2%coordinates * v2%weight 
        v3%weight = v1%weight + v2%weight 
    end subroutine geo_manipulate

end module interpolation_module


