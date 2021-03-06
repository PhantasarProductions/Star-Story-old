--[[
  BoxText.lua
  Version: 16.08.15
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
-- @UNDEF BOXTEXTDEBUG

boxtextroutine = true
piccorner = Image.Load("GFX/BoxText/Corner.png")
picup     = Image.Load("GFX/BoxText/Top.png")
picside   = Image.Load("GFX/BoxText/Side.png")

portret = {}

btdata    = {}

function RemoveData(file) btdata[file] = nil end

function ProcessBLine(Rec,Prefix,DLine)
local Processes = {
    ["ERROR"] = function() Sys.Error("Unknown scenario prefix") end,
    ["!"] = function(Rec,DLine) Rec.Header = DLine end,
    ["*"] = function(Rec,DLine) Rec.PicDir = DLine end,
    [":"] = function(Rec,DLine) Rec.PicSpc = DLine end,
    ["%"] = function(Rec,DLine) Rec.AltTxtFont = "Fonts/"..DLine..".ttf"; CSay("Font: "..DLine)  end,
    ["#"] = function(Rec,DLine) table.insert(Rec.Lines,DLine) end,
    ["-"] = function() end
    }
local P = Processes[Prefix]
if not P then Sys.Error("Unknown scenario prefix - "..Prefix) end
P(Rec,DLine)    
end

function LoadData(file,loadas,merge)
local lang = Var.C("$LANG")
local LineNumber,Line
local crap = JCR6ListFile("Languages/"..lang.."/Scenario/"..file)
local ret = {}
local section = "[rem]"
local L
local Prefix,DLine,WorkRec
if merge then ret = btdata[loadas or file] or {} end
CSay("Loading BoxText Data: "..file)
for LineNumber,Line in ipairs(crap) do
    L = Str.Trim(Line)
    if L~="" then
       if left(L,1)=="[" and right(L,1=="]") then
          section = L
       else
          -- The select statement below is provided through the pre-processor built in the GALE system.
          -- @SELECT section
          -- @CASE   "[rem]"
          -- @CASE   "[tags]"
             ret[L] = {}
          -- @CASE   "[scenario]"
             Prefix = left(L,1)
             DLine = right(L,len(L)-1)
             -- CSay("ReadLine: "..L.." >> Prefix: "..Prefix) -- Debug line.
             if (not WorkRec) and Prefix~="@" and Prefix~="-" then Sys.Error("Trying to assign data, while no boxtext record has yet been created","Line,"..LineNumber) end
             if Prefix=="@" then
                WorkRec = { Lines = {} }
                table.insert(ret[DLine],WorkRec)                
             else
                ProcessBLine(WorkRec,Prefix,DLine)   
                end
          -- @DEFAULT
             Sys.Error("Unknown language section: "..section,"Line,"..LineNumber)   
          -- @ENDSELECT          
          end
       end
    end
-- Load Images
local k,i,tag,rec
local picfile,picref
for k,tag in pairs(ret) do for i,rec in pairs(tag) do
     picfile = "GFX/Portret/"..sval(rec.PicDir).."/"..sval(rec.PicSpc)..".png"
     picref = upper(rec.PicDir).."."..upper(rec.PicSpc)
     if Image.Exist(picref)==0 and JCR6.Exists(picfile)==1 then 
        Image.AssignLoad(picref,picfile) 
        portret[picref]=true 
        CSay('Loaded '..picfile..' on '..picref.." (BoxText)") 
     elseif Image.Exist(picref)~=0 then
        portret[picref]=true
        end
     if portret[picref] then rec.PicRef=picref; end 
     end end
-- closure
btdata[loadas or file] = ret    
-- print(serialize("btdata",btdata)) -- Debug Line, must be on rem in release
end

-- This empty function serves to pick up undefined background routines.
function BoxTextBackGround()
end

function ShowBox(data,boxback,highlight)
local bb = boxback or "BOXTEXT.KTHURA" -- "BOXTEXT"
local ret
-- @IF BOXTEXTDEBUG
CSay("Calling BoxTextBackGround from MS script: "..bb)
-- @FI
MS.Run(bb,"BoxTextBackGround")
-- @IF BOXTEXTDEBUG
DarkText("background: "..bb,10,400,2,0)
-- @FI
setfont("BoxText")
local fh = Image.TextHeight("TEST")
local bh = (fh * #data.Lines) + (fh)
local startx = 750-data.width
local starty = 600-bh
local bstarty = (starty - 20) - Image.Height(piccorner)
local ak,av,ac
local mx,my = MouseCoords()
-- @IF BOXTEXTDEBUG
White()
Image.NoFont()
Image.DText("startxy = ("..startx..","..starty..")",0,0)
Image.DText("bstarty = "..bstarty,0,fh)
Image.DText("showtext = ("..data.SL..","..data.SP.."); total lines = "..#data.Lines,0,fh*2)
Image.DText("picref = "..sval(data.PicRef),0,fh*3)
local dbg_py = -999
if data.PicRef then dbg_py = 600-Image.Height(data.PicRef) end
Image.DText("pic-y = "..dbg_py,0,fh*4)
Image.DText("boxback = "..bb,0,fh*5)
ac=0
for ak,av in pairs(data) do
    ac = ac + 1
    Image.DText(ak.." = "..sval(av),700,fh*ac,1,0)
    end
-- @FI
Image.Color(0,0,0)
Image.Rect(0,bstarty,800,600-bstarty)
White()
Image.Draw(piccorner,0,bstarty)
Image.Color(255,255,255)
Image.ViewPort(40,bstarty,800,3)
Image.Tile(picup,40,0)
Image.ViewPort(0,bstarty+19,19,600-bstarty)
Image.Tile(picside,0,0)
Image.ViewPort(0,0,800,600)
-- Portrait
White();
if data.PicRef then
   -- @IF BOXTEXTDEBUG
   Image.DText(data.PicRef,0,600-Image.Height(data.PicRef))
   -- @FI
   Image.Draw(data.PicRef,0,600-Image.Height(data.PicRef))
   end
-- Header
Red()
setfont("BoxText")
Image.DText(Var.S(data.Header),startx,starty-20)
--print(serialize("boxtext",data))
-- Text itself
local ax,ay,y
if data.AltTxtFont then
   -- @IF BOXTEXTDEBUG
   CSay("Setting font: "..data.AltTxtFont,fonts.BoxText[2])
   -- @FI
   Image.Font(data.AltTxtFont,fonts.BoxText[2])
   else
   setfont("BoxText")
   end
for ay=1,#data.Lines do
    y = (ay-1)*fh
    if highlight and my>starty+y and my<starty+y+fh then 
      ret=ay
       LightBlue()
    elseif highlight then
      Image.Color(0,0,180)
    else 
       LightBlue()
       end
    if ay<data.SL then
       Image.DText(data.Lines[ay],startx,starty+y)
    elseif ay==data.SL then
       Image.DText(left(data.Lines[ay],data.SP),startx,starty+y)
       end
    end
if data.SL<=#data.Lines then
   data.SP = data.SP + 1
   if data.SP>string.len(data.Lines[data.SL]) then data.SP=1 data.SL=data.SL+1 end
   -- print(serialize("data",data)) -- Debug only!!!
   end    
return ret   
end


function RunBoxText(file,tag,idx,boxback)
setfont("BoxText")
local f = btdata[file]
if not f then Sys.Error("Boxtext file "..file.." has not yet been loaded!") end
local t = f[tag]
if not t then Sys.Error("Boxtext file "..file.." has no tag called "..tag) end
local rec = t[idx]
if not rec then Sys.Error("Boxtext file "..file.." tag "..tag.." does not have a record #"..idx.." (max is "..#t..")") end
local sb_data = { Header = rec.Header, PicDir = rec.PicDir, PicSpc = rec.PicSpc, Lines = {}, SL = 1, SP=1, AltTxtFont = rec.AltTxtFont }
local width=700 -- standard width, this can be shortened by the portraits popping with the textbox
local ak,txt,cline,spline
local aw,word
local continue
if rec.PicRef then
   width = width - Image.Width(rec.PicRef)   
   end
if rec.AltTxtFont then
   CSay("Setting font: "..rec.AltTxtFont,fonts.BoxText[2])
   Image.Font(rec.AltTxtFont,fonts.BoxText[2])
   else
   setfont("BoxText")
   end   
for ak,txt in ipairs(rec.Lines) do
    cline = ""
    spline = mysplit(Var.S(txt)," ")
    for aw,word in ipairs(spline) do
        if Image.Textwidth(cline..word)>width then
           table.insert(sb_data.Lines,cline)
           cline = ""
           end
        cline = cline .. word .. " "   
        end
    if cline~="" then table.insert(sb_data.Lines,cline) end    
    end
sb_data.width=width    
sb_data.PicRef=rec.PicRef
INP.Grab()
repeat
INP.Grab()
ShowBox(sb_data,boxback)
Flip()
if mousehit(1) then
     if sb_data.SL>#sb_data.Lines then 
        continue=true
     else
         sb_data.SL=#sb_data.Lines+1
     end
end     
until continue -- mousehit(1)
end

function SerialBoxText(file,ptag,boxback)
-- @IF BOXTEXTDEBUG
CSay('SerialBoxText("'..file..'","'..ptag..'","'..sval(boxback)..'");')
-- @FI
local a = GetActive()
if a~="" and RPGChar.CharExists(a)~=0 then Var.D("$CURRENTCHARNAME",RPGChar.GetName(a)) end
local tag = upper(ptag or '*TAGLESS*')
local f = btdata[file]
if not f then Sys.Error("Boxtext file "..file.." has not yet been loaded!") end
local t = f[tag]
if not t then Sys.Error("Boxtext file "..file.." has no tag called "..tag) end
local ak
for ak=1,#t do RunBoxText(file,tag,ak,boxback) end
end

function RunQuestion(file,tag,pidx,boxback)
local chosen=nil
local idx=pidx or 1
local f = btdata[file]
local width = 700
if not f then Sys.Error("Boxtext file "..file.." has not yet been loaded!") end
local t = f[tag]
if not t then Sys.Error("Boxtext file "..file.." has no tag called "..tag) end
local rec = t[idx]
if not rec then Sys.Error("Boxtext file "..file.." tag "..tag.." does not have a record #"..idx.." (max is "..#t..")") end
local sb_data = { Header = rec.Header, PicDir = rec.PicDir, PicSpc = rec.PicSpc, Lines = rec.Lines, SL = 1, SP=1, AltTxtFont = rec.AltTxtFont }
if rec.AltTxtFont then
   CSay("Setting font: "..rec.AltTxtFont..","..fonts.BoxText[2])
   Image.Font(rec.AltTxtFont,fonts.BoxText[2])
  else
   setfont("BoxText")
   end   
if rec.PicRef then
   width = width - Image.Width(rec.PicRef)   
   end
sb_data.width=width    
sb_data.PicRef=rec.PicRef
INP.Grab()
repeat
INP.Grab()
chosen = ShowBox(sb_data,boxback or "BOXTEXT.KTHURA",true)
ShowMouse()
Flip()
until mousehit(1) and chosen
Var.D("%RET",chosen)
CSay("Chosen: "..sval(chosen))
return chosen
end
