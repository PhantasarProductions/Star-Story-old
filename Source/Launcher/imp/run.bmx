Rem
/*
	Run the game
	
	
	
	
	(c) Jeroen P. Broks, 2015, All rights reserved
	
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
*/


Version: 15.06.27

End Rem
Strict
'Import "framework.bmx"
Import "LoadGame.bmx"

Global crashf$ = Dirry("$AppSupport$/StarStoryLauncherCrash")
JCR6CrashError = True

Type TSystemFile
	Field Panel:TGadget
	Field Load:TGadget
	Field Del:TGadget
	Field File$
	End Type
	
Global LSystemFile:TList = New TList
	
Function CreateSystemFile(File$,Description$,Explain$)
Local SF:TSystemFile = New tsystemfile
sf.panel = CreatePanel(0,0,ClientWidth(window),ClientHeight(window),window)
CreateLabel "The ~q"+Description+"~q has been found.~n~n"+Explain+"~n~nDo you wish to load or delete this file?",0,0,TW,TH/2,sf.panel
sf.Load = CreateLabel("Load",(tw/2)-200,th/2,200,25,sf.panel)
sf.del  = CreateLabel("Delete",(tw/2)-200,th/2,200,25,sf.panel)
HideGadget sf.panel
sf.File = File
End Function

CreateSystemFile "Emergency Save","Emergency Save","Perhaps you did not properly quit the game last time you played. Maybe there was an error in the game? Or a total OS crash? Or did you have a power malfunction? Or did you just forget to shutdown the game? Anyway here we got an emergency save so maybe you can load it to recover some unsaved data."
CreateSystemFile "Quite Game","Save upon quitting","Last time you quit the game (maybe in a hurry) and you left this savegame."

Function SystemFilesCheck()
Local ShowPanel:TGadget = Tabber
For Local SF:TSystemfile = EachIn lsystemfile
	If FileType(Dirry(Save)+"/System/"+sf.file) And tabber=ShowPanel ShowPanel=sf.panel
	If eid=event_gadgetaction
		Select ESource
	 		Case sf.Load	LoadGame	Dirry(Save)+"/System/"+sf.file
			Case sf.del		DeleteFile	Dirry(Save)+"/System/"+sf.file
			End Select
		EndIf	
	sf.panel.setshow showpanel=sf.panel
	tabber.setshow showpanel=tabber	
	Next	
End Function


' Main
showpanel 0
Repeat
If FileType(crashf)
	DeleteFile crashf
	Bye
	EndIf
PollEvent
eid = EventID()
esource = TGadget(EventSource())
SystemFilesCheck
Select eid
	Case event_AppTerminate,event_windowclose
		Bye
	Case event_gadgetaction
		If esource=tabber
			cpanel = SelectedGadgetItem(esource)
			showpanel cpanel		
			EndIf
	Case event_gadgetpaint
		allowcanvas = True		
	End Select	
Flow
Forever
