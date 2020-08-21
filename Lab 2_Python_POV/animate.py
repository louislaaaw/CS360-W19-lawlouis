# CS360 Lab 2
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
    def AddBox(self, file): #format the box object with POV syntax
        return "box { {}, {} pigment { colour rgb {} }}".format(self.location_x, self_location.y, self_color)


fin = open('base.pov', "r") #open file
sdl = fin.read() # Read the entire file into a string
fin.close() #close the file

sdl_new = sdl #copy the string for tmp.pov

#open tmp.pov then write the copy to it
outfile = 'tmp.pov' 
fout = open( outfile, "w" )
fout.write( sdl_new )
fout.close()

#the regex for floats
num = r"(-?\d+.?\d*)"

#pattern for camera location
camera_location = r"location < %s , %s , %s >"
vector = camera_location % (num, num, num)

location_vector = re.findall(vector, sdl_new) #find the pattern

#read the vector as float
x = float(location_vector[0][0])
y = float(location_vector[0][1])
z = float(location_vector[0][2])

picNo = 1 #picture number
i = 0 #loop index

for i in range(50):
    #render the image
    pov_cmd = ' pvengine.exe +I%s +O%s -D -V +A +H600 +W800 /EXIT'
    cmd = pov_cmd % ('tmp.pov', "temp" + str(picNo).zfill(4) + ".png")
    os.system(cmd)
    i = i + 1 # loop index ++
    picNo = picNo + 1 #picture No. ++
    #changing the camera location
    x = x + 0.1
    y = y + 0.05
    z = z - 0.05
    sub = "location < " + str(x) + " , " + str(y) + " , " + str(z) + " >" # turn it to a string
    sdl_new = re.sub(vector, sub, sdl) # substitute the pattern
    #write it to tmp.pov
    outfile = 'tmp.pov'
    fout = open( outfile, "w" )
    fout.write( sdl_new )
    fout.close()

# Now make the movie
#
os.system('mencoder.exe mf://temp*.png -mf type=png:fps=25 -ovc lavc -lavcopts \
vcodec=msmpeg4:vbitrate=2160000:keyint=5:vhq -o movie.avi ' ) 

        



