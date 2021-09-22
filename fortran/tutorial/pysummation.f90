module gfunc1_interface 
    use iso_c_binding 
    use gfunc_module 
    implicit none 

    type, bind(c) :: c_geo 
        real(c_float), dimension(1:2) :: coordinates
        real(c_float) :: weight 
    end type 

    contains 


    subroutine geo_c2f(cv, fv)
        type(c_geo), intent(in) :: cv
        type(geo), intent(out) :: fv
        fv%coordinates = cv%coordinates 
        fv%weight = cv%weight 
    end subroutine 

    subroutine geo_f2c(fv, cv)
        type(geo), intent(in) :: fv
        type(c_geo), intent(out) :: cv 

        cv%coordinates = fv%coordinates 
        cv%weight = fv%weight 
    end subroutine

    subroutine c_gfunc(v1, v2, final_v) bind(c)
        type(c_geo), intent(in) :: v1, v2
        type(geo), intent(out) :: final_v
        type(geo) :: v1f, v2f


        call geo_c2f(v1, v1f)
        call geo_c2f(v2, v2f)

        call gfunc(v1f, v2f, final_v)

    end subroutine
    
