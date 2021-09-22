struct _geo {
    float coordinates[2];
    float weight;
};

typedef struct _geo geo;
extern void c_geo_manipulate(geo *v1, geo *v2, geo *v3);