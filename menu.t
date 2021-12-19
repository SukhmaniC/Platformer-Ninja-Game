%*************************************Variables*******************************
var winID : int
var gametitle : int
var arrowinstruction : int
var teleporterinstruction : int
var jumpinstruction : int
var healthheartinstructions : int
var speedupinstructions : int
var spikes : int
var spikeball : int
var x, y, button : int
var finished : boolean := false

%*************************************Pictures**********************************
gametitle := Pic.FileNew ("gametitle.bmp")                             %background title picture of menu
arrowinstruction := Pic.FileNew ("arrowkeysinstruction.bmp")           %arrow keys picture for instructions
teleporterinstruction := Pic.FileNew ("teleporterinstruction.bmp")     %teleporter for picture instructions
jumpinstruction := Pic.FileNew ("jump.bmp")                            %jump-up picture for instructions
healthheartinstructions := Pic.FileNew ("healthinstructions.bmp")      %Picure of replenish power-up for instructions
spikes := Pic.FileNew ("spike3.bmp")                                   %spikes picture for instructions
spikeball := Pic.FileNew ("spikeballinstructions.bmp")                 %spikeball picture for instructions
speedupinstructions := Pic.FileNew ("speed-upinstructions.bmp")                   %speed-up picture for instructions




%********************************Transperancy Code*******************************
Pic.SetTransparentColor (arrowinstruction, white)                      %Makes all white pixels of image transparent
Pic.SetTransparentColor (teleporterinstruction, white)                 %Makes all white pixels of image transparent
Pic.SetTransparentColor (jumpinstruction, white)                       %Makes all white pixels of image transparent
Pic.SetTransparentColor (healthheartinstructions, white)               %Makes all white pixels of image transparent
Pic.SetTransparentColor (spikes, white)                                %Makes all white pixels of image transparent
Pic.SetTransparentColor (spikeball, white)                             %Makes all white pixels of image transparent
Pic.SetTransparentColor (speedupinstructions, white)                              %Makes all white pixels of image transparent


%************************************Fonts***************************************
var font : int := Font.New ("Sanserif:60:bold")
var font2 : int := Font.New ("Sanserif:50:bold")
var font3 : int := Font.New ("Sanserif:17:bold")
var font4 : int := Font.New ("Sanserif:30:bold")
var font5 : int := Font.New ("Sanserif:30:bold")

% Creates Window
winID := Window.Open ("graphics:1200;900")                             %opens window with resolution of 1200 pixels by 900 pixels


%*****************************************PROCEDURES**********************************************
%Procedure for instructions
proc instructions
    %pictures (instructions)
    Pic.Draw (gametitle, 0, 0, picCopy)
    Pic.Draw (arrowinstruction, 300, 620, picMerge)
    Pic.Draw (teleporterinstruction, 870, 480, picMerge)
    Pic.Draw (jumpinstruction, 520, 370, picMerge)
    Pic.Draw (healthheartinstructions, 10, 370, picMerge)
    Pic.Draw (speedupinstructions, 260, 260, picMerge)
    Pic.Draw (spikes, 700, -100, picMerge)
    Pic.Draw (spikeball, 1070, 270, picMerge)
    %Title(instructions)
    Draw.Text ("Welcome to Ninja Jump", 270, 800, font2, blue)
    %Character Control (instructions)
    Draw.Text ("Use the arrow keys to move", 550, 700, font3, black)
    Draw.Text ("left, right or to jump", 600, 670, font3, black)
    %Teleporter (instructions)
    Draw.Text ("To teleport stand in front of the", 500, 580, font3, black)
    Draw.Text ("teleporter and press space", 530, 550, font3, black)
    %Power-up (instructions)
    Draw.Text ("Power-ups", 240, 440, font3, black)
    Draw.Text ("Replenish (Restores character health)", 100, 410, font3, black)
    Draw.Text ("High Jump (boosts character jump)", 100, 380, font3, black)
    Draw.Text ("Speed Up (speeds character movement)", 100, 350, font3, black)
    %Obstacle (instructions)
    Draw.Text ("Avoid the obstacles by jumping over them ", 600, 310, font3, black)
    Draw.Text ("You will lose health everytime you come in ", 600, 280, font3, black)
    Draw.Text ("contact with them. The game is over once you", 600, 250, font3, black)
    Draw.Text ("run out of health", 600, 220, font3, black)
    %Objective (instructions)
    Draw.Text ("Objective", 540, 100, font4, blue)
    Draw.Text ("Your goal is to reach the end of each level and then use the portal to go to", 210, 70, font3, black)
    Draw.Text ("the next level until you complete all levels and then you will have won", 210, 40, font3, black)
    %exit button text (instructions)
    Draw.Text ("Go Back", 30, 835, font4, 12)
    Draw.Text ("Quit", 30, 20, font4, 12)

    loop
	Mouse.Where (x, y, button)
	if x > 30 and x < 190 and y > 835 and y < 865 and button = 1 then            %Button
	    exit                                                                     %Exit loop once button has been clicked
	elsif x > 40 and x < 120 and y > 15 and y < 120 and button = 1 then          %Button
	    Window.Close (winID)                                                     %Closes window
	    Music.PlayFileStop                                                       %The music file being played will stop
	    finished := true
	    break
	end if
    end loop
end instructions

%Music
process Music1                                                                       %A process to run music
    loop
	Music.PlayFile ("Title.mp3")
	exit when finished = true
    end loop
end Music1

%Procedure for menu
proc menu
    %Background picture
    Pic.Draw (gametitle, 0, 0, picCopy)
    %Text for Menu
    Draw.Text ("Ninja jump", 410, 700, font, 12)                                     %Game Title
    Draw.Text ("Play", 550, 350, font, white)                                         %Play button text
    Draw.Text ("Quit", 550, 150, font, white)                                         %Quit button text
    Draw.Text ("Instructions", 410, 250, font, white)                                 %Instructions button text

    loop
	Mouse.Where (x, y, button)
	if x > 550 and x < 710 and y > 330 and y < 410 and button = 1 then           %Button
	    exit                                                                     %Exit loop once button has been clicked
	elsif x > 410 and x < 865 and y > 240 and y < 310 and button = 1 then        %Button
	    exit                                                                     %Exit loop once button has been clicked
	elsif x > 550 and x < 710 and y > 140 and y < 210 and button = 1 then        %Button
	    Window.Close (winID)                                                     %closes window
	    Music.PlayFileStop                                                       %The music file being played will stop
	    finished := true
	    break
	end if        
    end loop
end menu




loop
    fork Music1                                                                      %Plays the music
    menu                                                                             %calls the menu procedure
    Mouse.Where (x, y, button)
    if x > 550 and x < 710 and y > 330 and y < 410 and button = 1 then               %button
	exit                                                                         %exit loop once button has been clicked
    elsif x > 410 and x < 865 and y > 240 and y < 310 and button = 1 then            %button
	loop
	    instructions                                                             %calls procedure instructions
	    if x > 30 and x < 190 and y > 835 and y < 865 and button = 1 then        %button
		exit                                                                 %exit loop once button has been clicked
	    end if
	end loop
    end if
end loop

%Next level
include "map1.t"                                                                     %include the map1.t file
