--[[
  Sleep.lua
  Version: 16.02.26
  Copyright (C) 2016 Jeroen Petrus Broks
  
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
-- @IF IGNOREME
StatusResistance = {}      
StatusDrawFighter = {}     
-- @FI


-- StatusResistance.Sleep = 'Sleep'
StatusResistance.Sleep = 'Will'
StatusExpireOnAttack.Sleep = true

function StatusDrawFighter.Sleep(g,i)
local ch = Fighters[g][i].Tag
local w,h,er,al = ({

                  Hero = function()
                         return 0,64,({10000,25000,100000})[skill] ,0    -- First value used to be 32. I place this comment as a reminder in case I need that.
                         end,
                  Foe  = function()
                         return Image.Width("O"..Fighters.Foe[i].Tag),Image.Height("O"..Fighters.Foe[i].Tag),({10000000,25000,5000})[skill],1
                         end 
                })[g]()
-- ZZZ
setfont("SaveName")
Red()
local x,y = FighterCoords(g,i)
Image.DText("Z",x+w,y-h,al,1) 
White()               
-- Prevent wear off effect while entering moves (no I won't allow cheating) :-P 
for ag,aia in pairs(Fighters) do
    for ai,ad in pairs(aia) do
        if ad.Gauge==10000 then return end
        end
    end                    
-- Get off the gauge
if Fighters[g][i].Gauge>=10000 then RepCancel(g,i) end
Fighters[g][i].Gauge=-1000
end
