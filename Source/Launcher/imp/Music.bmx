Rem
	Music.bmx
	Controls the music for the launcher
	
	
	
	(c) Jeroen P. Broks, 2016, All rights reserved
	
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
Version: 16.03.07
End Rem
Strict

Import brl.freeaudioaudio
Import brl.oggloader
?win32
Import brl.directsoundaudio
?

Import "JCRFile.bmx"


Private
Const Music_Debug = False
Global Music:TSound
Global channel:TChannel
Public


If music_debug Notify "Let's check if we can do music!"

If JCR_Exists(JCR,"Music/launcher/launcher.ogg") 
	music = LoadSound(JCR_B(JCR,"Music/launcher/launcher.ogg"),SOUND_LOOP)
	If music And music_debug Notify "We got music"
	If Not music Then Notify "Loading music failed"
Else
	If music_debug Notify "We got no music"
	EndIf





Function StartMusic()
If music channel = PlaySound(music)
End Function


Function stopmusic()
If music And channel StopChannel channel
End Function



StartMusic
