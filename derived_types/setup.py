from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
# This line only needed if building with NumPy in Cython file.
from numpy import get_include
from os import system

# compile the fortran modules without linking
fortran_mod_comp = 'gfortran interpolation.f90 -c -o interpolation.o -O3 -fPIC'
print (fortran_mod_comp)
system(fortran_mod_comp)
shared_obj_comp = 'gfortran pyginterpolation.f90 -c -o pyginterpolation.o -O3 -fPIC'
print (shared_obj_comp)
system(shared_obj_comp)

ext_modules = [Extension(# module name:
                         'pyginterpolation',
                         # source file:
                         ['pyginterpolation.pyx'],
                         # other compile args for gcc
                         extra_compile_args=['-fPIC', '-O3'],
                         # other files to link to
                         extra_link_args=['interpolation.o', 'pyginterpolation.o'])]

setup(name = 'pyginterpolation',
      cmdclass = {'build_ext': build_ext},
      # Needed if building with NumPy.
      # This includes the NumPy headers when compiling.
      include_dirs = [get_include()],
      ext_modules = ext_modules)