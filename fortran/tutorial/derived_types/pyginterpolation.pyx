cdef extern from "pyginterpolation.h":
    ctypedef struct geo:
        float coordinates[2]
        float weight

    cdef void c_geo_manipulate (geo *v1, geo *v2, geo *v3)



def f(geo v1, geo v2):
    cdef geo value 
    
    c_geo_manipulate(<geo*> &v1,<geo*> &v2,<geo*> &value)
    return value 
