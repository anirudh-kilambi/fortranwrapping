struct c_geo{
    float coordinates[2];
    float weight;
};

extern void c_gfunc(struct c_geo *v1, struct c_geo *v2, struct c_geo *final_v);

