cdef extern from "pysummation.h":
    cdef  c_geo:
        cdef float coordinates[2]
        cdef float weight

    cdef extern void c_gfunc( c_geo *v1,  c_geo *v2,  c_geo *final_v)

def f(c_geo v1,c_geo v2): 
    cdef:
        c_geo value 

    c_gfunc(c_geo *&v1, c_geo *&v2, c_geo *&value)
    return value 