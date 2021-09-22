module interpolation_interface 
use interpolation_module
use iso_c_binding
implicit none 


! type, bind(c) :: geo
!     real(c_float), dimension(1:2) :: coordinates 
!     real(c_float) :: weight 
! end type 

contains 

    subroutine c_geo_manipulate(v1, v2, v3) bind(c)
        type(geo), intent(in) :: v1, v2
        type(geo), intent(out) :: v3

        call geo_manipulate(v1, v2, v3)
    end subroutine c_geo_manipulate

end module interpolation_interface