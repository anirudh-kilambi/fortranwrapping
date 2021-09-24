module interpolation_module 
use iso_c_binding
implicit none 

! Need to define derived type to be used, in this case "geo". In order to call it in C later (and avoid having to redefine it in the .f90 c wrapper later),
! need to add bind(c) argument to the type definition 

! Geo consists of two components, the coordinates, and the weight. 
! Coordinates - float array of size 2. An allegory for possible coordinates needed for the cstintrp tool 
! Weight - float value. Allegory for possible weighting applied to different geogrpahical data inputted to cstintrp

type, bind(c) :: geo
    real, dimension(2) :: coordinates 
    real :: weight 
end type geo

contains 
! The following subroutine is a simple subroutine to take the derived type geo, and complete some operations on it. 
! Each input will have the coordinates multiplied by their respective weight.
! These coordinate arrays will be summed while the weights from the inputs will also be summed
! Example:

!     v1 = {'coordinates' = [1.,1.], 'weight' = 0.4}
!     v2 = {'coordinates' = [1., 1.], 'weight' = 0.6}

!     geo_manipulate(v1, v2, v3) will return the following: 

!     v3 coordinates = [(1. * 0.4 + 1. * 0.6), (1. * 0.4 + 1. * 0.6)]
!     v3 weight = 0.4 + 0.6
    
!     THe final returned v3 will be:

!     v3 = {coordinates = [1., 1.], weight = 1.}


    subroutine geo_manipulate(v1, v2, v3, output_weight)
        type(geo), intent(in) :: v1, v2
        logical, optional, intent(in) :: output_weight
        type(geo), intent(out) :: v3

        if (present(output_weight).and.(output_weight .eqv. .true.)) then 
            v3%coordinates = v1%coordinates * v1%weight + v2%coordinates * v2%weight 
            v3%weight = v1%weight + v2%weight 
        
        else
            print *, 'false'
            v3%coordinates = v1%coordinates * v1%weight + v2%coordinates * v2%weight
            v3%weight = 0
        end if 
        
    end subroutine geo_manipulate

end module interpolation_module


