--[[
**********************************************
  
  Excalibur_Transport.lua
  (c) Jeroen Broks, 2016, All Rights Reserved.
  
  This file contains material that is related 
  to a storyline that is which is strictly
  copyrighted to Jeroen Broks.
  
  This file may only be used in an unmodified
  form with an unmodified version of the 
  software this file belongs to.
  
  You may use this file for your study to see
  how I solved certain things in the creation
  of this project to see if you find valuable
  leads for the creation of your own.
  
  Mostly this file comes along with a project
  that is for most part released under an
  open source license and that means that if
  you use that code with this file removed
  from it, you can use it under that license.
  Please check out the other files to find out
  which license applies.
  This file comes 'as-is' and in no possible
  way the author can be held responsible of
  any form of damages that may occur due to 
  the usage of this file
  
  
 **********************************************
 
version: 16.08.25
]]
function GetMapLocks(d)
   d.access = { ['#001']=true}
   for i=1,19 do
      local a = i + 1
      local idk,ida = "#"..right('00'..i,3),"#"..right('00'..(a),3)
      -- CSay(serialize('Onzin',d))
      d.access[ida] = d.keys[idk] and d.keys[idk].RED
   end
end

function TransferVarsFromMap()
   local getmapdata = loadstring(Var.C('$EXCALIBURTRANSPORT'))
   data = getmapdata()
   GetMapLocks(data)
end

function MAIN_FLOW()
  -- Defs
  local x,y,a
  local mx,my = MouseCoords()
  local hover=nil
  -- Clear Screen
  Image.Cls()
  -- Rooms
  SetFont('ExFinal')
  for i=1,20 do
      a = '#'..right('00'..i,3)
      if i<=10 then
         x=0; y=i*15
      else
         x=400; y=(i-10)*15
      end
      if data.access[a] then
        if mx>x and mx<x+400 and my>y and my<y+12 then hover=a end
        if hover==a and a==Maps.LayerCodeName then 
           Image.Color(255,255,0)
        elseif hover==a then
           Image.Color(0,255,255)
        elseif a==Maps.LayerCodeName then
           Image.Color(255,180,0)
        else
           Image.Color(0,180,255)
        end
        Image.DText(data.locs[a] or 'Unnamed area '..a,x,y)
      --[[               
      else        
        Image.Color(80,80,80)
        Image.DText('# Area Locked #',x,y)
      ]]  
      end  
  end
  -- Confirm
  if INP.MouseH(1)==1 and hover then
     CSay("Let's go "..sval(hover))
     Schedule('MAP','Trans_GOTO',hover)
     Var.D('$EXCAL_IWANTTOGOTO',hover)
     LAURA.FLOW('FIELD')
     MS.Destroy('EXCATRANS')
  end
  -- Show Party
  ShowParty()
  -- Mouse
  ShowMouse()
  -- Debug
  DarkText('('..mx..","..my..'); Hover: '..sval(hover),200,350,0,0,180,0,255) -- debug line. Should be disabled in stable build.
  -- Flip    
  Flip()
end

function GALE_OnLoad()
end
