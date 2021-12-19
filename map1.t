include "controls.t"                                         %Include the controls.t file 
setscreen ("graphics:1200;900,offscreenonly")                %Sets the screen 1200 pixels by 900 pixels

%Game map
map := 1                                                     %variable map is given value of 1
map1 (1) := Pic.FileNew ("map1full.bmp")                     %Picure of level 1
map1 (2) := Pic.FileNew ("map1forwhatdotcolor.bmp")          %Second Picure of level 1 that goes behind the first picture and this picture will be used for what dot colour

loop
    game                                                                                                               %Calls procedure game
    if key (chr (32)) and whatdotcolor (xx, yy + 70)=9 or key (chr (32)) and whatdotcolor (xx+45, yy + 70)  = 9 then   %If space bar is clicked and image is in front of color 9 then
	exit                                                                                                           %Exit loop
    end if
end loop

%Next level
include "map2.t"                                             %Include the map2.t file 
