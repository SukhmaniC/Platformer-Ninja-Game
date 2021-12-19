%Game map
map := 2                                              %Variable map is given value of 2
map1 (1) := Pic.FileNew ("map2full.bmp")              %Picure of level 2
map1 (2) := Pic.FileNew ("map2wdc.bmp")               %Second Picure of level 2 that goes behind the first picture and this picture will be used for what dot colour

%Coordinates for ninja starting position on map 2
xx := 100                                             %Variable for ninja picture starting point on x-axis
yy := 40                                              %Variable for ninja picture starting point on y-axis


loop
game                                                                                                                   %Calls procedure game 
    if key (chr (32)) and whatdotcolor (xx, yy + 70)=9 or key (chr (32)) and whatdotcolor (xx+45, yy + 70)  = 9 then   %If space bar is clicked and image is in front of color 9 then
exit                                                                                                                   %Exit loop
end if
end loop

%Next Level
include "map3.t"                                      %Include the map3.t file 
