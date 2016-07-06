--[[
**********************************************
  
  Vulpina - Sewers.lua
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
 
version: 16.07.06
]]

-- @USE /Script/Use/Maps/Gen/Next.lua

function Boss()
   if Done("&DONE.SECRETDUNGEON.SEWERS") then return end
   TurnPlayer('West')
   MapText('ALIVE1')
   Maps.Obj.Obj('Frank').TextureFile='GFX/Actors/SinglePic/Sewers/MadScientistHU.png'
   MapText('ALIVE2')
   Maps.Kill("Frank",1)
   Maps.Kill("Monster",1)
   Sys.Error('Boss Event itself not yet scripted')
end

function GALE_OnLoad()
   Music("Dungeon/Prisoner of War.ogg")
   ZA_Enter('Boss',Boss)
end   
