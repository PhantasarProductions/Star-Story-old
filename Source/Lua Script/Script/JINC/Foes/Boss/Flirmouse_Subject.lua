--[[
  Flirmouse_Subject.lua
  Version: 16.09.12
  Copyright (C) 2015, 2016 Jeroen Petrus Broks
  
  ===========================
  This file is part of a project related to the Phantasar Chronicles or another
  series or saga which is property of Jeroen P. Broks.
  This means that it may contain references to a story-line plus characters
  which are property of Jeroen Broks. These references may only be distributed
  along with an unmodified version of the game. 
  
  As soon as you remove or replace ALL references to the storyline or character
  references, or any termology specifically set up for the Phantasar universe,
  or any other univers a story of Jeroen P. Broks is set up for,
  the restrictions of this file are removed and will automatically become
  zLib licensed (see below).
  
  Please note that doing so counts as a modification and must be marked as such
  in accordance to the zLib license.
  ===========================
  zLib license terms:
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
]]


-- Version 16.09.11



Data = {
	Name = "Flirmouse Subject",
	Desc = "Serve the Flirmouse king. \nKilling it might kill the king as well.",
	ImageFile = "Boss/Flirmouse_Subject.png",
	AI = "Default",
	Boss = true,
	EleRes_Fire = 2,
	EleRes_Wind = 5,
	EleRes_Water = 3,
	EleRes_Earth = 0,
	EleRes_Frost = 4,
	EleRes_Lightning = 1,
	EleRes_Light = 1,
	EleRes_Dark = 5,
	EleRes_Healing = 6,
	EleRes_DarkHealing = 0,
	Stat = {
		["Strength"] = {0,200},
		["Defense"] = {0,70},
		["Will"] = {0,400},
		["Resistance"] = {0,50},
		["Agility"] = {0,100},
		["Accuracy"] = {0,1000},
		["Evasion"] = {0,30},
		["HP"] = {0,3000},
		["AP"] = {0,0},
		["LevelRange"] = {1,100},
},
	StatusResistance = {
		["Poison"] = 60   --[[ #1 ]],
		["Paralysis"] = 100   --[[ #2 ]],
		["Disease"] = 100   --[[ #3 ]],
		["Will"] = 5   --[[ #4 ]],
		["Block"] = 100   --[[ #5 ]],
		["Death"] = 60   --[[ #6 ]],
		["Damned"] = 30   --[[ #7 ]],
	},
	Acts = {}, -- Data itself defined below
	ActMinLevel = {}, -- Data itself defined below
	ItemDrop = {}, -- Data itself defined below
	ItemSteal = {} -- Data itself definded below
}


local temp


Data.ActMinLevel["Sys.Attack"] = 1		for ak=1,1 do table.insert(Data.Acts,"Sys.Attack") end
temp = { ITM='ITM_MOLOTOV', LVL=1, VLT=false }
for ak=1,100 do table.insert(Data.ItemDrop ,temp) end
for ak=1,20 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_PHAN_LEVELAPPLE', LVL=120, VLT=false }
for ak=1,120 do table.insert(Data.ItemDrop ,temp) end
for ak=1,120 do table.insert(Data.ItemSteal,temp) end
temp = { ITM='ITM_ROCK', LVL=1, VLT=false }
for ak=1,100 do table.insert(Data.ItemDrop ,temp) end
for ak=1,40 do table.insert(Data.ItemSteal,temp) end


return Data
