Rem
	Launcher - Star Story
	Version catcher
	
	
	
	(c) Jeroen P. Broks, 2015, 2016, All rights reserved
	
		This program is free software: you can redistribute it and/or modify
		it under the terms of the GNU General Public License as published by
		the Free Software Foundation, either version 3 of the License, or
		(at your option) any later version.
		
		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		GNU General Public License for more details.
		You should have received a copy of the GNU General Public License
		along with this program.  If not, see <http://www.gnu.org/licenses/>.
		
	Exceptions to the standard GNU license are available with Jeroen's written permission given prior 
	to the project the exceptions are needed for.
Version: 16.08.23
End Rem
Strict
Import "framework.bmx"
Import tricky_units.Dirry
Import tricky_units.identify

Global VRPanel:TGadget = AddPanel("Versions",New TversionsPanel)

MKL_Version "LAURA II - Versions.bmx","16.08.23"
MKL_Lic     "LAURA II - Versions.bmx","GNU General Public License 3"

Type TVersionsPanel Extends tfpanelbase

	Field made
	Field ID:TID
	Field launcherdump:TGadget
	Field laura2dump:TGadget
	Field jcrdump:TGadget
	
	Method Flow()
	Local engineexe$
	If made Return
	made = True
	Local platform$,syscommand$
	id = LoadID(JCR,"ID/Identify")
	If Not id Notify "ERROR: No ID data found"; Bye
	Local BT:TStream = WriteFile(Dirry("$AppSupport$/$LinuxDot$Phantasar Productions/LAURA2/LAURA2run.ini"))	
	WriteLine BT,"Var:VersionOnly=Yes"
	WriteLine Bt,"Var:CodeName=StarStory"
	CloseFile BT
	?MacOS
	platform = "Mac"
	'syscommand = "open ~q"+lini.c("Mac")+"~q"
	syscommand = "~q"+lini.c("Mac")+"~q/Contents/MacOS/"+StripAll(lini.c("Mac"))+"~q"
	engineexe = lini.c("Mac")
	?Win32
	platform = "Windows"
	syscommand = "~q"+lini.c("Windows")+"~q"
	engineexe = lini.c("Windows")
	?Linux
	platform = "Linux"
	syscommand = "~q"+lini.c("Linux")+"~q"
	engineexe = lini.c("Linux")
	?
	engineexe = Replace(engineexe,"\ "," ")
	system_ syscommand	
	Local vdumpfile$ = Dirry("$AppSupport$/$LinuxDot$Phantasar Productions/LAURA2/VersionDump.txt")
	If FileType(vdumpfile)<>1 Notify "No version dump from LAURA II received. ~n~n"+vdumpfile+"~n~nEngine broken or non-existent?"; Bye
	Print FileType(vdumpfile)+"> Reading: "+vdumpfile
	Local lauraversiondump$ = LoadString(vdumpfile)
	Local lauraversion$ = "???"
	Local vd$[] = lauraversiondump.split("~n")
	Local ss$[]
	For Local s$=EachIn vd
		ss=s.split(":")
		'Print s+" >>> "+ss[0]
		If Trim(ss[0])="Version" And Len(ss)>=2
			lauraversion = Trim(ss[1])
			EndIf
		Next		
	CreateLabel "Star Story",0,0,300,25,panel
	CreateLabel "Game version:",0,25,300,25,panel
	CreateLabel id.Get("Version"),300,25,300,25,panel
	CreateLabel "Game main file: ",0,50,300,25,panel
	jcrdump = CreateTextField( 300,50,300,25,panel ); SetGadgetText jcrdump,Lini.c("Resource")
	CreateLabel "Launcher version: ",0,75,300,25,panel
	CreateLabel MKL_NewestVersion(),300,75,300,25,panel
	CreateLabel "Launcher source version dump:",0,100,300,25,panel
	launcherdump = CreateTextArea(300,100,300,100,panel,textarea_readonly); SetGadgetText launcherdump,MKL_GetAllversions(); SetGadgetFont launcherdump,LookupGuiFont(GUIFONT_MONOSPACED,10)
	CreateLabel "LAURA II version: ",0,200,300,15,panel
	CreateLabel lauraversion,300,200,300,15,panel
	CreateLabel "LAURA II source version dump:",0,225,300,25,panel
	laura2dump = CreateTextArea(300,225,300,100,panel,textarea_readonly); SetGadgetText laura2dump,lauraversiondump; SetGadgetFont laura2dump,LookupGuiFont(GUIFONT_MONOSPACED,10)
	?Not MacOS
	AddTextAreaText laura2dump,"~n~nLAURA II executable: "+engineexe
	?MacOS
	AddTextAreaText laura2dump,"~n~nLAURA II app bundle: "+engineexe
	?
	CreateLabel "Star Story has been written by Jeroen P. Broks",0,400,700,25,panel
	CreateLabel "It's been copyrighted by Jeroen P. Broks",0,425,700,25,panel
	CreateLabel "The story and its characters are property of Jeroen P. Broks and may only be",0,450,700,25,panel
	CreateLabel "be freely distributed with an unmodified copy of the game.",0,475,700,25,panel
	CreateLabel "The launcher is (stripped from all references to the story or characters) licensed under the GNU GPL",0,500,700,25,panel
	CreateLabel "The LAURA II engine is licensed under the GNU GPL",0,525,700,25,panel
	CreateLabel "The script files are (stripped from all references to the story or characters) licensed under the GNU GPL or zlib license",0,550,700,25,panel
	CreateLabel "(Check the script files themselves for the actual license as this may differ per file!)",0,575,700,25,panel
	End Method

	End Type
