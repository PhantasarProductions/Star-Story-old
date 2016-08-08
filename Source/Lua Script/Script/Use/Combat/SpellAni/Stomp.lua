--[[
  Stomp.lua
  Version: 16.08.05
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
-- @IF IGNORE
SpellAni={}
-- @FI

function SpellAni.Stomp(ActG,ActT,TarG,TarT)
     local vuist = Image.Load('GFX/Combat/SpellAni/Stomp/Fist.png')
     Image.HotCenter(vuist)
     for size=0,200 do
         DrawScreen()
         Image.ScalePC(size,size)
         Image.Show(vuist,400,300)
         Image.ScalePC(100,100)
         Flip()
     end
     if JCR6.Exists('Audio/SFX/Scenario/Reggie_Crash.ogg') then SFX("Audio/SFX/Scenario/Reggie_Crash.ogg") end
end


-- @IF IGNORE
return SpellAni
-- @FI