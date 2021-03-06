--[[
**********************************************
  
  CyberAstrilopup.lua
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
 
version: 16.11.12
]]


-- Version 16.11.12



Data = {
	Name = "Cyber-Astrilopup",
	Desc = "It's slow, but you DON'T want it to hit you!",
	ImageFile = "Reg/CyberAstrilopup.png",
	AI = "Default",
	EleRes_Fire = 3,
	EleRes_Wind = 3,
	EleRes_Water = 3,
	EleRes_Earth = 3,
	EleRes_Frost = 3,
	EleRes_Lightning = 3,
	EleRes_Light = 3,
	EleRes_Dark = 3,
	EleRes_Healing = 6,
	EleRes_DarkHealing = 5,
	Stat = {
		["Strength"] = {1000,2000},
		["Defense"] = {0,0},
		["Will"] = {0,0},
		["Resistance"] = {0,0},
		["Agility"] = {30,90},
		["Accuracy"] = {10000,12000},
		["Evasion"] = {5,10},
		["HP"] = {2000,5000},
		["AP"] = {0,0},
		["LevelRange"] = {80,120},
},
	StatusResistance = {
		["Poison"] = 100   --[[ #1 ]],
		["Paralysis"] = 85   --[[ #2 ]],
		["Disease"] = 100   --[[ #3 ]],
		["Will"] = 5   --[[ #4 ]],
		["Block"] = 90   --[[ #5 ]],
		["Death"] = 35   --[[ #6 ]],
		["Damned"] = 100   --[[ #7 ]],
	},
	Acts = {}, -- Data itself defined below
	ActMinLevel = {}, -- Data itself defined below
	ItemDrop = {}, -- Data itself defined below
	ItemSteal = {} -- Data itself definded below
}


local temp


Data.ActMinLevel["Sys.Attack"] = 0		for ak=1,100 do table.insert(Data.Acts,"Sys.Attack") end
Data.ActMinLevel["Abl.ARM_BIOHAZARD"] = 1		for ak=1,10 do table.insert(Data.Acts,"Abl.ARM_BIOHAZARD") end
Data.ActMinLevel["Abl.ARM_DART"] = 1		for ak=1,80 do table.insert(Data.Acts,"Abl.ARM_DART") end
Data.ActMinLevel["Abl.ARM_FLAMETHROWER"] = 1		for ak=1,70 do table.insert(Data.Acts,"Abl.ARM_FLAMETHROWER") end
Data.ActMinLevel["Abl.ARM_HEALINGSPRAY"] = 1		for ak=1,50 do table.insert(Data.Acts,"Abl.ARM_HEALINGSPRAY") end
Data.ActMinLevel["Abl.ARM_ICEBULLET"] = 1		for ak=1,30 do table.insert(Data.Acts,"Abl.ARM_ICEBULLET") end
Data.ActMinLevel["Abl.ARM_MINICANNON"] = 1		for ak=1,10 do table.insert(Data.Acts,"Abl.ARM_MINICANNON") end
Data.ActMinLevel["Abl.ARM_MULTIBLAST"] = 1		for ak=1,5 do table.insert(Data.Acts,"Abl.ARM_MULTIBLAST") end
Data.ActMinLevel["Abl.ARM_POISONDART"] = 1		for ak=1,5 do table.insert(Data.Acts,"Abl.ARM_POISONDART") end
Data.ActMinLevel["Abl.ARM_STUN_GUN"] = 1		for ak=1,5 do table.insert(Data.Acts,"Abl.ARM_STUN_GUN") end
Data.ActMinLevel["Abl.ARM_VIRUSBOMB"] = 1		for ak=1,5 do table.insert(Data.Acts,"Abl.ARM_VIRUSBOMB") end
temp = { ITM='ITM_PHAN_LEVELAPPLE', LVL=800, VLT=false }
for ak=1,80 do table.insert(Data.ItemDrop ,temp) end
for ak=1,80 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_SHOT', LVL=80, VLT=false }
for ak=1,20 do table.insert(Data.ItemDrop ,temp) end
for ak=1,50 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_STEROIDS', LVL=20, VLT=false }
for ak=1,20 do table.insert(Data.ItemDrop ,temp) end
for ak=1,20 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_SUPERCAPSULE', LVL=40, VLT=false }
for ak=1,80 do table.insert(Data.ItemDrop ,temp) end
for ak=1,80 do table.insert(Data.ItemSteal,temp) end


return Data
