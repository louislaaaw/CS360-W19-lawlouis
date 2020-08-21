#version  3.7;
global_settings { assumed_gamma 2.2 }

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"


camera { fisheye location < 1.0000000000000024 , 4.999999999999991 , -6.499999999999991 > look_at < 0 , 0 , 0 > }

light_source { < -100 , 100 , -10 > colour rgb < 1 , 1 , 1 > }
                 
plane { y , -2 pigment { checker colour rgb < 10 , 10 , 10 > colour rgb < 0.5 , 0.5 , 0.5 > }}

background{ colour rgb < 0.5 , 0.5 , 0.5 >}   