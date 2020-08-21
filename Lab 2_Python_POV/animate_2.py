import re
import os
import math

#part 2
class box:
    def __init__(self, location_x, location_y, color): #initialize a box object
        self.location_x = location_x
        self.location_y = location_y
        self.color = color
    def set_location_x(self, location_x):
        self_location_x = location_x
    def set_location_y(self, location_y):
        self_location_y = location_y
    def set_color(self, color):
        self_color = color
    def get_location_x(self):
        return self.location_x
    def get_location_y(self):
        return self.location_y
    def get_color(self):
        return self.color
    def AddBox(self): #format the box object with POV syntax
        string = r"box { < %s, %s, %s >, <%s, %s, %s> pigment{ colour rgb <%s, %s, %s> }}"
        string2 = string % (self.location_x[0], self.location_x[1], self.location_x[2],
                         self.location_y[0], self.location_y[1], self.location_y[2],
                         self.color[0], self.color[1], self.color[2])        
location_x1 = 0
location_x2 = 0
location_x3 = 0
location_x = [location_x1, location_x2, location_x3]
location_y1 = 2
location_y2 = 2
location_y3 = 2
location_y = [location_y1, location_y2, location_y3]
color_r = 10
color_g = 2
color_b = 1
color = [color_r, color_g, color_b]
new_box = box(location_x, location_y, color)
print(new_box.AddBox)
