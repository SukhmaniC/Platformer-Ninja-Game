setscreen ("graphics:1200;900")%opens window with resolution of 1200 pixels by 900 pixels

%var background:int
background := Pic.FileNew ("background.bmp") 
%var font2 : int := Font.New ("Sanserif:50:bold")
%var font : int := Font.New ("Sanserif:60:bold")

proc gamewin
    Pic.Draw (background, 0, 0, picCopy) %Background for pause screen
    Draw.Text ("You Win!", 445, 700, font, white) %Game Title
end gamewin

gamewin
