%*************************************Variables*******************************
var map: int                                       %variable for map number
var background:int                                 %variable for picture of background
var key : array char of boolean
var xx := 1000                                     %variable for ninja picture starting point on x-axis
var yy := 70                                       %variable for ninja picture starting point on y-axis
var xxvelocity:int:=0                              %variable for xvelocity that has an initial value of zero
var yyvelocity:int:=0                              %variable for yvelocity that has an initial value of zero
var gravity : int := 9                             %variable for gravity which has a value of 9
var ninja : int                                    %variable for drawing ninja to screen later on
var health:int :=3                                 %variable for health which has initial value of 3
var Heart:int:=0                                   %variable for heart which has a value of 0
var healthheart: int                               %variable for picture of health power-up
var highjump:int:=0                                %variable for hihgjump that has starting value of zero 
var Highjump : int                                 %variable for picture of Highjump
var speedUp : int:=0                               %variable for speedup that has starting value of zero  
var Speedup : int                                  %variable for picture of Speedup 
var gamePause:int                                  %variable for picture of pause button
var GameOver:int                                   %variable for picture of game-over screen

%Arrays
var map1 : array 1 .. 2 of int                     %array for map1 that will be shown on screen and map1 picture that will be printed behind the other pictures and will be used for whatdotcolor
var ninjaside : array 1 .. 2 of int                %array for ninja picture facing right and ninja picture facing left
var heart: array 1..3 of int                       %array for heart pictures

%*************************************Pictures**********************************
background := Pic.FileNew ("background.bmp")       %picture of pause screen background
ninjaside (1) := Pic.FileNew ("ninjaleft.bmp")     %picture of ninja facing left
ninjaside (2) := Pic.FileNew ("ninjaright.bmp")    %picture of ninja facing right
ninja := Pic.FileNew ("ninjaleft.bmp")             %picture of ninja facing left and this will allow the ninja to be facing the left when it is drawn
heart (1):= Pic.FileNew ("heart.bmp")              %Picure of 1 heart for healh
heart (2):= Pic.FileNew ("heart2.bmp")             %Picure of 2 hearts for healh
heart (3):= Pic.FileNew ("heart3.bmp")             %Picure of 3 hearts for health
healthheart := Pic.FileNew ("health.bmp")          %Picure of health power-up
Highjump :=Pic.FileNew ("jump2.bmp")               %Picure of high-jump power-up
Speedup:= Pic.FileNew ("speed-up.bmp")
gamePause := Pic.FileNew ("pause2.bmp")            %picture of pause button
GameOver  := Pic.FileNew ("gameover.bmp")          %Picure of game-over screen

%********************************Transperancy Code*******************************
Pic.SetTransparentColor (heart (1), white)         %Makes all white pixels of image transparent
Pic.SetTransparentColor (heart (2), white)         %Makes all white pixels of image transparent
Pic.SetTransparentColor (heart (3), white)         %Makes all white pixels of image transparent
Pic.SetTransparentColor (healthheart, white)       %Makes all white pixels of healthheart image transparent
Pic.SetTransparentColor (Highjump, white)          %Makes all white pixels of high-jump image transparent
Pic.SetTransparentColor (gamePause, white)         %Makes all white pixels of gamePause image transparent

%*****************************************PROCEDURES**********************************************
%procedure for movement
proc movement 
    Input.KeyDown (key)
    if key (KEY_LEFT_ARROW)and  whatdotcolor (xx - 11, yy +1) not= green and whatdotcolor (xx - 10, yy + 70) not= green then              %If left arrow key is pressed and the x values that are 10 pixels in front of picture and y values from bottom of picture to 14 pixels above it are not green then
	xxvelocity := -11                                                                                                                 %The xxvelocity values will be shifted to the left 11 units
	 ninja := ninjaside (1)                                                                                                           %Variable ninja value will be changed to ninjaleft picture
	 elsif key (KEY_RIGHT_ARROW) and whatdotcolor (xx +45, yy +1) not= green and whatdotcolor (xx +60, yy + 70) not= green then       %If right arrow key is pressed and the x values that are 15 pixels behind picture and y values from bottom of picture to 14 pixels above it are not green then
	xxvelocity := 11                                                                                                                  %The xxvelocity values will be shifted to the right 11 units
	ninja := ninjaside (2)                                                                                                            %Variable ninja value will be changed to ninjaright picture
    else                                                                                                                                  %else
    xxvelocity:=0                                                                                                                         %xxvelocity will equal 0
    end if
    
    if  speedUp=1 and key (KEY_LEFT_ARROW)and  whatdotcolor (xx - 11, yy +1) not= green and whatdotcolor (xx - 10, yy + 70) not= green then    %If left arrow key is pressed and the x values that are 10 pixels in front of picture and y values from bottom of picture to 14 pixels above it are not green then
	xxvelocity := -22                                                                                                                      %The xxvelocity values will be shifted to the left 11 units
	 ninja := ninjaside (1) 
	 end if 
	if  speedUp=1 and key (KEY_RIGHT_ARROW) and whatdotcolor (xx +45, yy +1) not= green and whatdotcolor (xx +60, yy + 70) not= green then %If right arrow key is pressed and the x values that are 15 pixels behind picture and y values from bottom of picture to 14 pixels above it are not green then
	xxvelocity := 22                                                                                                                       %The xxvelocity values will be shifted to the right 11 units
	ninja := ninjaside (2)
	end if  
	
    if key (KEY_UP_ARROW) and whatcolor = green and whatdotcolor (xx +45, yy + 84) = green then                                           %If up arrow key is pressed and the x values that start(0) in front of picture and end at the end of the picture (45) and the y values at top of picture (84) are green then
	yyvelocity := -5                                                                                                                  %The yyvelocity values will be shifted down 2 units
	end if
   if  key (KEY_UP_ARROW) and whatdotcolor (xx +0, yy -10) = green or key (KEY_UP_ARROW) and whatdotcolor (xx +45, yy -10) = green then   %If up arrow key is pressed and the x values that start(0) in front of picture and end at the end of the picture (45) and the y values 10 pixels below image are green then
	yyvelocity := 65                                                                                                                  %The yyvelocity values will be shifted up 65 units
	end if
    if highjump=1 then
    if key (KEY_UP_ARROW) and whatdotcolor (xx +0, yy -10) = green or key (KEY_UP_ARROW) and whatdotcolor (xx +45, yy -10) = green then   %If jump value is 1 and up arrow key is pressed and the x values that start(0) in front of picture and end at the end of the picture (45) and the y values 10 pixels below image are green then
	yyvelocity := 85                                                                                                                  %The yyvelocity values will be shifted up 65 units
    end if
    end if
     
%Pushes sprite away from red colored objects
     if whatdotcolour (xx-2, yy+5) = red then           %If 2 pixels in front of ninja picture is anything colored red then
    xxvelocity:=0                                       %Make xxvelocity 0
    xx+=14                                              %Shift xx values 14 pixels away from red  
    elsif whatdotcolour (xx+43, yy+5) = red then        %If 2 pixels before end of ninja picture is anything colored red then
    xxvelocity:=0                                       %make xxvelocity 0
    xx-=14                                              %shift xx values 14 pixels away from red
    end if
    
    yyvelocity -= gravity                               %Subtract gravity value from yyvelocity value
    xx+=xxvelocity                                      %Add xxvelocity value to xx value
    yy+=yyvelocity                                      %Add yyvelocity value to yy value
    
%Ninja does not fall through green platforms 
    if yyvelocity < -15 then
	yyvelocity := -15
    end if

%Stops picture from going through the green platforms   
    if whatdotcolour (xx, yy-1) = green then            %from begining point of picture if one pixel below image is green then
    gravity:=0                                          %gravity now equals 0
    yyvelocity:=0                                       %yyvelocity now equals 0
    yy+=8                                               %the yy values will be shifted up 8 units
    elsif whatdotcolour (xx+45, yy-1) = green then
    gravity:=0                                          %gravity now equals 0
    yyvelocity:=0                                       %yyvelocity now equals 0
    yy+=8                                               %the yy values will be shifted up 8 units


    elsif whatdotcolour (xx, yy+84) = green or whatdotcolour (xx+45, yy+84) = green  then     
    yyvelocity:=0
    else
    gravity:=9
    end if
    
%*****************************************Teleporter******************************
    if key (chr (32))and  whatdotcolor (xx, yy +1) = 34 and map=1 then       %If the space bar is clicked and the color is purple and on map1 then
    xx:=828 yy:=530                                                          %change xx and yy coordinates to (828, 530)
    elsif key (chr (32))and  whatdotcolor (xx, yy +1) = 34 and map=2 then    %If the space bar is clicked and the color is purple and on map2 then
    xx:=1035 yy:=690                                                         %change xx and yy coordinates to (1035, 690)
    elsif key (chr (32))and  whatdotcolor (xx, yy +1) = 34 and map=3 then    %If the space bar is clicked and the color is purple and on map3 then
    xx:=605 yy:=260                                                          %change xx and yy coordinates to (605, 240)
    elsif key (chr (32))and  whatdotcolor (xx, yy +1) = 34 and map=4 then    %If the space bar is clicked and the color is purple and on map4 then
    xx:=345 yy:=180                                                          %change xx and yy coordinates to (345, 180)
    elsif key (chr (32))and  whatdotcolor (xx, yy +1) = 34 and map=5 then    %If the space bar is clicked and the color is purple and on map4 then
    xx:=50 yy:=590 
    end if
end movement

%Procedure for health
proc Health
if whatdotcolor (xx, yy) = yellow or whatdotcolor (xx+45, yy) = yellow or whatdotcolor (xx+45, yy+54) = yellow or whatdotcolor (xx, yy+54) = yellow or yy < 0 and map1 (2)=map1 (2) then %if ninja sprite touches color yellow then
delay (100)                                                                  %delay for 0.1 of a second
health:= health-1                                                            %value of variable health is decreased by 1

if map=1 then                                                                %if variable map is equal to 1 then
xx := 1000                                                                   %point where ninja picture is drawn point on x-axis
yy := 70                                                                     %point where ninja picture is drawn point on y-axis

elsif map=2 then                                                             %if variable map is equal to 2 then
xx := 100                                                                    %point where ninja picture is drawn point on x-axis
yy := 40                                                                     %point where ninja picture is drawn point on y-axis

elsif map=3 then                                                             %if variable map is equal to 3 then
xx := 840                                                                    %point where ninja picture is drawn point on x-axis
yy := 70                                                                     %point where ninja picture is drawn point on y-axis
highjump:=0                                                                  %hihgjump value is equal to zero

elsif map=4 then                                                             %if variable map is equal to 4 then
xx := 10                                                                     %point where ninja picture is drawn point on x-axis
yy := 680                                                                    %point where ninja picture is drawn point on y-axis

elsif map=5 then                                                             %if variable map is equal to 4 then
xx := 230                                                                    %point where ninja picture is drawn point on x-axis
yy := 50                                                                     %point where ninja picture is drawn point on y-axis
speedUp:=0                                                                   %speed-up value is set to zero
end if
end if

if health=3 then Pic.Draw (heart (3), 1050, 850, picMerge)                   %if health is equal to three then draw picture with three hearts 
elsif health=2 then Pic.Draw (heart (2), 1100, 850, picMerge)                %if health is equal to two then draw picture with two hearts 
elsif health=1 then Pic.Draw (heart (1), 1150, 850, picMerge)                %if health is equal to one then draw picture with one hearts 
end if
end Health

%***************************************Power-up Procedures****************
%Procedure for replenish
proc replenish
if map=2 and Heart=0 then                                                               %If variable map equals two and variable heart = 0 then 
Pic.Draw (healthheart , 330, 650, picMerge)                                             %Draw healthheart picture
end if
if map=2 and whatdotcolor (xx, yy+35)=12 or whatdotcolor (xx+45, yy+35)  = 12  then     %If color is equal to 12 and image is touching 12 then
Heart:=1                                                                                %Variable heart now equals 1
health:=3                                                                               %Variable health now equals 3
end if
end replenish

%Procedure for highjump
proc highJump 
if map=3 and highjump=0 then                                                            %If variable map equals three and variable highjump = 0 then
Pic.Draw (Highjump , 1050, 300, picMerge)                                               %Draw Highjump picture
end if
if map=3 and whatdotcolor (xx, yy+35) = 10 or whatdotcolor (xx+45, yy+35) = 10 then 
highjump:=1
end if
end highJump

%Procedure for speed-up
proc SpeedUp
if map=5 and speedUp=0 then                                                             %If variable map equals three and variable highjump = 0 then
Pic.Draw (Speedup , 70, 150, picMerge)                                                  %Draw Spped-up picture
end if 
if map=5 and whatdotcolor (xx, yy+35) = 11  then 
speedUp:=1
end if
end SpeedUp
%************************Procedures for Pause, Gameover and Gamewin***************
%Procedure for pause
proc Pause
    setscreen ("graphics:1200;900,offscreenonly")                                 %Sets the screen 1200 pixels by 900 pixels
    Pic.Draw (background, 0, 0, picCopy)                                          %Background for pause screen
    Draw.Text ("Pause", 550, 700, font, 9)                                        %Pause Title

    Draw.Text ("Resume", 580, 500, font5, 12)                                     %Text for resume button
    Draw.Text ("Instructions", 545, 450, font5, 12)                               %Text for instructions button
    Draw.Text ("Quit", 610, 400, font5, 12)                                       %Text for quit button

    loop
	Mouse.Where (x, y, button)
	if x > 580 and x < 735 and y > 500 and y < 530 and button = 1 then        %button
	    exit                                                                  %exit loop
	elsif x > 545 and x < 765 and y > 450 and y < 480 and button = 1 then     %button
	    cls                                                                   %clears the screen
	    Window.Close (winID)                                                  %closes window
	    winID := Window.Open ("graphics:1200;900")                            %opens window with resolution of 1200 pixels by 900 pixels
	    instructions                                                          %calls procedure instructions
	elsif x > 30 and x < 190 and y > 835 and y < 865 and button = 1 then      %button
	    Window.Close (winID)                                                  %closes window
	    winID := Window.Open ("graphics:1200;900,offscreenonly")              %opens window with resolution of 1200 pixels by 900 pixels
	    exit                                                                  %exit loop
	elsif x > 610 and x < 690 and y > 400 and y < 430 and button = 1 then     %button
	    Window.Close (winID)                                                  %closes window
	    Music.PlayFileStop                                                    %The music file being played will stop
	    finished := true
	    break
	end if
    end loop
end Pause                              

%Procedure for gameover
proc gameover
setscreen ("graphics:1200;900,offscreenonly")                                     %Sets the screen 1200 pixels by 900 pixels
    Pic.Draw (GameOver,0, 0, picCopy)                                             %draws picture of game-over screen
    Draw.Text ("Retry", 580, 500, font5, white)                                   %Text for retry button
    Draw.Text ("Quit", 585, 450, font5, white)                                    %Text for quit button
    loop
	Mouse.Where (x, y, button)
	if x > 580 and x < 680 and y > 490 and y < 535 and button = 1 then        %button
	    health:=3                                                             %variable health now equals 3
	    Heart:=0                                                              %variable heart now equals 0
	    exit                                                                  %exit loop
	elsif x > 585 and x < 665 and y > 445 and y < 480 and button = 1 then     %button        
	    Window.Close (winID)                                                  %closes window
	    Music.PlayFileStop                                                    %The music file being played will stop
	    finished := true
	    break
	end if
    end loop
end gameover

%Procedure for gamewin
%proc gamewin
    %Pic.Draw (background, 0, 0, picCopy)                                          %Background for gamewin screen
    %Draw.Text ("You Win!", 445, 700, font, blue)                                  %Game Title
	%Draw.Text ("Menu", 530, 350, font2, 12)                                   %Menu button text
	%Draw.Text ("Quit", 545, 270, font2, 12)                                   %Quit button text
%end gamewin

%************************Procedure for Main Game Code ***************
proc game
    loop 
	Input.KeyDown (key)
	Mouse.Where (x, y, button)
	cls                                                                                                                       %Clears screen
	Pic.Draw (map1 (2), 0, 0, picCopy)                                                                                        %Draws picture of map1
	if key (chr (32)) and whatdotcolor (xx, yy + 70) = 9 or key (chr (32)) and whatdotcolor (xx+45, yy + 70)  = 9 then        %If space bar is clicked and image is in front of color 9 then
	exit                                                                                                                      %Exit loop
	end if
	movement                                                                                                                  %Calls procedure movement
	replenish                                                                                                                 %Calls procedure replenish
	highJump                                                                                                                  %Calls procedure Jump
	Health                                                                                                                    %Calls procedure Health
	SpeedUp                                                                                                                   %Calls procedure Speedup
	Pic.Draw (map1 (1), 0, 0, picCopy)                                                                                        %Draws picture of map1
	Health                                                                                                                    %Calls procedure Health
	replenish                                                                                                                 %Calls procedure replenish
	highJump                                                                                                                  %Calls procedure Jump
	SpeedUp                                                                                                                   %Calls procedure Speedup
	Pic.Draw (gamePause, 15, 840, picMerge)                                                                                   %Draws picture of pause button
	Pic.Draw (ninja, xx, yy, picMerge)                                                                                        %Draws picture of ninja
	View.Update
	delay (50)                                                                                                                %Delay for .05 of a second
	if health = 0 then                                                                                                        %If health reaches zero then 
	    cls                                                                                                                   %Clears the screen
	    Window.Close (winID)                                                                                                  %Closes window
	    winID := Window.Open ("graphics:1200;900")                                                                            %Opens window with resolution of 1200 pixels by 900 pixels
	    gameover                                                                                                              %Calls procedure gameover
	elsif x > 15 and x < 65 and y > 840 and y < 890 and button = 1 then
	    delay (50)                                                                                                            %Delay for .05 of a second
	    cls                                                                                                                   %Clears the screen
	    Window.Close (winID)                                                                                                  %Closes window
	    winID := Window.Open ("graphics:1200;900")                                                                            %Opens window with resolution of 1200 pixels by 900 pixels
	    Pause                                                                                                                 %Calls procedure pause
	end if
    end loop
end game
