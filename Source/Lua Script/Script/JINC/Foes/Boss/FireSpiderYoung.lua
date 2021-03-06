--[[
**********************************************
  
  FireSpiderYoung.lua
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
 
version: 16.09.12
]]


-- Version 16.09.11



Data = {
	Name = "Young Fire Spider",
	Desc = "Not as dangerous as it's\nfully mature form, but still \na threat!",
	ImageFile = "Boss/FireSpiderYoung.png",
	AI = "Default",
	Boss = true,
	EleRes_Fire = 6,
	EleRes_Wind = 3,
	EleRes_Water = 3,
	EleRes_Earth = 3,
	EleRes_Frost = 1,
	EleRes_Lightning = 3,
	EleRes_Light = 2,
	EleRes_Dark = 5,
	EleRes_Healing = 6,
	EleRes_DarkHealing = 5,
	Stat = {
		["Strength"] = {489,500},
		["Defense"] = {187,188},
		["Will"] = {291,293},
		["Resistance"] = {198,199},
		["Agility"] = {475,481},
		["Accuracy"] = {81,87},
		["Evasion"] = {39,42},
		["HP"] = {20000,20100},
		["AP"] = {0,0},
		["LevelRange"] = {200,222},
},
	StatusResistance = {
		["Poison"] = 100   --[[ #1 ]],
		["Paralysis"] = 100   --[[ #2 ]],
		["Disease"] = 100   --[[ #3 ]],
		["Will"] = 10   --[[ #4 ]],
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


Data.ActMinLevel["Sys.Attack"] = 0		for ak=1,10 do table.insert(Data.Acts,"Sys.Attack") end
Data.ActMinLevel["Abl.ABL_EXHURU_KAKSI"] = 200		for ak=1,5 do table.insert(Data.Acts,"Abl.ABL_EXHURU_KAKSI") end
Data.ActMinLevel["Abl.ABL_EXHURU_KOLME"] = 400		for ak=1,5 do table.insert(Data.Acts,"Abl.ABL_EXHURU_KOLME") end
Data.ActMinLevel["Abl.ABL_EXHURU_KUUSI"] = 800		for ak=1,5 do table.insert(Data.Acts,"Abl.ABL_EXHURU_KUUSI") end
Data.ActMinLevel["Abl.ABL_FOE_CAPTUREWEB"] = 200		for ak=1,2 do table.insert(Data.Acts,"Abl.ABL_FOE_CAPTUREWEB") end
Data.ActMinLevel["Abl.ABL_FOE_DEATH"] = 200		for ak=1,1 do table.insert(Data.Acts,"Abl.ABL_FOE_DEATH") end
Data.ActMinLevel["Abl.ABL_FOE_EXPDRAIN"] = 200		for ak=1,1 do table.insert(Data.Acts,"Abl.ABL_FOE_EXPDRAIN") end
Data.ActMinLevel["Abl.ABL_FOE_FEAR"] = 200		for ak=1,1 do table.insert(Data.Acts,"Abl.ABL_FOE_FEAR") end
Data.ActMinLevel["Abl.ABL_FOE_FULLHEALTH"] = 800		for ak=1,1 do table.insert(Data.Acts,"Abl.ABL_FOE_FULLHEALTH") end
Data.ActMinLevel["Abl.ABL_FOE_HORROR"] = 300		for ak=1,1 do table.insert(Data.Acts,"Abl.ABL_FOE_HORROR") end
Data.ActMinLevel["Abl.ABL_FOE_IDDQD"] = 800		for ak=1,1 do table.insert(Data.Acts,"Abl.ABL_FOE_IDDQD") end
Data.ActMinLevel["Abl.ABL_FOE_LICKYOURWOUNDS"] = 200		for ak=1,1 do table.insert(Data.Acts,"Abl.ABL_FOE_LICKYOURWOUNDS") end
temp = { ITM='ITM_PHAN_LEVELAPPLE', LVL=100, VLT=false }
for ak=1,100 do table.insert(Data.ItemDrop ,temp) end
for ak=1,100 do table.insert(Data.ItemSteal,temp) end


return Data
