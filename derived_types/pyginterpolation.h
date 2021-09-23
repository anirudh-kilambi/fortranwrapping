// This will be the C header file needed as an intermediate between the fortran and cython code. 
// All derived types that need to be wrapped will need to be defined in this header file using the c struct format 


struct _geo {
    float coordinates[2];
    float weight;
};

typedef struct _geo geo;

// Notice that geo is defined as "_geo" in the struct definition. This is because geo must be defined in the header file
// (for the sake of the void statement), but can not be defined with the same name 
// as it causes redundancy from the "extern void" line. Because of this, the actual type of geo we use in the void statement, 
// will then be assigned the type of the struct. 

extern void c_geo_manipulate(geo *v1, geo *v2, geo *v3);