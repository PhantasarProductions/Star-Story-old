--[[
**********************************************
  
  astrilopup.lua
  (c) Jeroen Broks, 2015, 2016, All Rights Reserved.
  
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
 
version: 16.09.12
]]


-- Version 16.09.11



Data = {
	Name = "Astrilopup Gunner",
	Desc = "An Astrilopup with a photon gun.\nBut how did it ever get such a gun?",
	ImageFile = "Reg/astrilopup.png",
	AI = "Default",
	Boss = false,
	EleRes_Fire = 3,
	EleRes_Wind = 3,
	EleRes_Water = 3,
	EleRes_Earth = 3,
	EleRes_Frost = 2,
	EleRes_Lightning = 3,
	EleRes_Light = 3,
	EleRes_Dark = 3,
	EleRes_Healing = 6,
	EleRes_DarkHealing = 0,
	Stat = {
		["Strength"] = {5,20000},
		["Defense"] = {1,30000},
		["Will"] = {1,20000},
		["Resistance"] = {1,10000},
		["Agility"] = {10,5000},
		["Accuracy"] = {10,100},
		["Evasion"] = {1,5},
		["HP"] = {25,60000},
		["AP"] = {10,70000},
		["LevelRange"] = {1,10000},
},
	StatusResistance = {
		["Poison"] = 70   --[[ #1 ]],
		["Paralysis"] = 40   --[[ #2 ]],
		["Disease"] = 10   --[[ #3 ]],
		["Will"] = 0   --[[ #4 ]],
		["Block"] = 39   --[[ #5 ]],
		["Death"] = 70   --[[ #6 ]],
		["Damned"] = 100   --[[ #7 ]],
	},
	Acts = {}, -- Data itself defined below
	ActMinLevel = {}, -- Data itself defined below
	ItemDrop = {}, -- Data itself defined below
	ItemSteal = {} -- Data itself definded below
}


local temp


Data.ActMinLevel["Sys.Attack"] = 1		for ak=1,100 do table.insert(Data.Acts,"Sys.Attack") end
Data.ActMinLevel["Abl.ABL_EXHURU_BATTLECRY"] = 0		for ak=1,10 do table.insert(Data.Acts,"Abl.ABL_EXHURU_BATTLECRY") end
Data.ActMinLevel["Abl.ABL_FOE_PHOTON"] = 1		for ak=1,100 do table.insert(Data.Acts,"Abl.ABL_FOE_PHOTON") end
Data.ActMinLevel["Abl.ABL_FOE_TASER"] = 50		for ak=1,1 do table.insert(Data.Acts,"Abl.ABL_FOE_TASER") end
temp = { ITM='ITM_ADHBANDAGE', LVL=1, VLT=false }
for ak=1,5 do table.insert(Data.ItemDrop ,temp) end
for ak=1,5 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_ANTIDOTE', LVL=2, VLT=false }
for ak=1,10 do table.insert(Data.ItemDrop ,temp) end
for ak=1,5 do table.insert(Data.ItemSteal,temp) end
Data.ActMinLevel["Abl.ITM_BANDAGE"] = 15		for ak=1,1 do table.insert(Data.Acts,"Abl.ITM_BANDAGE") end
temp = { ITM='ITM_BANDAGE', LVL=20, VLT=false }
for ak=1,5 do table.insert(Data.ItemDrop ,temp) end
for ak=1,5 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_BLUBAFLOWER', LVL=1, VLT=false }
for ak=1,10 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_EQP_EMERALD', LVL=60, VLT=false }
for ak=1,2 do table.insert(Data.ItemDrop ,temp) end
for ak=1,3 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_GUBAFLOWER', LVL=15, VLT=false }
for ak=1,5 do table.insert(Data.ItemSteal,temp) end
Data.ActMinLevel["Abl.ITM_HEALINGCAPSULE"] = 50		for ak=1,1 do table.insert(Data.Acts,"Abl.ITM_HEALINGCAPSULE") end
temp = { ITM='ITM_HEALINGCAPSULE', LVL=8, VLT=false }
for ak=1,3 do table.insert(Data.ItemDrop ,temp) end
for ak=1,1 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_SPORES', LVL=3, VLT=false }
for ak=1,3 do table.insert(Data.ItemDrop ,temp) end
for ak=1,3 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_THUNDER_DIAMOND', LVL=50, VLT=false }
for ak=1,1 do table.insert(Data.ItemDrop ,temp) end
for ak=1,8 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_VLUGZOUT', LVL=5, VLT=false }
for ak=1,5 do table.insert(Data.ItemDrop ,temp) end
for ak=1,5 do table.insert(Data.ItemSteal,temp) end


return Data
