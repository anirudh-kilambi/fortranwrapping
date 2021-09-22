struct geo{
    float coordinates[2];
    float weight;
};

extern void c_gfunc(struct geo *v1, struct geo *v2, struct geo *final_v);

