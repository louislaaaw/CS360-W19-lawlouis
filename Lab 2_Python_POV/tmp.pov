#version  3.7;
global_settings { assumed_gamma 2.2 }

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"


camera { fisheye location < 1.0000000000000024 , 4.999999999999991 , -6.499999999999991 > look_at < 0 , 0 , 0 > }

light_source { < -100 , 100 , -10 > colour rgb < 1 , 1 , 1 > }   

    
union{    
    intersection{
            blob {
               threshold 0.6
               component 1.0, 1.0, <0.75, 0, 0>
               component 1.0, 1.0, <-0.375, 0.64952, 0>
               component 1.0, 1.0, <-0.375, -0.64952, 0>
            
               pigment { color rgb< 0.7,0,0.05> }
               finish {
                  ambient 0.1
                  diffuse 0.7
                  phong 1
               }
               rotate 30*y
            }
            sphere { < 0 , 1 > , 1 pigment { checker colour rgb < 5 , 2 , 1 >, colour rgb < 2 , 0.5 , 0.5 > } finish { diffuse 0.8 }}        
    }
    torus { 1.5, 0.7
   // Bottom layer texture.  Uses a "stretched" bozo for fine porous grain
   texture {
      pigment {
         bozo
         color_map {
            [0.0 0.4 color BakersChoc  color BakersChoc ]
            [0.4 1.01 color Tan color Tan]
         }
         scale <4, 0.05, 0.05>
      }
   }

   // Overlaying ring grain texture
   texture {
      finish {
         phong 1
         phong_size 100
         brilliance 3
         ambient 0.2
         diffuse 0.8
      }
      pigment {
         wood
         turbulence 0.025

         color_map {
            [0.0 0.15 color SemiSweetChoc color CoolCopper ]
            [0.15 0.40 color CoolCopper color Clear ]
            [0.40 0.80 color Clear  color CoolCopper ]
            [0.80 1.01 color CoolCopper color SemiSweetChoc ]
         }

         scale <3.5, 1, 1>
         translate -50*y
         rotate 1.5*z
      }
      }
    }
    
}
                 
plane { y , -2 pigment { checker colour rgb < 10 , 10 , 10 > colour rgb < 0.5 , 0.5 , 0.5 > }}

background{ colour rgb < 0.5 , 0.5 , 0.5 >}