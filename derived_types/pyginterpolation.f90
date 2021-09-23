module interpolation_interface 
use interpolation_module ! call the original module 
use iso_c_binding ! required for wrapping subroutines
implicit none 


contains 
! The subroutine below will be essentially identical to the original module's subroutine with the inclusion of c types 
! in parantheses (if needed). In this case, no C types are needed as we only use derived types.

    subroutine c_geo_manipulate(v1, v2, v3) bind(c)
        type(geo), intent(in) :: v1, v2
        type(geo), intent(out) :: v3

        call geo_manipulate(v1, v2, v3)
    end subroutine c_geo_manipulate

end module interpolation_interface