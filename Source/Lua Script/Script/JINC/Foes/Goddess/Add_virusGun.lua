--[[
**********************************************
  
  Add_virusGun.lua
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
 
version: 16.08.02
]]


-- Version 16.08.02



Data = {
	Name = "Virus Gun",
	Desc = "---",
	ImageFile = "Goddess/Add_virusGun.png",
	AI = "Default",
	Boss = true,
	EleRes_Fire = 5,
	EleRes_Wind = 5,
	EleRes_Water = 5,
	EleRes_Earth = 5,
	EleRes_Frost = 5,
	EleRes_Lightning = 5,
	EleRes_Light = 5,
	EleRes_Dark = 5,
	EleRes_Healing = 5,
	EleRes_DarkHealing = 5,
	Stat = {
		["Strength"] = {0,0},
		["Defense"] = {0,0},
		["Will"] = {0,0},
		["Resistance"] = {0,0},
		["Agility"] = {0,20},
		["Accuracy"] = {0,0},
		["Evasion"] = {0,0},
		["HP"] = {5,5},
		["AP"] = {0,0},
		["LevelRange"] = {1,100},
},
	StatusResistance = {
		["Poison"] = 100   --[[ #1 ]],
		["Paralysis"] = 100   --[[ #2 ]],
		["Disease"] = 100   --[[ #3 ]],
		["Will"] = 100   --[[ #4 ]],
		["Block"] = 100   --[[ #5 ]],
		["Death"] = 100   --[[ #6 ]],
		["Damned"] = 100   --[[ #7 ]],
	},
	Acts = {}, -- Data itself defined below
	ActMinLevel = {}, -- Data itself defined below
	ItemDrop = {}, -- Data itself defined below
	ItemSteal = {} -- Data itself definded below
}


local temp


Data.ActMinLevel["Abl.ARM_VIRUSBOMB"] = 1		for ak=1,100 do table.insert(Data.Acts,"Abl.ARM_VIRUSBOMB") end
temp = { ITM='ITM_EQP_GARNET', LVL=250, VLT=false }
for ak=1,255 do table.insert(Data.ItemSteal,temp) end


return Data
