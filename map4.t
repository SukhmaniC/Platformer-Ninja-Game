%Game map
map := 4                                              %Variable map is given value of 4
map1 (1) := Pic.FileNew ("map4full.bmp")              %Picure of level 4
map1 (2) := Pic.FileNew ("map4wdc.bmp")               %Second Picure of level 4 that goes behind the first picture and this picture will be used for what dot colour

%High jump power-up is removed
highjump := 0                                         %highjump value is set to zero so character can't super high on this level

%Coordinates for ninja starting position on map 4
xx := 10                                              %variable for ninja picture starting point on x-axis
yy := 680                                             %variable for ninja picture starting point on y-axis




loop
    game                                                                                                              %calls procedure game
    if key (chr (32)) and whatdotcolor (xx, yy + 70)=9 or key (chr (32)) and whatdotcolor (xx+45, yy + 70)  = 9 then  %If space bar is clicked and image is in front of color 9 then
	exit                                                                                                          %exit loop
    end if
end loop

%Next Level
include "map5.t"                                      %include the map4.t file 



