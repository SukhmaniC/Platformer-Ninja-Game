%Game map
map := 5                                              %Variable map is given value of 5
map1 (1) := Pic.FileNew ("map5full.bmp")                  %Picure of level 5
map1 (2) := Pic.FileNew ("map5wdc.bmp")               %Second Picure of level 5 that goes behind the first picture and this picture will be used for what dot colour

%Coordinates for ninja starting position on map 4
xx := 230                                             %variable for ninja picture starting point on x-axis
yy := 50                                              %variable for ninja picture starting point on y-axis


 

loop
    game                                                                                                               %calls procedure game
    if key (chr (32)) and whatdotcolor (xx, yy + 70)=9 or key (chr (32)) and whatdotcolor (xx+45, yy + 70)  = 9 then   %If space bar is clicked and image is in front of color 9 then
	exit                                                                                                           %exit loop
    end if
end loop


%Game Win screen
include "win.t"
