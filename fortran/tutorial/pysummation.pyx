cdef extern from "pysummation.h":
    cdef struct geo:
        float coordinates[2]
        float weight
    void c_gfunc(geo *v1, geo *v2, geo *final_v)

def f(geo v1, geo v2): 
    cdef:
        geo value 

    c_gfunc(<geo*>&v1, <geo*>&v2, <geo*>&value)
    return value 