import pyginterpolation as pyg
class py_geo(object):
    def __init__(self, coords, weight):
        self.coordinates = coords
        self.weight = weight


# v1 = py_geo([0., 1.], 0.5)
# v2 = py_geo([1, 0], 2)
v1 = {"coordinates": [0,1], "weight": 0.5}

output = pyg.f(v1,v1, output_weights = True)

print(type(output))
