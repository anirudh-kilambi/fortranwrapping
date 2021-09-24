import numpy as np

# This is the actual cython file from which the shared object (.so) file we can call will be created. 

# In order to use the fortran subroutines we want, there are two things we need to do: 

    # 1. Define all structures(derived types) and call all functions(or subroutines) we want from our c header file (in this case, called "pyginterpolation.h")
    #     1.1 Structure definitions need to be done as both a "ctypedef" as well as a python class
    # 2. Define a python function for each fortran subroutine/function you want to call. 

cdef bint boolean_variable = True 

cdef extern from "pyginterpolation.h":
    ctypedef struct geo:
        float coordinates[2]
        float weight

    cdef void c_geo_manipulate(geo *v1, geo *v2, geo *v3, bint *output_weight)

# class py_geo(object):
#     def __init__(self, coords, weight):
#         self.coordinates = coords 
#         self.weight = weight

# Below is the function definition for the geo_manipulate subroutine. 
# Essentially, the python function is very bare-bones and just acts as a way to call the fortran function.
# Recall: In fortran, subroutine definitions need to involve all variables that are inputs[intent(in)] or outputs[intent(out)]. 
# Because of this, we need to define the output variable that can then be used when the cwrapped Fortran function/subroutine is called 
# (hence the definition for variable "value" of type(geo)).
def f(geo v1, geo v2, output_weights = False):
    cdef geo value
    if output_weights is True: 
        optional_weights_output = True 
        c_geo_manipulate(<geo*> &v1,<geo*> &v2,<geo*> &value, <bint*> &optional_weights_output)
        return np.array(value)
    # else: 
    #     optional_weights_output = False
    #     c_geo_manipulate(<geo*> &v1,<geo*> &v2,<geo*> &value, <bint*> &optional_weights_output)
    #     return np.array(value.coordinates)
