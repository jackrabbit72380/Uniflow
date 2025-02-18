#Region
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Run_AU3Check=n
#AutoIt3Wrapper_Tidy_Stop_OnError=n
#AutoIt3Wrapper_UseX64=n
#pragma
#AutoIt3Wrapper_Allow_Decompile=n
#EndRegion

#NoTrayIcon

#include <WindowsConstants.au3>
#include <Constants.au3>
#include <GuiConstants.au3>
#include <Misc.au3>
#include <Array.au3>
#include <WinAPI.au3>
#include <GuiConstantsEx.au3>
#include <Color.au3>
#include <GDIPlus.au3>
#include <File.au3>
#include <StaticConstants.au3>
#include <ButtonConstants.au3>
#include <Sound.au3>
#include <InetConstants.au3>
#include <StringConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <GuiListView.au3>
#include <array.au3>
#include <Date.au3>
#include <Timers.au3>
#include <WinAPISys.au3>
#include <MsgBoxConstants.au3>
#include <ProgressConstants.au3>
#include <GuiButton.au3>
#include <APIGdiConstants.au3>
#include <FontConstants.au3>
#include <IE.au3>
#include <TabConstants.au3>
#include <Math.au3>
#include <APISysConstants.au3>
#include <GUIImageList.au3>
#include <APIGdiConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>

#include <GIFAnimation.au3>

Global Const $tagBITMAPINFOHEADER = "struct; dword biSize;long biWidth;long biHeight;word biPlanes;word biBitCount;" & _
"dword biCompression;dword biSizeImage;long biXPelsPerMeter;long biYPelsPerMeter;" & _
"dword biClrUsed;dword biClrImportant; endstruct"

#include <WinAPIGdi.au3>

HotKeySet('{Esc}', '_Exit')
;_______________________________________________________________________________________________IrrlichtPluginUtils ___________________________________________________________________________________;
Dim $TempFolder
$TempFolder = _TempFile()
DirCreate($TempFolder)
FileSetAttrib($TempFolder, "+H")
#AutoIt3Wrapper_plugin_funcs= SetCameraAsKeyEventReceiver, CreateDevice, SetViewPort, SetWindowCaption, CreateDeviceOnWindow, CreateLayeredDevice, SetFog, GetMesh, RecalculateNormals, CreateMeshWelded, SetVertexColorAlpha, ScaleMesh, AddHillPlaneMesh, AddTerrainMesh, GetQ3Shader, GetPosition, GetAbsolutePosition, GetRotation, AddEmptySceneNode, AddBillboardSceneNode, AddMeshSceneNode, AddAnimatedMeshSceneNode, AddOctTreeSceneNode, AddWaterSurfaceSceneNode, AddTerrainSceneNode, AddSkyBoxSceneNode, AddCubeSceneNode, AddSphereSceneNode, AddChild, CreateCollisionResponseAnimator, SetWorld, SetGravity, CreateFlyCircleAnimator, CreateRotationAnimator, CreateFlyStraightAnimator, AddAnimator, RemoveAnimator, RemoveAnimators, DropAnimator, CreateOctTreeTriangleSelector, CreateTerrainTriangleSelector, CreateTriangleSelector, SetTriangleSelector, GetSceneNodeFromCameraBB, GetSceneNodeFromRayBB, GetSceneNodeFromScreenCoordinatesBB, AddMaterial, GetMaterial, GetMaterialCount, SetMaterial, SetNodeMaterial, SetAmbientColor, SetDiffuseColor, SetSpecularColor, SetEmissiveColor, ScaleTexture, SetMaterialFlag, SetMaterialType, SetMD2Animation, SetAnimationSpeed, SetMaterialTexture, SetVisible, AddCameraSceneNode, AddCameraSceneNodeFPS, AddCameraSceneNodeMaya, SetActiveCamera, GetActiveCamera, IrrRun, BeginScene, EndScene, SceneDraw, GuiDraw, AddZipFileArchive, SetLoopMode, SetPosition, SetRotation, SetRotationByAxis, SetRotationByTime, SetScale, SetTarget, SetUpVector, SetFarValue, AddLightSceneNode, SetLightData, AddNewSLight, SetSLightDirection, SetSLightAmbientColor, SetSLightDiffuseColor, SetSLightSpecularColor, SetSLightAttenuation, SetLightDirection, SetLightAmbientColor, SetLightDiffuseColor, SetLightSpecularColor, SetLightAttenuation, CreateImageFromFile, AddTexture, SetImageToTexture, GetTexture, CreateRenderTargetTexture, SetRenderTarget, AddStaticText, SetText, AddImage, SetShadowColor, RaiseTerrain, DeformMesh, DeformNode, BindTargetAndRotation, Remove, CreateBulletEngine, SetNodeToCollisionShape, DoBulletSimulation
#compiler_plugin_funcs = SetCameraAsKeyEventReceiver, CreateDevice, SetViewPort, SetWindowCaption, CreateDeviceOnWindow, CreateLayeredDevice, SetFog, GetMesh, RecalculateNormals, CreateMeshWelded, SetVertexColorAlpha, ScaleMesh, AddHillPlaneMesh, AddTerrainMesh, GetQ3Shader, GetPosition, GetAbsolutePosition, GetRotation, AddEmptySceneNode, AddBillboardSceneNode, AddMeshSceneNode, AddAnimatedMeshSceneNode, AddOctTreeSceneNode, AddWaterSurfaceSceneNode, AddTerrainSceneNode, AddSkyBoxSceneNode, AddCubeSceneNode, AddSphereSceneNode, AddChild, CreateCollisionResponseAnimator, SetWorld, SetGravity, CreateFlyCircleAnimator, CreateRotationAnimator, CreateFlyStraightAnimator, AddAnimator, RemoveAnimator, RemoveAnimators, DropAnimator, CreateOctTreeTriangleSelector, CreateTerrainTriangleSelector, CreateTriangleSelector, SetTriangleSelector, GetSceneNodeFromCameraBB, GetSceneNodeFromRayBB, GetSceneNodeFromScreenCoordinatesBB, AddMaterial, GetMaterial, GetMaterialCount, SetMaterial, SetNodeMaterial, SetAmbientColor, SetDiffuseColor, SetSpecularColor, SetEmissiveColor, ScaleTexture, SetMaterialFlag, SetMaterialType, SetMD2Animation, SetAnimationSpeed, SetMaterialTexture, SetVisible, AddCameraSceneNode, AddCameraSceneNodeFPS, AddCameraSceneNodeMaya, SetActiveCamera, GetActiveCamera, IrrRun, BeginScene, EndScene, SceneDraw, GuiDraw, AddZipFileArchive, SetLoopMode, SetPosition, SetRotation, SetRotationByAxis, SetRotationByTime, SetScale, SetTarget, SetUpVector, SetFarValue, AddLightSceneNode, SetLightData, AddNewSLight, SetSLightDirection, SetSLightAmbientColor, SetSLightDiffuseColor, SetSLightSpecularColor, SetSLightAttenuation, SetLightDirection, SetLightAmbientColor, SetLightDiffuseColor, SetLightSpecularColor, SetLightAttenuation, CreateImageFromFile, AddTexture, SetImageToTexture, GetTexture, CreateRenderTargetTexture, SetRenderTarget, AddStaticText, SetText, AddImage, SetShadowColor, RaiseTerrain, DeformMesh, DeformNode, BindTargetAndRotation, Remove, CreateBulletEngine, SetNodeToCollisionShape, DoBulletSimulation
Global $PluginHandle = PluginOpen(@ScriptDir &"\Au3Irrlicht.dll")

;video drivers
Global Const $EDT_NULL = 0
Global Const $EDT_SOFTWARE = 1
Global Const $EDT_BURNINGSVIDEO = 2
Global Const $EDT_DIRECT3D8 = 3
Global Const $EDT_DIRECT3D9 = 4
Global Const $EDT_OPENGL = 5

;material flags
Global Const $EMF_WIREFRAME = 0
Global Const $EMF_POINTCLOUD = 1
Global Const $EMF_GOURAUD_SHADING = 2
Global Const $EMF_LIGHTING = 3
Global Const $EMF_ZBUFFER = 4
Global Const $EMF_ZWRITE_ENABLE = 5
Global Const $EMF_BACK_FACE_CULLING = 6
Global Const $EMF_BILINEAR_FILTER = 7
Global Const $EMF_TRILINEAR_FILTER = 8
Global Const $EMF_ANISOTROPIC_FILTER = 9
Global Const $EMF_FOG_ENABLE = 10
Global Const $EMF_NORMALIZE_NORMALS = 11
Global Const $EMF_TEXTURE_WRAP = 12
Global Const $EMF_ENVIRONMENT_MAPPING = 13

;material types
Global Const $EMT_SOLID = 0
Global Const $EMT_SOLID_2_LAYER = 1
Global Const $EMT_LIGHTMAP = 2
Global Const $EMT_LIGHTMAP_ADD = 3
Global Const $EMT_LIGHTMAP_M2 = 4
Global Const $EMT_LIGHTMAP_M4 = 5
Global Const $EMT_LIGHTMAP_LIGHTING = 6
Global Const $EMT_LIGHTMAP_LIGHTING_M2 = 7
Global Const $EMT_LIGHTMAP_LIGHTING_M4 = 8
Global Const $EMT_DETAIL_MAP = 9
Global Const $EMT_SPHERE_MAP = 10
Global Const $EMT_REFLECTION_2_LAYER = 11
Global Const $EMT_TRANSPARENT_ADD_COLOR = 12
Global Const $EMT_TRANSPARENT_ALPHA_CHANNEL = 13
Global Const $EMT_TRANSPARENT_ALPHA_CHANNEL_REF = 14
Global Const $EMT_TRANSPARENT_VERTEX_ALPHA = 15
Global Const $EMT_TRANSPARENT_REFLECTION_2_LAYER = 16
Global Const $EMT_NORMAL_MAP_SOLID = 17
Global Const $EMT_NORMAL_MAP_TRANSPARENT_ADD_COLOR = 18
Global Const $EMT_NORMAL_MAP_TRANSPARENT_VERTEX_ALPHA = 19
Global Const $EMT_PARALLAX_MAP_SOLID = 20
Global Const $EMT_PARALLAX_MAP_TRANSPARENT_ADD_COLOR = 21
Global Const $EMT_PARALLAX_MAP_TRANSPARENT_VERTEX_ALPHA = 22
Global Const $EMT_ONETEXTURE_BLEND = 23
Global Const $EMT_FORCE_32BIT = 24

;md2 animations
Global Const $EMAT_STAND = 0
Global Const $EMAT_RUN = 1
Global Const $EMAT_ATTACK = 2
Global Const $EMAT_PAIN_A = 3
Global Const $EMAT_PAIN_B = 4
Global Const $EMAT_PAIN_C = 5
Global Const $EMAT_JUMP = 6
Global Const $EMAT_FLIP = 7
Global Const $EMAT_SALUTE = 8
Global Const $EMAT_FALLBACK = 9
Global Const $EMAT_WAVE = 10
Global Const $EMAT_POINT = 11
Global Const $EMAT_CROUCH_STAND = 12
Global Const $EMAT_CROUCH_WALK = 13
Global Const $EMAT_CROUCH_ATTACK = 14
Global Const $EMAT_CROUCH_PAIN = 15
Global Const $EMAT_CROUCH_DEATH = 16
Global Const $EMAT_DEATH_FALLBACK = 17
Global Const $EMAT_DEATH_FALLFORWARD = 18
Global Const $EMAT_DEATH_FALLBACKSLOW = 19
Global Const $EMAT_BOOM = 20

;q3shaders enum values
Global Const $E_Q3_MESH_GEOMETRY = 0
Global Const $E_Q3_MESH_ITEMS = 1
Global Const $E_Q3_MESH_BILLBOARD = 2
Global Const $E_Q3_MESH_SIZE = 3

;enum irr::scene::E_TERRAIN_PATCH_SIZE - enumeration for patch sizes specifying the size of patches in the TerrainSceneNode
Global Const $ETPS_9 = 9
Global Const $ETPS_17 = 17
Global Const $ETPS_33 = 33
Global Const $ETPS_65 = 65
Global Const $ETPS_129 = 129

;enum SLight type
Global Const $ELT_POINT = 0
Global Const $ELT_SPOT = 1
Global Const $ELT_DIRECTIONAL = 2

;float cnstants
Global Const $PI = 3.14159265359
Global Const $HALF_PI = $PI / 2.0
Global Const $PI64 = 3.1415926535897932384626433832795028841971693993751
Global Const $RADTODEG = 180.0 / $PI
Global Const $RADTODEG64 = 180.0 / $PI64
Global Const $RECIPROCAL_PI = 1.0 / $PI
Global Const $RECIPROCAL_PI64 = 1.0 / $PI64
Global Const $ROUNDING_ERROR_32 = 0.000001
Global Const $ROUNDING_ERROR_64 = 0.00000001

;_______________________________________________________________________________________________INITIALISATION_______________________________________________________________________________________________;
; Declare and initialize variables
Local $compare[2], $Cover_Distance = 70, $Cover_Position[1], $Centred_Game, $camVi = 0, $icolor_red = 0, $icolor_green = 0, $icolor_blue = 0, $ModeFlow = 1, _
$Gamer_count = 0, $Games_Result = 0, $_Move = 0, $Titel = "Uniflow", $backgroundTexture1, $backgroundTexture2, $backgroundTexture3

Local $Y = 0

; Define arrays to store data related to game covers or other graphical elements
Dim $Cover[1][2], $Cover_Back[1], $Cover_reflet[1], $Cover_refletLeft[1], $Cover_refletRight[1], $Cover_SideLeft[1], $Cover_SideRight[1], $Cover_SideTop[1], $Cover_Name[1], $ListArray[1][2]

; Install (copy) image files from the script directory to a temporary folder
;FileInstall("case_top.png", $TempFolder & "\\case_top.png", 1)
;FileInstall("case_right.png", $TempFolder & "\\case_right.png", 1)
;($Theme_dir & "\" & $Theme & "\case_right.png")
;FileInstall("settings.png", $TempFolder & "\\settings.png", 1)
;FileInstall("exit.png", $TempFolder & "\\exit.png", 1)
;FileInstall("skins.png", $TempFolder & "\\skins.png", 1)
;FileInstall("colors.png", $TempFolder & "\\colors.png", 1)
;FileInstall("flowmodes.png", $TempFolder & "\\flowmodes.png", 1)
;FileInstall("themes.png", $TempFolder & "\\themes.png", 1)

; Comment out these lines as the corresponding files are not included; You may inclue these files to turn on ambiant lights.
;FileInstall("ambientlight.png", $TempFolder & "\\ambientlight.png", 1)
;FileInstall("ambientlight2.png", $TempFolder & "\\ambientlight2.png", 1)
;FileInstall("ambientlight3.png", $TempFolder & "\\ambientlight3.png", 1)

; Define global constants representing various file paths or directories
Global Const $INI = @ScriptDir & "\Config.ini"
Global Const $FullCover_dir = @ScriptDir & "\\Covers"
Global Const $Cache_dir = @ScriptDir & "\\Covers\\Cache"
Global Const $Gamer_dir = @TempDir & "\\Games"
Global Const $Theme_dir = @ScriptDir & "\\Interface\\Themes"
Global Const $Apps_dir = @ScriptDir & "\\Apps"

;===============================================================================
Local $TempFolder = @TempDir

FileInstall("GUI\settings.png", $TempFolder & "\settings.png", 1)
FileInstall("GUI\exit.png", $TempFolder & "\exit.png", 1)
FileInstall("GUI\skins.png", $TempFolder & "\\skins.png", 1)
FileInstall("GUI\colors.png", $TempFolder & "\\colors.png", 1)
FileInstall("GUI\flowmodes.png", $TempFolder & "\\flowmodes.png", 1)
FileInstall("GUI\themes.png", $TempFolder & "\\themes.png", 1)
;===============================================================================
Global $Language = IniRead($INI, "GUI", "Language", "")
Global $IniLanguage = @ScriptDir&"\GUI\Language.ini"

Global $datemonth,$dateday,$lbhour,$lbhourampm,$lbhourampmfix, $NumberResult
Global 	$monthNames[13]
		$monthNames[1]=IniRead($IniLanguage, $Language, "January", "")
		$monthNames[2]=IniRead($IniLanguage, $Language, "February", "")
		$monthNames[3]=IniRead($IniLanguage, $Language, "March", "")
		$monthNames[4]=IniRead($IniLanguage, $Language, "April", "")
		$monthNames[5]=IniRead($IniLanguage, $Language, "May", "")
		$monthNames[6]=IniRead($IniLanguage, $Language, "June", "")
		$monthNames[7]=IniRead($IniLanguage, $Language, "July", "")
		$monthNames[8]=IniRead($IniLanguage, $Language, "August", "")
		$monthNames[9]=IniRead($IniLanguage, $Language, "September", "")
		$monthNames[10]=IniRead($IniLanguage, $Language, "October", "")
		$monthNames[11]=IniRead($IniLanguage, $Language, "November", "")
		$monthNames[12]=IniRead($IniLanguage, $Language, "December", "")

;my background theme STARTS! here!;_______________________________________________________________________________________________________________________________________
  ; Read configuration
    $configFile = @ScriptDir & "\config.ini"
    ;If Not FileExists($INI) Then ErrorMsg("config.ini file not found in " & @ScriptDir)
    ; Read theme name from config.ini
    $themeName = IniRead($INI, "GUI", "Theme", "")
    ;If $themeName = "" Then ErrorMsg("Failed to read theme name from [GUI] section in config.ini file.")
    ; Construct theme directory path
Global $themeDir = @ScriptDir & "\interface\themes\" & $themeName & "\"
Global $IniTheme = $themeDir & "theme.ini"
    ;If Not FileExists($IniTheme) Then ErrorMsg("theme.ini file not found in " & $themeDir)
; Read theme name from Config.ini
Global $configFile = "Config.ini"
Global $themeName = IniRead($INI, "GUI", "Theme", "")
Global Const $musicFile = "interface\themes\" & $themeName & "\music.mp3"

Global $GameNameSize = IniRead($IniTheme, "TEXTE", "GameName-Size", "")

Global $GameNameFont = IniRead($IniTheme, "TEXTE", "GameName-Font", "")
Global $GameNumberFont = IniRead($IniTheme, "TEXTE", "GameNumber-Font", "")
Global $AlphabetGameNameFont = IniRead($IniTheme, "TEXTE", "AlphabetGameName-Font", "")

If FileExists($themeDir & "fonts\" & $GameNameFont & ".ttf") Then
   _WinAPI_AddFontResourceEx($themeDir & "fonts\" & $GameNameFont & ".ttf", $FR_PRIVATE) ; load font
EndIf

If FileExists($themeDir & "fonts\" & $GameNumberFont & ".ttf") Then
   _WinAPI_AddFontResourceEx($themeDir & "fonts\" & $GameNumberFont & ".ttf", $FR_PRIVATE) ; load font
EndIf

If FileExists($themeDir & "fonts\" & $AlphabetGameNameFont & ".ttf") Then
   _WinAPI_AddFontResourceEx($themeDir & "fonts\" & $AlphabetGameNameFont & ".ttf", $FR_PRIVATE) ; load font
EndIf
 ;--------------------------------------------------------------------------------------------------------
If FileExists($themeDir & "Music.wav") Then
   Global $SoundMusic = $themeDir & "Music.wav"
ElseIf FileExists($themeDir & "Music.mp3") Then
   Global $SoundMusic = $themeDir & "Music.mp3"
EndIf
 ;--------------------------------------------------------------------------------------------------------
If FileExists($themeDir & "\Startup.mp3") Then
    Global $soundstartup = $themeDir & "\Startup.mp3"
Else
    If FileExists(@ScriptDir & "\Interface\sound\default\Startup.mp3") Then
        Global $soundstartup = @ScriptDir & "\Interface\sound\default\Startup.mp3"
    EndIf
 EndIf
 ;-------------------------------------------------------------------------------------------------------
If FileExists($themeDir & "\Show.mp3") Then
    Global $soundshow = $themeDir & "\Show.mp3"
Else
    If FileExists(@ScriptDir & "\Interface\sound\default\Show.mp3") Then
        Global $soundshow = @ScriptDir & "\Interface\sound\Show.mp3"
    EndIf
 EndIf
 ;--------------------------------------------------------------------------------------------------------
If FileExists($themeDir & "\Hide.mp3") Then
    Global $soundhide = $themeDir & "\Hide.mp3"
Else
    If FileExists(@ScriptDir & "\Interface\sound\default\Hide.mp3") Then
        Global $soundhide = @ScriptDir & "\Interface\sound\Hide.mp3"
    EndIf
EndIf
 ;--------------------------------------------------------------------------------------------------------
If FileExists($themeDir & "\Exit.mp3") Then
    Global $soundExit = $themeDir & "\Exit.mp3"
Else
    If FileExists(@ScriptDir & "\Interface\sound\default\Exit.mp3") Then
        Global $soundExit = @ScriptDir & "\Interface\sound\Exit.mp3"
    EndIf
 EndIf
 ;--------------------------------------------------------------------------------------------------------
If FileExists($themeDir & "\Click.mp3") Then
    Global $soundClick = $themeDir & "\Click.mp3"
Else
    If FileExists(@ScriptDir & "\Interface\sound\default\Click.mp3") Then
        Global $soundClick = @ScriptDir & "\Interface\sound\Click.mp3"
    EndIf
 EndIf
 ;--------------------------------------------------------------------------------------------------------
If FileExists($themeDir & "\Flip.wav") Then
   Global $SoundFlip = $themeDir & "\Flip.wav"
ElseIf FileExists($themeDir & "\Flip.mp3") Then
   Global $SoundFlip = $themeDir & "\Flip.mp3"
Else
   If FileExists(@ScriptDir&"\Interface\sound\Flip.mp3") Then
	  Global $SoundFlip = @ScriptDir&"\Interface\sound\Flip.mp3"
   Else
	  Global $SoundFlip = @ScriptDir&"\Interface\sound\Flip.wav"
   EndIf
EndIf
 ;--------------------------------------------------------------------------------------------------------
;this is where you can add constans for setup gui.

; ==========Create GUI
;GUICreate("Setup", 1280, 720)
;GUISetState(@SW_SHOW)

; ==========Register GDI+ library
;_GDIPlus_Startup()
;===========Load Theme image's
;===========Exit function
;Func OnAutoItExit()
; EndFunc

;my background theme code STOPS! here ;________________________________________________________________________________________________________________________________

;While 1
;    Switch GUIGetMsg()
;        Case $GUI_EVENT_CLOSE
;            ExitLoop
;    EndSwitch
;WEnd
;_______________________________________________________________________________________________________________________________________________________________________
; Check if certain directories exist, and Create! them if they don't
If FileExists(@ScriptDir & "\\Covers\\Cache") = 0 Then DirCreate(@ScriptDir & "\\Covers\\Cache")
If FileExists(@TempDir & "\\Games") = 0 Then DirCreate(@TempDir & "\\Games")
If FileExists(@ScriptDir & "\\Interface\\Themes") = 0 Then DirCreate(@ScriptDir & "\\Interface\\Themes")
If FileExists($Apps_dir) = 0 Then DirCreate($Apps_dir)

; Assign values to variables that might be used as function names or commands later
$ChooseApp = "ChooseApp"
$Redraw = "Redraw"

;_______________________________________________________________________________INI READ _______________________________________________________________________________

;This reads the "Theme" value from an ".ini" file specified by the $INI variable. If the value is -1 (i.e., not found), it writes "Default" as the default theme to the INI file.
Local $Theme = IniRead($INI, "Config", "Theme", -1)
;This constructs the directory path for the theme's INI file based on the $Theme value and the $Theme_dir variable.
If $Theme = -1 Then
	IniWrite($INI, "Config", "GUI", "Theme", "Theme")
	$Theme = "Theme"
EndIf
;This reads various color settings (e.g., GuiColor, GuiBorderColor, TitleColor, etc.) from the theme's INI file. If a setting is not found (-1), it writes a default value for that setting to the INI file.

;Bottom tool bar color
Local $GuiColor = IniRead($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "GuiColor", -1)
If $GuiColor = -1 Then
	IniWrite($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "GuiColor", "0x67686a")
	$GuiColor = "0x67686a"
EndIf
;Title -0xffffff is white
Local $GuiBorderColor = IniRead($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "GuiBorderColor", -1)
If $GuiBorderColor = -1 Then
	IniWrite($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "GuiBorderColor", "0xffffff")
	$GuiBorderColor = "0xffffff"
EndIf
;Title -0xffffff is white
Local $TitleColor = IniRead($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "TitleColor", -1)
If $TitleColor = -1 Then
	IniWrite($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "TitleColor", "0xffffff")
	$TitleColor = "0xffffff"
EndIf
;Title -0xffffff is white
Local $AlphabColor = IniRead($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "AlphabColor", -1)
If $AlphabColor = -1 Then
	IniWrite($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "AlphabColor", "0xffffff")
	$AlphabColor = "0xffffff"
EndIf
;File Format Title -0xffffff is white
Local $MenuBTColor = IniRead($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "MenuBTColor", -1)
If $MenuBTColor = -1 Then
	IniWrite($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "MenuBTColor", "0xffffff")
	$MenuBTColor = "0xffffff"
EndIf
;this is the coose app text on file format.-0xffffff is white
Local $SettingsBTColor = IniRead($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "SettingsBTColor", -1)
If $SettingsBTColor = -1 Then
	IniWrite($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "SettingsBTColor", "0xffffff")
	$SettingsBTColor = "0xffffff"
EndIf
;these are the file types in the file format menu eg:exe,xex,avi,mp4
Local $SettingsTxtColor = IniRead($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "SettingsTxtColor", -1)
If $SettingsTxtColor = -1 Then
	IniWrite($Theme_dir & "\" & $Theme & "\" & $Theme & ".ini", "Config", "SettingsTxtColor", "0xffffff")
	$SettingsTxtColor = "0xffffff"
 EndIf

;This reads the "FileFormat" value from the main INI file specified by $INI.
Local $Fileformat = IniRead($INI, "Config", "FileFormat", -1)

;This reads the "BackPic" from the main INI file.
Global $Background_Image = IniRead($INI, "Config", "BackPic", -1)

;This reads the "Background_Enabled" value - 1 for ON - 0 for OFF - from the main INI file.
Global $Background_Enabled = IniRead($INI, "Config", "Background_Image", -1)

Global $themeName = IniRead($INI, "GUI", "Theme", "")
If $Background_Enabled = 1 Then
    ; Background is enabled, (1) so read the background image path
    $Background_Image = IniRead($INI, "Config", "BackPic", "")
Else
    ; Background is disabled, set $Background_Image to the theme background
    ; Read theme name from config.ini
    $themeName = IniRead($INI, "GUI", "Theme", "")
    If $themeName = "" Then ErrorMsg("Failed to read theme name from [GUI] section in config.ini file.")
    ; Construct theme directory path
    Global $themeDir = @ScriptDir & "\interface\themes\" & $themeName & "\"
    Global $IniTheme = $themeDir & "theme.ini"
    If Not FileExists($IniTheme) Then ErrorMsg("theme.ini file not found in " & $themeDir)
    Local $Theme = IniRead($INI, "Config", "Theme", -1)
    Global $themeName = IniRead($configFile, "GUI", "Theme", "")
	;$Background_Image = _GDIPlus_ImageLoadFromFile($backgroundImage)

	; Add error handling if loading fails
    If @error Then
        MsgBox(16, "Error", "Failed to load background image!")
        Exit ; or handle the error gracefully
    EndIf

   EndIf

;This checks if another instance of "UniflowFlow" is already running using the _Singleton function. If an instance is already running, it displays a warning message and exits.
If _Singleton("Uniflow", 1) = 0 Then
	MsgBox(48 + 0, "Uniflow Warning", "An occurence of Uniflow is already running")
	Exit
EndIf
;This defines an enumeration for various image rotation/flip options, which may be used later in the script.
;===>_GDIPlus_ImageRotateFlip
Global Enum _
		$RotateNoneFlipNone = 0, _
		$Rotate90FlipNone = 1, _
		$Rotate180FlipNone = 2, _
		$Rotate270FlipNone = 3, _
		$RotateNoneFlipX = 4, _
		$Rotate90FlipX = 5, _
		$Rotate180FlipX = 6, _
		$Rotate270FlipX = 7, _
		$RotateNoneFlipY = 6, _
		$Rotate90FlipY = 7, _
		$Rotate180FlipY = 4, _
		$Rotate270FlipY = 5, _
		$RotateNoneFlipXY = 6, _
		$Rotate90FlipXY = 7, _
		$Rotate180FlipXY = 0, _
		$Rotate270FlipXY = 1

;_________________________________________________________________________Main GUI ___________________________________________________________________________________

UpdateTime()
AdlibRegister("UpdateTime", 1000)

_GDIPlus_Startup()

_splashscreen()

Opt('MouseCoordMode', 1)
$Main_Flow_gui = GUICreate($Titel, 1280, 800, -1, -1, $WS_POPUP, $WS_EX_LAYERED)

GUISetBkColor(0x000000, $Main_Flow_gui)
WinSetTrans($Main_Flow_gui, "", 255)

;$sound2 = _SoundOpen($soundstartup);---------------------------------------------------------------------------------------------------------------------------------------------BOOTSOUND
;_SoundPlay($sound2, 0x0)

GUICtrlCreateLabel('Uniflow', 0, 0, 1280, 40, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetFont(-1, 20, 800)

; GUI Creation
Global $Main_Flow_gui = GUICreate($Titel, 1280, 800, -1, -1, $WS_POPUP, $WS_EX_LAYERED)
Opt('MouseCoordMode', 0)
;$Main_Flow_gui = GUICreate($Titel, 1280, 800, -1, -1, $WS_POPUP, $WS_EX_LAYERED)

GUISetBkColor(0x000000, $Main_Flow_gui)
WinSetTrans($Main_Flow_gui, "", 255)

;;;GUICtrlCreateLabel('Uniflow', 0, 0, 1280, 40, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetFont(-1, 20, 800)

; Title Label Test
GUICtrlCreateLabel('Uniflow', 0, 0, 1280, 40, BitOR($SS_CENTER, $BS_CENTER), $GUI_WS_EX_PARENTDRAG)
GUICtrlSetFont(-1, 20, 800)

;Top Toolbar Label - this sets the background color for the top border 1 on 0 off
GUICtrlSetColor(-1, $GuiBorderColor)
GUICtrlSetBkColor(-1, $GuiColor)

; Bottom Toolbar Label- this sets the background color for the Bottom border 1 on 0 off
GUICtrlCreateLabel('', 0, 760, 1280, 40)
GUICtrlSetBkColor(-1, $GuiColor)
GUICtrlSetState(-1, $GUI_DISABLE)

; Settings Button
$Settings = GUICtrlCreatePic("", 10, 764, 32, 32)
_GUICtrlPic_SetImage($Settings, $TempFolder & "\settings.png")
GUICtrlSetCursor(-1, 0)

; Exit Button
$ExitButton = GUICtrlCreatePic("", 1240, 764, 32, 32)
_GUICtrlPic_SetImage($ExitButton, $TempFolder & "\Exit.png")
GUICtrlSetCursor(-1, 0)

; Skin Button
$SkinBT = GUICtrlCreatePic("", 60, 764, 32, 32)
_GUICtrlPic_SetImage($SkinBT, $TempFolder & "\skins.png")
GUICtrlSetCursor(-1, 0)

;Colors Button
$ColorsButton = GUICtrlCreatePic("", 110, 764, 32, 32)
_GUICtrlPic_SetImage($ColorsButton, $TempFolder & "\colors.png")
GUICtrlSetCursor(-1, 0)

;Flomode Button
$FlowmodeButton = GUICtrlCreatePic("", 160, 764, 32, 32)
_GUICtrlPic_SetImage($FlowmodeButton, $TempFolder & "\flowmodes.png")
GUICtrlSetCursor(-1, 0)

;Themes Button
$ThemesButton = GUICtrlCreatePic("", 210, 764, 32, 32)
_GUICtrlPic_SetImage($ThemesButton, $TempFolder & "\themes.png")
GUICtrlSetCursor(-1, 0)
;==========================================================================================================================================================;

$MainClientSize = WinGetClientSize($Main_Flow_gui)
$MainWinPos = WinGetPos($Main_Flow_gui, "")

Local $MainBorderLeft = (($MainWinPos[2] - $MainClientSize[0]) / 2)
Local $MainBorderTop = ($MainWinPos[3] - $MainClientSize[1] - (($MainWinPos[2] - $MainClientSize[0]) / 2)) + 30

GUISetBkColor(0x01, $Main_Flow_gui)
_WinAPI_SetLayeredWindowAttributes($Main_Flow_gui, 0x01, 0xFF, 0x03)

;_________________________________________________________________________ Device ___________________________________________________________________________

; Create Irrlicht 3D Scene Device
Global $device = CreateDeviceOnWindow($Main_Flow_gui, 4, 0, 40, 1280, 720, 32, 4, 4)

;$BackgroundCam = AddCameraSceneNode(0, 0, 0, 0--200, 0, 0, 0)
;Global $background = AddBillboardSceneNode($BackgroundCam,1280, 720)
;setPosition($background,0,0,105)
;SetMaterialTexture($background,0,GetTexture($TempFolder & "\Background.png"))
;SetMaterialType ( $background , 13 )
;SetMaterialFlag ( $background , $EMF_LIGHTING , 0 )
;SetVisible( $background, 1 )

;Backgroundtheme_Image($backgroundthemeImage)
;Set Up the rest of the theme files
;Stageone($stageoneImage)
;Banner($bannerImage)
;Blueline($bluelineImage)
;Footer($footerImage)
;Header($headerImage)
;Pannelleft($pannelleftImage)
;Pannelright($pannelrightImage)

;Add Camera -$Camera = AddCameraSceneNode(0, 0, 0, 300, 0, 0, 0) where 300 is orinaly 200 this sets default zoom out level===============ZOOM LEVEL
;$Camera = AddCameraSceneNode(0, 0, 0, 300, 0, 0, 0)

; Set up Background Image
;Background2($backgroundImage)
;Background2(@ScriptDir&"\GUI\background.png")

; Load Background Textures
;$backgroundTexture1 = GetTexture($TempFolder & "\FlowBack1.png")
;$backgroundTexture2 = GetTexture($TempFolder & "\FlowBack2.png")
;$backgroundTexture3 = GetTexture($TempFolder & "\FlowBack3.png")

; Create Skybox
;$backgroundTexture1 = GetTexture($TempFolder & "\Background.png")
;$backgroundTexture1 = GetTexture($TempFolder & "\Background.png")
;$backgroundTexture1 = GetTexture($TempFolder & "\Background.png")

;$BackgroundCam = AddCameraSceneNode(0, 0, 0, 300, 0, 0, 0)
;Background2(@ScriptDir&"\GUI\background.png")

$CameraPanel3 = AddCameraSceneNode(0, 0, 0, 300, 0, 0, 0)

;Main GUI Background
$Camera = AddCameraSceneNode(0, 0, 0, 300, 0, 0, 0)

Global $background2 = AddBillboardSceneNode($Camera,1290, 720)
setPosition($background2,0+IniRead($IniTheme, "GUI", "$background-X", ""),0+IniRead($IniTheme, "GUI", "$background-Y", ""),-500)
SetMaterialTexture($background2,0,GetTexture($TempFolder & "\Background.png"))
SetMaterialType ( $background2 , 13 )
SetMaterialFlag ( $background2 , $EMF_LIGHTING , 0 ); Disable lighting
SetVisible( $background2, 0 )

;Theme GUI Background
Global $Background = AddBillboardSceneNode($Camera,1290, 720)
setPosition($background,0+IniRead($IniTheme, "GUI", "Background-X", ""),0+IniRead($IniTheme, "GUI", "Background-Y", ""),-499)
SetMaterialTexture($background,0,GetTexture(@ScriptDir&"\interface\Themes\"& $themeName & "\background.png"))
SetMaterialType ( $background , 13 )
SetMaterialFlag ( $background , $EMF_LIGHTING , 0 ); Disable lighting
SetVisible( $background, 1 )

;Theme GUI Stageone
Global $Stageone = AddBillboardSceneNode($Camera,1290, 720)
setPosition($stageone,0+IniRead($IniTheme, "GUI", "Stage-X", ""),0+IniRead($IniTheme, "GUI", "Stage-Y", ""),-498)
SetMaterialTexture($stageone,0,GetTexture(@ScriptDir&"\interface\Themes\"& $themeName & "\stageone.png"))
SetMaterialType ( $stageone , 14 )
SetMaterialFlag ( $stageone , $EMF_LIGHTING , 0 ); Disable lighting
SetVisible( $stageone, 1 )

;$Camera = AddCameraSceneNode(0, 0, 0, 0--300, 0, 0, 0)
;----------------------------------------------------------------------------------------------------------------------------------------

;Theme GUI Banner
Global $banner = AddBillboardSceneNode($Camera,1290, 720)
;Global $banner = AddBillboardSceneNode($Camera,1290, 720)
setPosition($banner,0+IniRead($IniTheme, "GUI", "Banner-X", ""),0+IniRead($IniTheme, "GUI", "Banner-Y", ""),-497)
SetMaterialTexture($banner,0,GetTexture(@ScriptDir&"\interface\Themes\"& $themeName & "\banner.png"))
SetMaterialType ( $banner , 13 ) ; EMT_TRANSPARENT_ALPHA_CHANNEL
SetMaterialFlag ( $banner , $EMF_LIGHTING , 0 ); Disable lighting
SetVisible( $banner, 1 )

;Theme GUI Blueline
Global $blueline = AddBillboardSceneNode($Camera,1290, 720)
;Global $blueline = AddBillboardSceneNode($Camera, 1280, 720)
setPosition($blueline,0+IniRead($IniTheme, "GUI", "Blueline-X", ""),0+IniRead($IniTheme, "GUI", "Blueline-Y", ""), -496)
SetMaterialTexture($blueline, 0, GetTexture(@ScriptDir & "\\interface\\Themes\\" & $themeName & "\\blueline.png"))
SetMaterialType($blueline, 13)
SetMaterialFlag($blueline, $EMF_LIGHTING, 0)  ; Disable lighting
SetVisible($blueline, 1 )

;Theme GUI Header
Global $header = AddBillboardSceneNode($Camera,1280, 720)
;Global $header = AddBillboardSceneNode($Camera,1280, 720)
setPosition($header,0+IniRead($IniTheme, "GUI", "Header-X", ""),0+IniRead($IniTheme, "GUI", "Header-Y", ""),-495)
SetMaterialTexture($header,0,GetTexture(@ScriptDir&"\interface\Themes\"& $themeName & "\header.png"))
SetMaterialType ( $header , 13 )
SetMaterialFlag ( $header , $EMF_LIGHTING , 0 ); Disable lighting
SetVisible( $header, 1 )

;Theme GUI Footer
Global $footer = AddBillboardSceneNode($Camera,1280, 720)
;Global $footer = AddBillboardSceneNode($Camera,1280, 720)
setPosition($footer,0+IniRead($IniTheme, "GUI", "Footer-X", ""),0+IniRead($IniTheme, "GUI", "Footer-Y", ""),-494)
SetMaterialTexture($footer,0,GetTexture(@ScriptDir&"\interface\Themes\"& $themeName & "\footer.png"))
SetMaterialType ( $footer , 13 )
SetMaterialFlag ( $footer , $EMF_LIGHTING , 0 ); Disable lighting
SetVisible( $footer, 1 )

;Theme GUI Pannelleft
Global $pannelleft = AddBillboardSceneNode($Camera,520, 300)
;Global $pannelleft = AddBillboardSceneNode($Camera,1280, 720)
setPosition($pannelleft,0+IniRead($IniTheme, "GUI", "Pannelleft-X", ""),0+IniRead($IniTheme, "GUI", "Pannelleft-Y", ""),-200)
SetMaterialTexture($pannelleft,0,GetTexture(@ScriptDir&"\interface\Themes\"& $themeName & "\pannelleft.png"))
SetMaterialType ( $pannelleft , 13 )
SetMaterialFlag ( $pannelleft , $EMF_LIGHTING , 0 ); Disable lighting
SetVisible( $pannelleft, 1 )

;Theme GUI Pannelright
Global $pannelright = AddBillboardSceneNode($Camera,520, 300)
;Global $pannelright = AddBillboardSceneNode($Camera,1280, 720)
setPosition($pannelright,0+IniRead($IniTheme, "GUI", "Pannelright-X", ""),0+IniRead($IniTheme, "GUI", "Pannelright-Y", ""),-200)
SetMaterialTexture($pannelright,0,GetTexture(@ScriptDir&"\interface\Themes\"& $themeName & "\pannelright.png"))
SetMaterialType ( $pannelright , 13 )
SetMaterialFlag ( $pannelright , $EMF_LIGHTING , 0 ); Disable lighting
SetVisible( $pannelright, 1 )

;----------------------------------------------------------------------------------------------------------------------------------------

;Main GUI A Button
Global $Abutton1 = AddBillboardSceneNode($Camera,25, 25)
setPosition($Abutton1,100,-130,-200)
setPosition($Abutton1,0+IniRead($IniTheme, "BUTTON", "Button_a-X", ""),-10+IniRead($IniTheme, "BUTTON", "Button_a-Y", ""),-200)
SetMaterialTexture($Abutton1,0,GetTexture(@ScriptDir&"\interface\Themes\"& $themeName & "\button_a.png"))
SetMaterialType($Abutton1, 13 )
SetMaterialFlag($Abutton1, $EMF_LIGHTING , 0 )
SetVisible($Abutton1, 1 )

;Main GUI B Button
Global $Abutton2 = AddBillboardSceneNode($Camera,25, 25)
;setPosition($Abutton2, 33,-130,-200)
setPosition($Abutton2,0+IniRead($IniTheme, "BUTTON", "Button_b-X", ""),-10+IniRead($IniTheme, "BUTTON", "Button_b-Y", ""),-200)
SetMaterialTexture($Abutton2,0,GetTexture(@ScriptDir&"\interface\Themes\"& $themeName & "\button_b.png"))
SetMaterialType($Abutton2, 13 )
SetMaterialFlag($Abutton2, $EMF_LIGHTING , 0 )
SetVisible($Abutton2, 1 )

;Main GUI X Button
Global $Abutton3 = AddBillboardSceneNode($Camera,25, 25)
setPosition($Abutton3, 0+IniRead($IniTheme, "BUTTON", "Button_x-X", ""),-10+IniRead($IniTheme, "BUTTON", "Button_x-Y", ""),-200)
SetMaterialTexture($Abutton3,0,GetTexture(@ScriptDir&"\interface\Themes\"& $themeName & "\button_x.png"))
SetMaterialType($Abutton3, 13 )
SetMaterialFlag($Abutton3, $EMF_LIGHTING , 0 )
SetVisible($Abutton3, 1 )

;Main GUI Y Button
Global $Abutton4 = AddBillboardSceneNode($Camera,25, 25)
setPosition($Abutton4,0+IniRead($IniTheme, "BUTTON", "Button_y-X", ""),-10+IniRead($IniTheme, "BUTTON", "Button_y-Y", ""),-200)
SetMaterialTexture($Abutton4,0,GetTexture(@ScriptDir&"\interface\Themes\"& $themeName & "\button_y.png"))
SetMaterialType($Abutton4, 13 )
SetMaterialFlag($Abutton4, $EMF_LIGHTING , 0 )
SetVisible($Abutton4, 1 )
;----------------------------------------------------------------------------------------------------------------------------------------

Global $SettingsguiTrans = GUICreate("", 1280, 720, 2, 40, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $Main_Flow_gui)
GUISetBkColor($GuiBorderColor, $SettingsguiTrans)
WinSetTrans($SettingsguiTrans, "", 155)

GUICtrlCreateLabel("", 5, 5, 1270, 710)
GUICtrlSetBkColor(-1, $GuiColor)
GUICtrlSetState(-1, $GUI_DISABLE)
GUISetState(@SW_HIDE, $SettingsguiTrans)

Global $Settingsgui = GUICreate("", 1280, 720, 0, 40, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $Main_Flow_gui)
GUICtrlCreateLabel("File Format", 0, 5, 1280, 30, $SS_CENTER)
GUICtrlSetColor(-1, $MenuBTColor)
GUICtrlSetFont(-1, 25, 400)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

Global $FFType[1]
If $Fileformat <> "" Then $FFType = StringSplit($Fileformat, "|", 0)

Global $FFTypeControl[$FFType[0] + 1][8]
Local $FFTypeX = 20, $FFTypeY = 50, $FFTYpeCOL = 0

$FFTypeControl[0][0] = $FFType[0]
For $i = 1 To $FFType[0]
	$FFTypeControl[$i][6] = $FFType[$i]
	$FFTypeControl[$i][7] = IniRead($INI, "BT", $FFType[$i], -1)
	If $FFTypeControl[$i][7] = -1 Then
		IniWrite($INI, "BT", $FFType[$i], 0)
		$FFTypeControl[$i][7] = 0
	EndIf
Next

$All_Apps = _FileListToArray($Apps_dir, "*.lnk", 1)
If IsArray($All_Apps) Then
For $i = 1 To $All_Apps[0]
	If StringInStr($All_Apps[$i],".lnk") <> 0 Then $All_Apps[$i] = StringReplace($All_Apps[$i], ".lnk", "")
Next
EndIf

For $i = 1 To $FFTypeControl[0][0]
	If $i <= 43 Then
		GUICtrlCreateLabel("." & StringUpper($FFTypeControl[$i][6]), $FFTypeX, $FFTypeY, 60, 20)
		GUICtrlSetColor(-1, $SettingsTxtColor)
		GUICtrlSetFont(-1, 14, 400)

		$FFTypeControl[$i][0] = GUICtrlCreatePic("", $FFTypeX + 60, $FFTypeY, 63, 18)

		If $FFTypeControl[$i][7] = 0 Then
			_GUICtrlslider_SetImage($FFTypeControl[$i][0], $Theme_dir & "\" & $Theme & "\slidBt.png", 63, 18, 36)
			GUICtrlSetCursor(-1, 0)
		ElseIf $FFTypeControl[$i][7] = 1 Then
			_GUICtrlslider_SetImage($FFTypeControl[$i][0], $Theme_dir & "\" & $Theme & "\slidBt.png", 63, 18, 0)
			GUICtrlSetCursor(-1, 0)
		EndIf

		$FFTypeControl[$i][2] = GUICtrlCreatePic("", $FFTypeX + 125, $FFTypeY - 4, 26, 26)
		_GUICtrlPic_SetBT($FFTypeControl[$i][2], $Theme_dir & "\" & $Theme & "\BTNM.png", 26, 26)

		$FFTypeControl[$i][3] = GUICtrlCreatePic("", $FFTypeX + 151, $FFTypeY - 4, 124, 26)
		_GUICtrlPic_SetBT($FFTypeControl[$i][3], $Theme_dir & "\" & $Theme & "\BTNC.png", 124, 26)

		$FFTypeControl[$i][4] = GUICtrlCreatePic("", $FFTypeX + 275, $FFTypeY - 4, 26, 26)
		_GUICtrlPic_SetBT($FFTypeControl[$i][4], $Theme_dir & "\" & $Theme & "\BTNP.png", 26, 26)

		$FFTypeControl[$i][1] = GUICtrlCreateLabel($ChooseApp, $FFTypeX + 155, $FFTypeY - 2, 124, 18, $SS_CENTER)
		GUICtrlSetColor(-1, $SettingsBTColor)
		GUICtrlSetFont(-1, 14, 400)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

		$FFTypeY += 30
		If $FFTypeY > 470 And $FFTYpeCOL = 0 Then
			$FFTYpeCOL = 1
			$FFTypeX += 300
			$FFTypeY = 50
		ElseIf $FFTypeY > 470 And $FFTYpeCOL = 1 Then
			$FFTYpeCOL = 2
			$FFTypeX += 300
			$FFTypeY = 50
		EndIf
	EndIf
Next


$themesBTL = GUICtrlCreatePic("", 620, 460, 30, 30)
_GUICtrlPic_SetBT($themesBTL, $Theme_dir & "\" & $Theme & "\BTNL.png", 30, 30)

$themesBTC = GUICtrlCreatePic("", 650, 460, 100, 30)
_GUICtrlPic_SetBT($themesBTC, $Theme_dir & "\" & $Theme & "\BTNC.png", 100, 30)

$themesBTR = GUICtrlCreatePic("", 750, 460, 30, 30)
_GUICtrlPic_SetBT($themesBTR, $Theme_dir & "\" & $Theme & "\BTNR.png", 30, 30)

$themesBTLabel = GUICtrlCreateLabel($Redraw, 650, 465, 100, 30, $SS_CENTER)
		GUICtrlSetColor(-1, $MenuBTColor)
		GUICtrlSetFont(-1, 14, 400)
		GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

;Change background color for settings gui  "GUISetBkColor(0x000010, $Settingsgui)" is clear

GUISetBkColor(0x000010, $Settingsgui)
_WinAPI_SetLayeredWindowAttributes($Settingsgui, 0x0000010, 0xFF, 0x03)
GUISetState(@SW_HIDE, $Settingsgui)

;########################################################################## GUI Introduction #########################################################################################;

Global $Info_child_Gui_trans = GUICreate("", 500, 590, 524, 35, $WS_POPUPWINDOW, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $Main_Flow_gui)
GUISetBkColor($GuiBorderColor, $Info_child_Gui_trans)
WinSetTrans($Info_child_Gui_trans, "", 155)
GUICtrlCreateLabel("", 5, 5, 495, 580)
GUICtrlSetBkColor(-1, $GuiColor)
GUICtrlSetState(-1, $GUI_DISABLE)

GUISetState(@SW_HIDE, $Info_child_Gui_trans)

Global $Info_child_Gui = GUICreate("", 500, 590, 524, 35, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $Main_Flow_gui)

GUICtrlCreateLabel("Introduction", 10, 10, 485, 30, $SS_CENTER)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 20)

GUISetBkColor(0x01, $Info_child_Gui)
_WinAPI_SetLayeredWindowAttributes($Info_child_Gui, 0x01, 0xFF, 0x03)
GUISetState(@SW_HIDE, $Info_child_Gui)

;######################################################################### Main GUI Parent  #########################################################################################;


; Parent GUI
Global $parentgui = GUICreate("Parent GUI", 1280, 720, 0, 40, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $Main_Flow_gui)

Global $Alphabet_gameName = GUICtrlCreateLabel('', 0+IniRead($IniTheme, "TEXTE", "AlphabetGameName-X", ""), 0+IniRead($IniTheme, "TEXTE", "AlphabetGameName-Y", ""), 100, 100, $SS_CENTER)
GUICtrlSetFont(-1, 0+IniRead($IniTheme, "TEXTE", "AlphabetGameName-Size", ""), Default, Default, IniRead($IniTheme, "TEXTE", "AlphabetGameName-Font", ""), 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "TEXTE", "AlphabetGameName-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

Global $label_gameName = GUICtrlCreateLabel('', 0+IniRead($IniTheme, "TEXTE", "GameName-X", ""), 0+IniRead($IniTheme, "TEXTE", "GameName-Y", ""), 1280, 50, $SS_CENTER)
GUICtrlSetFont(-1, $GameNameSize, -1, -1, $GameNameFont, 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "TEXTE", "GameName-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

Global $label_gameCount = GUICtrlCreateLabel("", 0+IniRead($IniTheme, "TEXTE", "GameNumber-X", ""), 0+IniRead($IniTheme, "TEXTE", "GameNumber-Y", ""), 1280, 150, $SS_CENTER);+0x1000)
GUICtrlSetFont(-1, 0+IniRead($IniTheme, "TEXTE", "GameNumber-Size", ""), Default, Default, IniRead($IniTheme, "TEXTE", "GameNumber-Font", ""), 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "TEXTE", "GameNumber-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)


Global $datemonth= GUICtrlCreateLabel('', +20+IniRead($IniTheme, "CLOCK", "DateMonth-X", ""), -10+IniRead($IniTheme, "CLOCK", "DateMonth-Y", ""), 200, 150, 0x0002);+0x1000)
GUICtrlSetFont(-1, 0+IniRead($IniTheme, "CLOCK", "DateMonth-Size", ""), Default, Default, IniRead($IniTheme, "CLOCK", "DateMonth-Font", ""), 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "CLOCK", "DateMonth-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

Global $dateday= GUICtrlCreateLabel('', +20+IniRead($IniTheme, "CLOCK", "DateDay-X", ""), -10+IniRead($IniTheme, "CLOCK", "DateDay-Y", ""), 40, 50, 0x0002);+0x1000)
GUICtrlSetFont(-1, 0+IniRead($IniTheme, "CLOCK", "DateDay-Size", ""), Default, Default, IniRead($IniTheme, "CLOCK", "DateDay-Font", ""), 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "CLOCK", "DateDay-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

Global $lbhour = GUICtrlCreateLabel('', -0+IniRead($IniTheme, "CLOCK", "DateHour-X", ""), -10+IniRead($IniTheme, "CLOCK", "DateHour-Y", ""), 100, 50, 0x0002);+0x1000)
GUICtrlSetFont(-1, 0+IniRead($IniTheme, "CLOCK", "DateHour-Size", ""), Default, Default, IniRead($IniTheme, "CLOCK", "DateHour-Font", ""), 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "CLOCK", "DateHour-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

Global $lbhourampm = GUICtrlCreateLabel('A', -0+IniRead($IniTheme, "CLOCK", "DateHourA-X", ""), -10+IniRead($IniTheme, "CLOCK", "DateHourA-Y", ""), 35, 40, 0x0002);+0x1000)
GUICtrlSetFont(-1, 0+IniRead($IniTheme, "CLOCK", "DateHourA-Size", ""), Default, Default, IniRead($IniTheme, "CLOCK", "DateHourA-Font", ""), 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "CLOCK", "DateHourA-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

Global $lbhourampmfix = GUICtrlCreateLabel('M', -0+IniRead($IniTheme, "CLOCK", "DateHourM-X", ""), -10+IniRead($IniTheme, "CLOCK", "DateHourM-Y", ""), 35, 40, 0x0002);+0x1000)
GUICtrlSetFont(-1, 0+IniRead($IniTheme, "CLOCK", "DateHourM-Size", ""), Default, Default, IniRead($IniTheme, "CLOCK", "DateHourM-Font", ""), 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "CLOCK", "DateHourM-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

Global $next = GUICtrlCreatePic("", 1200, 720/2-32, 64, 64)
_GUICtrlPic_SetImage($next, @ScriptDir&"\interface\Themes\"& $themeName & "\cross.png")
GUICtrlSetCursor(-1, 0)

Global $perv = GUICtrlCreatePic("", 20, 720/2-32, 64, 64)
_GUICtrlPic_SetImage($perv, @ScriptDir&"\interface\Themes\"& $themeName & "\cross.png")
GUICtrlSetCursor(-1, 0)


;texte
Global $Button_a_text = GUICtrlCreateLabel(IniRead($IniLanguage, $Language, "A", ""), 50+IniRead($IniTheme, "TEXTE", "Button-A-X", ""), 0+IniRead($IniTheme, "TEXTE", "Button-A-Y", ""), 150, 150, $SS_LEFT);+0x1000)
GUICtrlSetFont(-1, 0+IniRead($IniTheme, "TEXTE", "Button-A-Size", ""), Default, Default, IniRead($IniTheme, "TEXTE", "Button-A-Font", ""), 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "TEXTE", "Button-A-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

Global $Button_b_text = GUICtrlCreateLabel(IniRead($IniLanguage, $Language, "B", ""), 70+IniRead($IniTheme, "TEXTE", "Button-B-X", ""), 0+IniRead($IniTheme, "TEXTE", "Button-B-Y", ""), 150, 150, $SS_LEFT);+0x1000)
GUICtrlSetFont(-1, 0+IniRead($IniTheme, "TEXTE", "Button-B-Size", ""), Default, Default, IniRead($IniTheme, "TEXTE", "Button-B-Font", ""), 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "TEXTE", "Button-B-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

Global $Button_x_text = GUICtrlCreateLabel(IniRead($IniLanguage, $Language, "X", ""), 10+IniRead($IniTheme, "TEXTE", "Button-X-X", ""), 0+IniRead($IniTheme, "TEXTE", "Button-X-Y", ""), 150, 150, $SS_LEFT);+0x1000)
GUICtrlSetFont(-1, 0+IniRead($IniTheme, "TEXTE", "Button-X-Size", ""), Default, Default, IniRead($IniTheme, "TEXTE", "Button-B-Font", ""), 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "TEXTE", "Button-X-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

Global $Button_y_text = GUICtrlCreateLabel(IniRead($IniLanguage, $Language, "Y", ""), 10+IniRead($IniTheme, "TEXTE", "Button-Y-X", ""), 0+IniRead($IniTheme, "TEXTE", "Button-Y-Y", ""), 150, 150, $SS_CENTER);+0x1000)
GUICtrlSetFont(-1, 0+IniRead($IniTheme, "TEXTE", "Button-Y-Size", ""), Default, Default, IniRead($IniTheme, "TEXTE", "Button-B-Font", ""), 3)
GUICtrlSetColor(-1, 0+IniRead($IniTheme, "TEXTE", "Button-Y-Color", ""))
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)


GUISetBkColor(0x01, $parentgui)
_WinAPI_SetLayeredWindowAttributes($parentgui, 0x01, 0xFF, 0x03)

;########################################################################## Start Gui  ######################################################################################;

GUIRegisterMsg($WM_NCHITTEST, "WM_NCHITTEST")
Local $CoverRunAnimator1
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------theme startup sound can start here

Load_games()

If Mod($Games_Result, 2) Then
	Draw(($Cover_Distance * $Games_Result) - ($Cover_Distance * (($Games_Result - 1) / 2)))
	$_Move = ($Cover_Distance * $Games_Result) - ($Cover_Distance * (($Games_Result - 1) / 2))
Else
	Draw(($Cover_Distance * $Games_Result) - ($Cover_Distance * ($Games_Result / 2)))
	$_Move = ($Cover_Distance * $Games_Result) - ($Cover_Distance * ($Games_Result / 2))
EndIf
GUICtrlSetData($label_gameName, $Cover[$_Move / $Cover_Distance][1])

; Run the GUI
_splashscreenOff()

GUISetState(@SW_SHOW, $Main_Flow_gui)
GUISetState(@SW_SHOW, $parentgui)

;/////////////////////////////////////////////////////////////////////////// While ///////////////////////////////////////////////////////////////////////////////////////////

; Step Initializing variables and creating GUI elements
Local $stateSettings = 0
Local $stateSettings = 0

While IrrRun()
	BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	SceneDraw()
	GuiDraw()

	EndScene()
	$extMsg = GUIGetMsg(1)
	$msg = $extMsg[0]
	$controlhandle = $extMsg[2]
	$mausX = $extMsg[3]
	$mausY = $extMsg[4]

; Step Entering the main loop and handling user input/updating the scene
	Switch $extMsg[1]
		Case $Main_Flow_gui

			;If $mausX > 10 And $mausX < 42 And $mausY > 635 And $mausY < 667 Then
				;ControlMove($Main_Flow_gui, "", $Settings, 9, 635, 34, 34)
			;Else
				;ControlMove($Main_Flow_gui, "", $Settings, 10, 636, 32, 32)
			;EndIf

			;If $mausX > 60 And $mausX < 92 And $mausY > 635 And $mausY < 667 Then
			;	ControlMove($Main_Flow_gui, "", $SkinBT, 59, 635, 34, 34)
			;Else
			;	ControlMove($Main_Flow_gui, "", $SkinBT, 60, 636, 32, 32)
			;EndIf

			;If $mausX > 983 And $mausX < 1016 And $mausY > 635 And $mausY < 667 Then
			;	ControlMove($Main_Flow_gui, "", $ExitButton, 983, 635, 34, 34)
			;Else
			;	ControlMove($Main_Flow_gui, "", $ExitButton, 984, 636, 32, 32)
			;EndIf

		 ; Step Checking for events and user inputs
			Select
				Case $msg = $Settings ; Code to handle the settings button click
					For $s = 1 To 6
						;ControlMove($Main_Flow_gui, "", $Settings, 10 + ($s / 2), 636 + ($s / 2), 32 - $s, 32 - $s)
						If $s > 4 Then
							Sleep(40)
						Else
							Sleep(20)
						EndIf
						_GUICtrlPic_SetImage($Settings, $TempFolder & "\settings.png")
					Next
					For $s = 1 To 6
						;ControlMove($Main_Flow_gui, "", $Settings, 13 - ($s / 2), 639 - ($s / 2), 26 + $s, 26 + $s)
						If $s > 4 Then
							Sleep(40)
						Else
							Sleep(20)
						EndIf
						_GUICtrlPic_SetImage($Settings, $TempFolder & "\settings.png")
					Next
					If $ModeFlow = 1 Then
						If $stateSettings = 0 Then
						   GUISetState(@SW_HIDE,  $parentgui)
						   Sleep(500)
						   _WinAnimate($SettingsguiTrans, $AW_CENTER, 200)
						   GUISetState(@SW_SHOW, $Settingsgui)
						   $stateSettings = 1
						   WinActivate($Settingsgui)
						   GUISetState(@SW_DISABLE, $parentgui)
                           GUICtrlSetState($perv, $GUI_HIDE)
                           GUICtrlSetState($Alphabet_gameName, $GUI_HIDE)
						   GUICtrlSetState($label_gameName, $GUI_HIDE)
                           GUICtrlSetState($next, $GUI_HIDE)
						Else
						   GUISetState(@SW_HIDE, $Settingsgui)
						   SetVisible( $device, 1 )
						   _WinAnimate($SettingsguiTrans, BitOR($AW_HIDE, $AW_CENTER), 200)
						   GUISetState(@SW_SHOW,  $parentgui)
						   $stateSettings = 0
						   GUISetState(@SW_ENABLE, $parentgui)
						   GUICtrlSetState($perv, $GUI_SHOW)
                           GUICtrlSetState($Alphabet_gameName, $GUI_SHOW)
						   GUICtrlSetState($label_gameName, $GUI_SHOW)
                           GUICtrlSetState($next, $GUI_SHOW)
						EndIf
					EndIf

				Case $msg = $ExitButton; Code to handle the exit button click
					For $s = 1 To 6
						;ControlMove($Main_Flow_gui, "", $ExitButton, 983 + ($s / 2), 636 + ($s / 2), 32 - $s, 32 - $s)
						If $s > 4 Then
							Sleep(40)
						Else
							Sleep(20)
						EndIf
						_GUICtrlPic_SetImage($ExitButton, $TempFolder & "\Exit.png")
					Next
					For $s = 1 To 6
						;ControlMove($Main_Flow_gui, "", $ExitButton, 986 - ($s / 2), 639 - ($s / 2), 26 + $s, 26 + $s)
						If $s > 4 Then
							Sleep(40)
						Else
							Sleep(20)
						EndIf
						_GUICtrlPic_SetImage($ExitButton, $TempFolder & "\Exit.png")
					Next
					_Exit()
				Case $msg = $SkinBT	; Code to handle the skin button click
					For $s = 1 To 6
						;ControlMove($Main_Flow_gui, "", $SkinBT, 60 + ($s / 2), 636 + ($s / 2), 32 - $s, 32 - $s)
						If $s > 4 Then
							Sleep(40)
						Else
							Sleep(20)
						EndIf
						_GUICtrlPic_SetImage($SkinBT, $TempFolder & "\skins.png")
					Next
					For $s = 1 To 6
						;ControlMove($Main_Flow_gui, "", $SkinBT, 63 - ($s / 2), 639 - ($s / 2), 26 + $s, 26 + $s)
						If $s > 4 Then
							Sleep(40)
						Else
							Sleep(20)
						EndIf
						_GUICtrlPic_SetImage($SkinBT, $TempFolder & "\skins.png")
					Next
					$var = FileOpenDialog("Background Pic", -1, "Images (*.BMP;*.JPG;*.TGA;*.PCX;*.PNG;*.PSD)", 1, "")
					If Not @error Then
						$Background_Image = $var
						IniWrite($INI, "Config", "BackPic", $var)
                        FileDelete($TempFolder & "\Background.png")
						;FileDelete($TempFolder & "\FlowBack1.png")
						;FileDelete($TempFolder & "\FlowBack2.png")
						;FileDelete($TempFolder & "\FlowBack3.png")
						;Background($Background_Image)
						Background2(@ScriptDir&"\GUI\background.png")
						;If FileExists($TempFolder & "\FlowBack1.png") = 1 And FileExists($TempFolder & "\FlowBack2.png") = 1 And FileExists($TempFolder & "\FlowBack3.png") = 1 Then
						If FileExists($TempFolder & "\Background.png") = 1 Then
						    SetMaterialTexture($background2,0,GetTexture($TempFolder & "\Background.png"))
							;$backgroundTexture1 = GetTexture($TempFolder & "\FlowBack1.png")
							;$backgroundTexture2 = GetTexture($TempFolder & "\FlowBack2.png")
							;$backgroundTexture3 = GetTexture($TempFolder & "\FlowBack3.png")
							;AddSkyBoxSceneNode($backgroundTexture1, $backgroundTexture1, $backgroundTexture3, $backgroundTexture2, $backgroundTexture1, $backgroundTexture1)
						EndIf
					EndIf
			EndSelect
		Case $Settingsgui; Code to handle events and user inputs for the settings GUI
			$GetCursorInfo = GUIGetCursorInfo($Settingsgui)

			For $i = 1 To $FFTypeControl[0][0]
				If $GetCursorInfo[4] = $FFTypeControl[$i][0] And $GetCursorInfo[2] = 1 Then
					If $FFTypeControl[$i][7] = 1 Then
						For $s = 0 To 36 Step 2

							_GUICtrlslider_SetImage($FFTypeControl[$i][0], $Theme_dir & "\" & $Theme & "\slidBt.png", 63, 18, $s)
							Sleep(1)
						Next
						$FFTypeControl[$i][7] = 0
						IniWrite($INI, "BT", $FFTypeControl[$i][6], 0)
					ElseIf $FFTypeControl[$i][7] = 0 Then

						For $s = 36 To 0 Step -2
							_GUICtrlslider_SetImage($FFTypeControl[$i][0], $Theme_dir & "\" & $Theme & "\slidBt.png", 63, 18, $s)
							Sleep(1)
						Next
						$FFTypeControl[$i][7] = 1
						IniWrite($INI, "BT", $FFTypeControl[$i][6], 1)
					EndIf
				EndIf
				If $GetCursorInfo[4] = $FFTypeControl[$i][2] And $GetCursorInfo[2] = 1 Then
					_GUICtrlPic_SetBT($FFTypeControl[$i][2], $Theme_dir & "\" & $Theme & "\BTNMH.png", 26, 26)
					Local $oldAPP = GUICtrlRead($FFTypeControl[$i][1])

					If IsArray($All_Apps) Then
						For $iapp = 1 To $All_Apps[0]
							If $All_Apps[$iapp] = $oldAPP Then
								If $iapp > 2 Then
									$newAPP = $All_Apps[$iapp - 1]
									ExitLoop
								Else
									$newAPP = $All_Apps[1]
									ExitLoop
								EndIf
							Else
								$newAPP = $All_Apps[1]
							EndIf
						Next
						GUICtrlSetData($FFTypeControl[$i][1], $newAPP)
					EndIf
					Sleep(333)
					_GUICtrlPic_SetBT($FFTypeControl[$i][2], $Theme_dir & "\" & $Theme & "\BTNM.png", 26, 26)
				EndIf

				If $GetCursorInfo[4] = $FFTypeControl[$i][4] And $GetCursorInfo[2] = 1 Then
					_GUICtrlPic_SetBT($FFTypeControl[$i][4], $Theme_dir & "\" & $Theme & "\BTNPH.png", 26, 26)
					Local $oldAPP = GUICtrlRead($FFTypeControl[$i][1])

					If IsArray($All_Apps) Then
						For $iapp = 1 To $All_Apps[0]
							If $All_Apps[$iapp] = $oldAPP Then
								If $iapp < $All_Apps[0] Then
									$newAPP = $All_Apps[$iapp + 1]
								ElseIf $iapp = $All_Apps[0] Then
									$newAPP = $All_Apps[$iapp]
								EndIf
								ExitLoop
							Else
								$newAPP = $All_Apps[1]
							EndIf
						Next
						GUICtrlSetData($FFTypeControl[$i][1], $newAPP)
					EndIf
					Sleep(333)
					_GUICtrlPic_SetBT($FFTypeControl[$i][4], $Theme_dir & "\" & $Theme & "\BTNP.png", 26, 26)
				EndIf

			Next

			_WinAPI_SetLayeredWindowAttributes($Settingsgui, 0x000010, 0xFF, 0x03)
			If $GetCursorInfo[4] = $themesBTC Or $GetCursorInfo[4] = $themesBTL Or $GetCursorInfo[4] = $themesBTR Or $GetCursorInfo[4] = $themesBTLabel And $GetCursorInfo[2] = 1 Then
				_GUICtrlPic_SetBT($themesBTC, $Theme_dir & "\" & $Theme & "\BTNCH.png", 100, 30)
				_GUICtrlPic_SetBT($themesBTL, $Theme_dir & "\" & $Theme & "\BTNLH.png", 30, 30)
				_GUICtrlPic_SetBT($themesBTR, $Theme_dir & "\" & $Theme & "\BTNRH.png", 30, 30)
				GUICtrlSetData($themesBTLabel, $Redraw)
				For $i = 0 To $Gamer_count
					Remove($Cover[$i][0])
				Next
				Local $compare[2], $Cover_Distance = 70, $Cover_Position[1], $Centred_Game, $camVi = 0, $icolor_red = 0, $icolor_green = 0, $icolor_blue = 0, $ModeFlow = 1, _
						$Gamer_count = 0, $Games_Result = 0, $_Move = 0, $Titel = "Uniflow", $backgroundTexture1, $backgroundTexture2, $backgroundTexture3, $Y = 0
				ReDim $Cover[1][2], $Cover_Back[1], $Cover_reflet[1], $Cover_refletLeft[1], $Cover_refletRight[1], $Cover_SideLeft[1], $Cover_SideRight[1], $Cover_SideTop[1], $Cover_Name[1], $ListArray[1][2]

				Load_games()

				If $Games_Result > 0 Then

				   ;Draw(($Cover_Distance * $Games_Result) - ($Cover_Distance * ($Games_Result / 2)))

					If Mod($Games_Result, 2) Then
						Draw(($Cover_Distance * $Games_Result) - ($Cover_Distance * (($Games_Result - 1) / 2)))
						$_Move = ($Cover_Distance * $Games_Result) - ($Cover_Distance * (($Games_Result - 1) / 2))
					Else
						Draw(($Cover_Distance * $Games_Result) - ($Cover_Distance * ($Games_Result / 2)))
						$_Move = ($Cover_Distance * $Games_Result) - ($Cover_Distance * ($Games_Result / 2))
					EndIf
					GUICtrlSetData($label_gameName, $Cover[$_Move / $Cover_Distance][1])
				EndIf
				_GUICtrlPic_SetBT($themesBTC, $Theme_dir & "\" & $Theme & "\BTNC.png", 100, 30)
				_GUICtrlPic_SetBT($themesBTL, $Theme_dir & "\" & $Theme & "\BTNL.png", 30, 30)
				_GUICtrlPic_SetBT($themesBTR, $Theme_dir & "\" & $Theme & "\BTNR.png", 30, 30)
				GUICtrlSetData($themesBTLabel, $Redraw)
			EndIf
		Case $parentgui; Code to handle events and user inputs for the parent GUI
			$nextpos = ControlGetPos($parentgui, "", $next)
			If $mausX > $nextpos[0] And $mausX < $nextpos[0] + $nextpos[2] And $mausY > $nextpos[1] And $mausY < $nextpos[1] + $nextpos[3] And _IsPressed("01") Then
				_GUICtrlPic_SetImage($next, @ScriptDir&"\interface\Themes\"& $themeName & "\right.png")
				Do
					_View1($Centred_Game)
					If $_Move = $Gamer_count * $Cover_Distance Then
					Else
						$TextMX = 0+IniRead($IniTheme, "TEXTE", "GameName-X", "")
				        $TextMY = 0+IniRead($IniTheme, "TEXTE", "GameName-Y", "")
						_SoundPlay($SoundFlip, 0)
			   ;Flowright settings================================================this adjust flow speed
			   ;Default 20 my setting is 10
						For $i = 1 To 20
			   ;Default 20 my setting is 10
							$_Move += $Cover_Distance / 20
							Draw($_Move)
			   ;Default setting was 10 changed to my setting is witch is 5
							If $i <= 10 Then
								$TextMX += 50
								$TextMY -= 5
								ControlMove($parentgui, "", $label_gameName, $TextMX, $TextMY)
								GUICtrlSetFont($label_gameName, $GameNameSize - $i, -1, -1, $GameNameFont, 3)
							EndIf
							GUICtrlSetData($label_gameName, $Cover[$_Move / $Cover_Distance][1])
              ;Default setting was 10 changed to my setting is witch is 5
							If $i > 10 Then
								$TextMX += 50
								$TextMY += 5
								ControlMove($parentgui, "", $label_gameName, -1000 + $TextMX, $TextMY)
								GUICtrlSetFont($label_gameName, $GameNameSize, -1, -1, $GameNameFont, 3)
							EndIf
							Sleep(10)

						Next
					EndIf
				Until Not _IsPressed("01")
				_GUICtrlPic_SetImage($next, @ScriptDir&"\interface\Themes\"& $themeName & "\cross.png")
			EndIf

			$pervpos = ControlGetPos($parentgui, "", $perv)
			If $mausX > $pervpos[0] And $mausX < $pervpos[0] + $pervpos[2] And $mausY > $pervpos[1] And $mausY < $pervpos[1] + $pervpos[3] And _IsPressed("01") Then
				ConsoleWrite($pervpos[0])
				_GUICtrlPic_SetImage($perv, @ScriptDir&"\interface\Themes\"& $themeName & "\left.png")
				Do
					_View1($Centred_Game)
					If $_Move = 0 Then
					Else
						$TextMX = 0+IniRead($IniTheme, "TEXTE", "GameName-X", "")
				        $TextMY = 0+IniRead($IniTheme, "TEXTE", "GameName-Y", "")
						_SoundPlay($SoundFlip, 0)
						;Flowleft settings================================================this adjust flow speed
						;Default 20 my setting is 10
						For $i = 1 To 20
						     ;Default 20 my setting is 10
							$_Move -= $Cover_Distance / 20
							Draw($_Move)
							;Default setting was 10 changed to my setting is witch is 5
							If $i <= 10 Then
								$TextMX -= 50
								$TextMY -= 5
								ControlMove($parentgui, "", $label_gameName, $TextMX, $TextMY)
								GUICtrlSetFont($label_gameName, $GameNameSize - $i, -1, -1, $GameNameFont, 3)
							EndIf

							GUICtrlSetData($label_gameName, $Cover[$_Move / $Cover_Distance][1])
							;Default setting was 10 changed to my setting is witch is 5
							If $i > 10 Then
								$TextMX += 50
								$TextMY += 5
								ControlMove($parentgui, "", $label_gameName, -$TextMX, $TextMY)
								GUICtrlSetFont($label_gameName, $GameNameSize, -1, -1, $GameNameFont, 3)
							EndIf
							Sleep(10)
						Next
					EndIf
				Until Not _IsPressed("01")
				_GUICtrlPic_SetImage($next, @ScriptDir&"\interface\Themes\"& $themeName & "\cross.png")
			EndIf

	EndSwitch

	If BitAND(WinGetState($parentgui, ""), 8) Or BitAND(WinGetState($Main_Flow_gui, ""), 8) Or _
			BitAND(WinGetState($device, ""), 8) Or BitAND(WinGetState($Info_child_Gui, ""), 8) Or _
			BitAND(WinGetState($Info_child_Gui_trans), 8) Or BitAND(WinGetState($Settingsgui), 8) Then

		$Centred_Game = $_Move / $Cover_Distance

		If _IsPressed("02") Then ; RIGHT CLICK SHOW GAME INFO 	; Step 6: Playing sound effects
			$mouse_pos = MouseGetPos(0)
			Local $coll = GetSceneNodeFromScreenCoordinatesBB(MouseGetPos(0), MouseGetPos(1))
			For $i = 0 To $Gamer_count Step 1
				If $coll = $Cover[$i][0] And $coll = $Cover[$Centred_Game][0] And $stateSettings = 0 Then

					If $stateSettings = 1 Then
						GUISetState(@SW_HIDE, $Settingsgui)
						_WinAnimate($SettingsguiTrans, BitOR($AW_HIDE, $AW_CENTER), 300)
						$stateSettings = 0
					EndIf

					For $im = 0 To $Gamer_count Step 1
						SetVisible($Cover_refletLeft[$im], 0)
						SetVisible($Cover_refletRight[$im], 0)
					Next
					_SoundPlay($SoundFlip, 0)
					For $deg = 0 To 180 Step 5
						BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
						SetRotation($Cover[$Centred_Game][0], 0, $deg, 0)
						RemoveAnimators($Cover[$Centred_Game][0])
						SetPosition($Cover[$Centred_Game][0], GetAbsolutePosition($Cover[$Centred_Game][0], "X") + 2, 0, GetAbsolutePosition($Cover[$Centred_Game][0], "Z") + 5.5)
						AddCameraSceneNode(0, 0, 0, $deg + 200, 0, 0, 0)
						SceneDraw()
						GuiDraw()
						EndScene()
						Sleep(1)
					Next

					$Centred_GameMovement = createFlyCircleAnimator(GetAbsolutePosition($Cover[$Centred_Game][0], "X"), GetAbsolutePosition($Cover[$Centred_Game][0], "Y"), GetAbsolutePosition($Cover[$Centred_Game][0], "Z"), 5, 0.0003, 0, 1, 0)
					AddAnimator($Cover[$Centred_Game][0], $Centred_GameMovement)
					_WinAnimate($Info_child_Gui_trans, $AW_HOR_NEGATIVE, 200)
					_WinAnimate($Info_child_Gui, $AW_HOR_NEGATIVE, 20)
					$ModeFlow = 0
					For $t = 0 To 100 Step 5
						If $t < 50 Then
							ControlMove($parentgui, "", $label_gameName, 0, 550 + $t)
						Else
							ControlMove($parentgui, "", $label_gameName, 524, -50 + $t, 500)
						EndIf
						Sleep(1)
					Next
				EndIf

				If $coll = $Cover_Back[$i] And $coll = $Cover_Back[$Centred_Game] Then

					$camVi = 380
					_SoundPlay($SoundFlip, 0)
					For $deg = 180 To 0 Step -5
						$camVi -= 5
						BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
						SetRotation($Cover[$Centred_Game][0], 0, $deg, 0)
						RemoveAnimators($Cover[$Centred_Game][0])
						SetPosition($Cover[$Centred_Game][0], GetAbsolutePosition($Cover[$Centred_Game][0], "X") - 2, 0, GetAbsolutePosition($Cover[$Centred_Game][0], "Z") - 5.5)
						AddCameraSceneNode(0, 0, 0, $camVi, 0, 0, 0)
						SceneDraw()
						GuiDraw()
						EndScene()
						Sleep(1)
					Next

					For $im = 0 To $Gamer_count Step 1
						SetVisible($Cover_refletLeft[$im], 1)
						SetVisible($Cover_refletRight[$im], 1)
					Next
					For $t = 0 To 50 Step 10
						ControlMove($parentgui, "", $label_gameName, 0, 600 - $t, 1024)
						Sleep(1)
					Next
					Draw($_Move)
					_WinAnimate($Info_child_Gui, BitOR($AW_HIDE, $AW_HOR_POSITIVE), 20)
					_WinAnimate($Info_child_Gui_trans, BitOR($AW_HIDE, $AW_HOR_POSITIVE), 200)

					$ModeFlow = 1
				EndIf
			Next

		EndIf

		If _IsPressed("01") Or _IsPressed("0D") Then		; Step 7: Reading and writing configuration settings from an INI file

			$play = 0

			$mouse_pos = MouseGetPos(0)
			Local $coll = GetSceneNodeFromScreenCoordinatesBB(MouseGetPos(0), MouseGetPos(1))
			For $i = 0 To $Gamer_count Step 1
			   If $coll = $Cover[$i][0] And $coll = $Cover[$Centred_Game][0] And $stateSettings = 0 Then

				  GUISetState(@SW_HIDE, $Main_Flow_gui)
				  GUISetState(@SW_DISABLE,$Main_Flow_gui)
				  GUISetState(@SW_HIDE, $parentgui)
				  GUISetState(@SW_DISABLE, $parentgui)

				  Local $Game_Path=IniRead(@ScriptDir & "\Config.ini","Xenia","Xbox 360 Game Path","")
                  Local $Xenia_Path=IniRead(@ScriptDir & "\Config.ini","Xenia","Xenia Path","")

                  Local $hsearch1 = FileFindFirstFile($Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & "*.xex")
				  Local $iresult = $idok, $sfilename1 = FileFindNextFile($hsearch1)
				  $extension1 = StringReplace(StringRight($sfilename1,4),".","")
				  $name = StringLeft($sfilename1,6)

				  Global  $Movie_Path=IniRead(@ScriptDir & "\Config.ini","Movies","Path","")
				  Local $hsearch2 = FileFindFirstFile($Movie_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & "*.mp4")
				  Local $iresult = $idok, $sfilename2 = FileFindNextFile($hsearch2)
				  $extension2 = StringReplace(StringRight($sfilename2,4),".","")

				  Local $hsearch3 = FileFindFirstFile($Movie_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & "*.avi")
				  Local $iresult = $idok, $sfilename3 = FileFindNextFile($hsearch3)
				  $extension3 = StringReplace(StringRight($sfilename3,4),".","")

				  Local $hsearch4 = FileFindFirstFile($Movie_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & "*.mkv")
				  Local $iresult = $idok, $sfilename4 = FileFindNextFile($hsearch4)
				  $extension4 = StringReplace(StringRight($sfilename4,4),".","")

				  ;Sleep(500)

				  If $extension2 = "mp4" Or $extension3 = "avi" Or $extension4 = "mkv" And $play = 0 Then; And $name = "default" Then ; Code to play a movie using VLC media player

					 ;Local $Movie_Path=IniRead(@ScriptDir & "\Config.ini","Movies","Path","")

					 For $i = 2 To 4 Step 1
						Sleep(10)
						If $i = 2 Then
						   Local $ext = "mp4"
					    ElseIf $i = 3 Then
						    Local $ext = "avi"
						ElseIf $i = 4 Then
							 Local $ext = "mkv"
						EndIf
						Local $hsearch = FileFindFirstFile($Movie_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & "*." & $ext)
                        Local $iresult = $idok, $sfilename = FileFindNextFile($hsearch)
					 Next

					 Local $vlc_path = IniRead(@ScriptDir & "\Config.ini","Movies","VLC Path","")
					 ;Local $wmplayer_path = "C:\Program Files\Windows Media Player\wmplayer.exe"

					 If FileExists($vlc_path) Then
					    If IniRead(@ScriptDir & "\Config.ini","Movies","FullScreen","") = "On" Then
						   $play = 1
					       RunWait( $vlc_path & " --fullscreen " & '"' & $Movie_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename & '"')
						   $play = 0
						Else
						   $play = 1
					       RunWait( $vlc_path & " " & '"' & $Movie_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename & '"')

					    EndIf
					 Else

						;MsgBox(0, $Titel, "Please install VLC to get best video experience" & @CR & "Other player will probably supported later.")

						SplashTextOn( $Titel, "Please install VLC to get best video experience" & @CRLF & "Other player will probably supported later.", 700, 300, -1, -1, 33, "", 20, 800)
						Sleep(5000)
						SplashOff()

					 EndIf
				  EndIf

				  If $extension1 = "xex" And $play = 0 Then; And $name = "default" Then ; Code to launch a game using the Xenia emulator

					 If IniRead(@ScriptDir & "\Config.ini","Xenia","FullScreen","") = "On" Then
						If IniRead(@ScriptDir & "\Config.ini","Xenia","vsync","") = "On" Then
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "0" Then RunWait('"' & $Xenia_Path & '" --fullscreen vsync=true ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "1" Then RunWait('"' & $Xenia_Path & '" --fullscreen vsync=true d3d12_resolution_scale=1 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
					       If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "2" Then RunWait('"' & $Xenia_Path & '" --fullscreen vsync=true d3d12_resolution_scale=2 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						Else
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "0" Then RunWait('"' & $Xenia_Path & '" --fullscreen ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "1" Then RunWait('"' & $Xenia_Path & '" --fullscreen d3d12_resolution_scale=1 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
					       If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "2" Then RunWait('"' & $Xenia_Path & '" --fullscreen d3d12_resolution_scale=2 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						EndIf
					 Else
						If IniRead(@ScriptDir & "\Config.ini","Xenia","vsync","") = "On" Then
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "0" Then RunWait('"' & $Xenia_Path & '" vsync=true ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "1" Then RunWait('"' & $Xenia_Path & '" vsync=true d3d12_resolution_scale=1 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
					       If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "2" Then RunWait('"' & $Xenia_Path & '" vsync=true d3d12_resolution_scale=2 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
					    Else
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "0" Then RunWait('"' & $Xenia_Path & '" ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "1" Then RunWait('"' & $Xenia_Path & '" d3d12_resolution_scale=1 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
					       If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "2" Then RunWait('"' & $Xenia_Path & '" d3d12_resolution_scale=2 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						EndIf
					 EndIf

				  ElseIf Not $extension1 = "xex" And $play = 0 Then

					 Local $Game_Path=IniRead(@ScriptDir & "\Config.ini","Xenia","Xbox 360 Game Path","")
					 Local $Xenia_Path=IniRead(@ScriptDir & "\Config.ini","Xenia","Xenia Path","")
                     Local $hsearch = FileFindFirstFile($Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & "*.*")
                     Local $iresult = $idok, $sfilename1 = FileFindNextFile($hsearch)

					 If IniRead(@ScriptDir & "\Config.ini","Xenia","FullScreen","") = "On" Then
						If IniRead(@ScriptDir & "\Config.ini","Xenia","vsync","") = "On" Then
						   if IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "0" Then RunWait('"' & $Xenia_Path & '" --fullscreen vsync=true ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "1" Then RunWait('"' & $Xenia_Path & '" --fullscreen vsync=true d3d12_resolution_scale=1 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
					       If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "2" Then RunWait('"' & $Xenia_Path & '" --fullscreen vsync=true d3d12_resolution_scale=2 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
					    Else
						   if IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "0" Then RunWait('"' & $Xenia_Path & '" --fullscreen ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "1" Then RunWait('"' & $Xenia_Path & '" --fullscreen d3d12_resolution_scale=1 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
					       If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "2" Then RunWait('"' & $Xenia_Path & '" --fullscreen d3d12_resolution_scale=2 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						EndIf
					 Else
						If IniRead(@ScriptDir & "\Config.ini","Xenia","vsync","") = "On" Then
						   if IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "0" Then RunWait('"' & $Xenia_Path & '" vsync=true ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "1" Then RunWait('"' & $Xenia_Path & '" vsync=true d3d12_resolution_scale=1 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
					       If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "2" Then RunWait('"' & $Xenia_Path & '" vsync=true d3d12_resolution_scale=2 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
					    Else
						   if IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "0" Then RunWait('"' & $Xenia_Path & '" ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						   If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "1" Then RunWait('"' & $Xenia_Path & '" d3d12_resolution_scale=1 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
					       If IniRead(@ScriptDir & "\Config.ini","Xenia","d3d12_resolution_scale","") = "2" Then RunWait('"' & $Xenia_Path & '" d3d12_resolution_scale=2 ' & '"' & $Game_Path & "\" & $cover[$_move / $cover_distance][1] & "\" & $sfilename1 & '"')
						EndIf
					 EndIf
				  EndIf
               EndIf
			Next

			GUISetState(@SW_SHOW, $Main_Flow_gui)
			GUISetState(@SW_ENABLE,$Main_Flow_gui)
			GUISetState(@SW_SHOW, $parentgui)
			GUISetState(@SW_ENABLE,$parentgui)
			$play = 0

		EndIf

		If _IsPressed("27") Then ; Flow Right
			_GUICtrlPic_SetImage($next, @ScriptDir&"\interface\Themes\"& $themeName & "\right.png")
			_View1($Centred_Game)
			If $_Move = $Gamer_count * $Cover_Distance Then
			Else

				$TextMX = 0+IniRead($IniTheme, "TEXTE", "GameName-X", "")
				$TextMY = 0+IniRead($IniTheme, "TEXTE", "GameName-Y", "")

				_SoundPlay($SoundFlip, 0)
				For $i = 1 To 20
					$_Move += $Cover_Distance / 20
					Draw($_Move)

					If $i <= 10 Then
						$TextMX += 50
						$TextMY -= 5
						ControlMove($parentgui, "", $label_gameName, $TextMX, $TextMY)
						GUICtrlSetFont($label_gameName, $GameNameSize - $i, -1, -1, $GameNameFont, 3)
					EndIf
					GUICtrlSetData($label_gameName, $Cover[$_Move / $Cover_Distance][1])

					If $i > 10 Then
						$TextMX += 50
						$TextMY += 5
						ControlMove($parentgui, "", $label_gameName, -1000 + $TextMX, $TextMY)
						GUICtrlSetFont($label_gameName, $GameNameSize, -1, -1, $GameNameFont, 3)

					EndIf
					Sleep(10)

				Next
			EndIf

         Else
			_GUICtrlPic_SetImage($next, @ScriptDir&"\interface\Themes\"& $themeName & "\cross.png")
		EndIf

		If _IsPressed("25") Then ; Flow Left
			_GUICtrlPic_SetImage($perv, @ScriptDir&"\interface\Themes\"& $themeName & "\left.png")
			_View1($Centred_Game)
			If $_Move = 0 Then
			Else
				$TextMX = 0+IniRead($IniTheme, "TEXTE", "GameName-X", "")
			    $TextMY = 0+IniRead($IniTheme, "TEXTE", "GameName-Y", "")
				_SoundPlay($SoundFlip, 0)
				For $i = 1 To 20
					$_Move -= $Cover_Distance / 20
					Draw($_Move)
					If $i <= 10 Then
						$TextMX -= 50
						$TextMY -= 5
						ControlMove($parentgui, "", $label_gameName, $TextMX, $TextMY)
						GUICtrlSetFont($label_gameName, $GameNameSize - $i, -1, -1, $GameNameFont, 3)
					EndIf

					GUICtrlSetData($label_gameName, $Cover[$_Move / $Cover_Distance][1])
					If $i > 10 Then
						$TextMX += 50
						$TextMY += 5
						ControlMove($parentgui, "", $label_gameName, -$TextMX, $TextMY)
						GUICtrlSetFont($label_gameName, $GameNameSize, -1, -1, $GameNameFont, 3)
					EndIf
					Sleep(10)
				Next
			EndIf
         Else
			_GUICtrlPic_SetImage($perv, @ScriptDir&"\interface\Themes\"& $themeName & "\cross.png")
		EndIf
	EndIf
	If $Y < 0 Then $Y += 360
	If $Y > 360 Then $Y -= 360
	$Y += 0.5

WEnd
;____________________________________________________________________________Function______________________________________________________________________________________________;

Func WM_NCHITTEST($hWnd, $iMsg, $iwParam, $ilParam)
	If ($hWnd = $Main_Flow_gui) And ($iMsg = $WM_NCHITTEST) Then Return $HTCAPTION
EndFunc   ;==>WM_NCHITTEST

Func _WinAnimate($hWnd, $iFlags, $iTime = 1000, $vUser32Dll = 'user32.dll')
	Local $aReturn = DllCall($vUser32Dll, 'int', 'AnimateWindow', 'hwnd', $hWnd, 'int', $iTime, 'long', $iFlags)
	Return $aReturn[0]
EndFunc   ;==>_WinAnimate

;_______________________________________________________________________FlowMode Start____________________________________________________________________________________________;
;Individual Flow Mode Functions:                                                                                                                                                  ;
;Each flow mode (0, 1, 2, 3) exetra has its own set of conditions and animations, encapsulated within the corresponding If blocks.                                                ;
;Functions such as beginscene, endscene, SceneDraw, GuiDraw, createflycircleanimator, addanimator, setrotation, setvisible, and createFlyCircleAnimator                           ;
;are used for managing the scene, drawing, animations, and cover properties.                                                                                                      ;
;Conditions such as IniRead($ini, "GUI", "FlowMode", "") are used to determine the current flow mode based on the theme settings.                                                 ;
;                                                                                                                                                                                 ;
;Common Elements:                                                                                                                                                                 ;
;The script uses common functions like setrotation, setvisible, createFlyCircleAnimator, etc., to manage the rotation, visibility, and animation of covers.                       ;
;Conditions based on cover positions determine which animations and rotations to apply.                                                                                           ;
;The script utilizes the IniRead function to read configuration settings from an INI file, such as the current flow mode or specific theme settings.                              ;
;                                                                                                                                                                                 ;
;General Flow:                                                                                                                                                                    ;
;1.Determine the current flow mode based on the theme settings.                                                                                                                   ;
;2.Execute the corresponding block of code for the determined flow mode.                                                                                                          ;
;3.Perform cover animations, rotations, and visibility adjustments based on conditions.                                                                                           ;
;4.Update the scene and GUI accordingly.                                                                                                                                          ;
;_________________________________________________________________________________________________________________________________________________________________________________;
Func draw($start_point)

;###################################################################################################################################################################;
;FlowMode#1 Default=================================================================================================================================================;

;The iF Function Starts FlowMode EG: If IniRead($ini, "GUI", "FlowMode", "") = "1" Then.....every other flowmode uses case example. ElseIf IniRead($ini, "GUI", "FlowMode", "") = "2" Then
If IniRead($ini, "GUI", "FlowMode", "") = "1" Then
    BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	$Cover_Distance = 70
	 Global $cover_distance = 70
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	EndIf

	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -90 And $Cover_Position[$i] < 90 Then
			SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)
			$CoverRunAnimator1 = createflycircleanimator($Cover_Position[$i], 0, (90 - Abs($Cover_Position[$i])) / 1.4, 0, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)

			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 540 Then
			SetRotation($Cover[$i][0], 0, -90, 0)
			$CoverRunAnimator2 = createflycircleanimator($Cover_Position[$i], 0, 0, 9, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -540 Then
			SetRotation($Cover[$i][0], 0, 90, 0)
			$CoverRunAnimator3 = createflycircleanimator($Cover_Position[$i], 0, 0, 9, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)
		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
;FlowMode#2 Flat===========================================================================================================================;
 ElseIf IniRead($ini, "GUI", "FlowMode", "") = "2" Then
    BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	  ; Global Variable: $Cover_Distance
    ; This variable represents the distance between cover elements.
    Global $cover_distance = 140
    If StringInStr($start_point / $cover_distance, ".") = 0 Then
        GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
    EndIf

    For $i = 0 To $gamer_count
        $cover_position[$i] = $start_point + ($i * -$cover_distance)
        If $cover_position[$i] > -90 AND $cover_position[$i] < 90 Then
            setrotation($cover[$i][0], 0, 0, 0)
            If IniRead($Ini, "GUI", "NoZoom", "") = "On" Then
                $coverrunanimator = createflycircleanimator($cover_position[$i], 3, 0, 0, 0.0003, 0, 1, 0)
                addanimator($cover[$i][0], $coverrunanimator)
            Else
                $coverrunanimator1 = createflycircleanimator($cover_position[$i], 0, (90 - Abs($cover_position[$i])) / 1.4, 0, 0.0003, 0, 1, 0)
                addanimator($cover[$i][0], $coverrunanimator1)
            EndIf
            setvisible($cover[$i][0], 1)
        ElseIf $cover_position[$i] > 0 AND $cover_position[$i] < 540 Then
            setrotation($cover[$i][0], 0, 0, 0)
            If IniRead($Ini, "GUI", "NoZoom", "") = "On" Then
                $coverrunanimator2 = createflycircleanimator($cover_position[$i], 3, 0, 0, 0.0003, 0, 1, 0)
                addanimator($cover[$i][0], $coverrunanimator2)
            Else
                $coverrunanimator2 = createflycircleanimator($cover_position[$i], 3, 0, 0, 0.0003, 0, 1, 0)
                addanimator($cover[$i][0], $coverrunanimator2)
            EndIf
            setvisible($cover[$i][0], 1)
        ElseIf $cover_position[$i] < 0 AND $cover_position[$i] > -540 Then
            setrotation($cover[$i][0], 0, 0, 0)
            If IniRead($Ini, "GUI", "NoZoom", "") = "On" Then
                $coverrunanimator3 = createflycircleanimator($cover_position[$i], 0, 0, 0, 0.0003, 0, 1, 0)
                addanimator($cover[$i][0], $coverrunanimator3)
            Else
                $coverrunanimator3 = createflycircleanimator($cover_position[$i], 0, 0, 0, 0.0003, 0, 1, 0)
                addanimator($cover[$i][0], $coverrunanimator3)
            EndIf
            setvisible($cover[$i][0], 1)
        Else
            setvisible($cover[$i][0], 0)
        EndIf
    Next

    SceneDraw()
    GuiDraw()
    EndScene()
;FlowMode#3 Pyramid===========================================================================================================================;
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "3" Then
    BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
    ; Global Variable: $Cover_Distance
    ; This variable represents the distance between cover elements.
    Global $Cover_Distance = 140
    If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
        GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
    EndIf

    For $i = 0 To $Gamer_count
        ; Calculating Cover Positions:
        ; $Cover_Position[$i] = $Start_point + ($i * -$Cover_Distance): Calculates the position of each cover element based on the start point and the cover distance.
        ; This calculation determines the spacing between each cover element along a certain axis
        $Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
        ; Rotation Settings: Rotates the cover element around the y-axis (0 rotation in x and z) based on the negative of its position
        If $Cover_Position[$i] > -999 And $Cover_Position[$i] < 999 Then
            SetRotation($Cover[$i][1], 0, -$Cover_Position[$i], 0)
            $CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-90 - Abs($Cover_Position[$i])) / 2.8, 0, 0.0008, 0, 8, 0)
            AddAnimator($Cover[$i][0], $CoverRunAnimator1)
            SetVisible($Cover[$i][0], 1)
        ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 999 Then
            SetRotation($Cover[$i][0], 0, -90, 0)
            ; Rotates the cover element around the y-axis (0 rotation in x and z) to a fixed angle of -90 degrees.
            ; This case sets a fixed rotation for the cover element when its position is in a certain range.
            ;
            ; Create animators for a different type of circular motion based on the position of the cover element.
            $CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
            AddAnimator($Cover[$i][0], $CoverRunAnimator2)
            SetVisible($Cover[$i][0], 1)
        ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -999 Then
            SetRotation($Cover[$i][0], 0, 90, 0)
            ; Rotates the cover element around the y-axis (0 rotation in x and z) to a fixed angle of 90 degrees.
            ; Similar to Case 2, but for negative positions.
            ;
            ; Create animators for a different type of circular motion based on the position of the cover element.
            $CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
            AddAnimator($Cover[$i][0], $CoverRunAnimator3)
            SetVisible($Cover[$i][0], 1)
        Else
            SetVisible($Cover[$i][0], 0)
        EndIf
    Next
    SceneDraw()
    GuiDraw()
    EndScene()
;FlowMode#4 LineDance===========================================================================================================================;
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "4" Then
    BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
    Global $Cover_Distance = 100
    If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
        GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
    EndIf

    For $i = 0 To $Gamer_count
        $Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
        If $Cover_Position[$i] > -840 And $Cover_Position[$i] < 840 Then
            SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)
            $CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-90 - Abs($Cover_Position[$i])) / 2.8, 0, 0.0008, 0, 8, 0)
            AddAnimator($Cover[$i][0], $CoverRunAnimator1)
            SetVisible($Cover[$i][0], 1)
        ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 840 Then
            SetRotation($Cover[$i][0], -90, 90, -90)
            $CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 2.8, 0, 0, 0.0008, 0, 8, 0)
            AddAnimator($Cover[$i][0], $CoverRunAnimator2)
            SetVisible($Cover[$i][0], 1)
        ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -840 Then
            SetRotation($Cover[$i][0], 90, -90, 90)
            $CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 2.8, 0, 0, 0.0008, 0, 8, 0)
            AddAnimator($Cover[$i][0], $CoverRunAnimator3)
            SetVisible($Cover[$i][0], 1)
        Else
            SetVisible($Cover[$i][0], 0)
        EndIf
    Next
    SceneDraw()
    GuiDraw()
    EndScene()
;FlowMode#5 PyramidSharp==========================================================================================================================;
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "5" Then
    BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
    Global $cover_distance = 110
    If StringInStr($start_point / $cover_distance, ".") = 0 Then
    EndIf
    For $i = 0 To $gamer_count
        $cover_position[$i] = $start_point + ($i * -$cover_distance)
        If $cover_position[$i] > -840 AND $cover_position[$i] < 840 Then
            SetRotation($cover[$i][0], 0, 0, 0)
            $coverrunanimator1 = createflycircleanimator($cover_position[$i], 0, (-90 - Abs($cover_position[$i])) / 2.0, 0, 0.0003, 0, 1, 0)
            AddAnimator($cover[$i][0], $coverrunanimator1)
            SetVisible($cover[$i][0], 1)
        ElseIf $cover_position[$i] > 0 AND $cover_position[$i] < 840 Then
            SetRotation($cover[$i][0], -90, 90, -90)
            $coverrunanimator2 = createflycircleanimator($cover_position[$i], 5, 0, 0, 0.0003, 0, 9, 0)
            AddAnimator($cover[$i][0], $coverrunanimator2)
            SetVisible($cover[$i][0], 1)
        ElseIf $cover_position[$i] < 0 AND $cover_position[$i] > -840 Then
            SetRotation($cover[$i][0], 90, -90, 90)
            $coverrunanimator3 = createflycircleanimator($cover_position[$i], 5, 0, 0, 0.0003, 0, 9, 0)
            AddAnimator($cover[$i][0], $coverrunanimator3)
            SetVisible($cover[$i][0], 1)
        Else
            SetVisible($cover[$i][0], 0)
        EndIf
    Next
    SceneDraw()
    GuiDraw()
    EndScene()
;FlowMode#6 DefaultLarge===========================================================================================================================;
 ElseIf IniRead($ini, "GUI", "FlowMode", "") = "6" Then
    BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
    Global $cover_distance = 70
    If StringInStr($start_point / $cover_distance, ".") = 0 Then
        GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
    EndIf

    For $i = 0 To $Gamer_count
        $Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
        If $Cover_Position[$i] > -90 And $Cover_Position[$i] < 90 Then
            SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)

            If IniRead($INI, "GUI", "AnimateCover", "") = "On" Then
                $CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (90 - Abs($Cover_Position[$i])) / 1.5, 5, 0.0003, 0, 1, 0)
                AddAnimator($Cover[$i][0], $CoverRunAnimator1)
            Else
                $CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (90 - Abs($Cover_Position[$i])) / 1.5, 0, 0.0003, 0, 1, 0)
                AddAnimator($Cover[$i][0], $CoverRunAnimator1)
            EndIf

            SetVisible($Cover[$i][0], 1)
        ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 540 Then
            SetRotation($Cover[$i][0], 0, -90, 0)

            If IniRead($INI, "GUI", "AnimateCover", "") = "On" Then
                $CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 0, 0.0003, 0, 1, 0)
                AddAnimator($Cover[$i][0], $CoverRunAnimator2)
            Else
                $CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 0, 0.0003, 0, 1, 0)
                AddAnimator($Cover[$i][0], $CoverRunAnimator2)
            EndIf

            SetVisible($Cover[$i][0], 1)
        ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -540 Then
            SetRotation($Cover[$i][0], 0, 90, 0)

            If IniRead($INI, "GUI", "AnimateCover", "") = "On" Then
                $CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 0, 0.0003, 0, 1, 0)
                AddAnimator($Cover[$i][0], $CoverRunAnimator3)
            Else
                $CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 0, 0.0003, 0, 1, 0)
                AddAnimator($Cover[$i][0], $CoverRunAnimator3)
             EndIf
            SetVisible($Cover[$i][0], 1)
        Else
            SetVisible($Cover[$i][0], 0)
        EndIf
	 Next
    SceneDraw()
    GuiDraw()
    EndScene()
;FlowMode#7 IDK======================================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "7" Then

	BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	Global $Cover_Distance = 90
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	EndIf

	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -999 And $Cover_Position[$i] < 999 Then
			SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)

			If IniRead($INI, "GUI", "AnimateCover", "") = "On" then
			   $CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (110 - Abs($Cover_Position[$i])) / 1.8, 8, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			Else
			   $CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (110 - Abs($Cover_Position[$i])) / 1.8, 0, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
            EndIf

			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 999 Then
			SetRotation($Cover[$i][0], 0, -90, 0)

			If IniRead($INI, "GUI", "AnimateCover", "") = "On" then
			   $CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			Else
			   $CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 0, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
            EndIf

			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -999 Then
			SetRotation($Cover[$i][0], 0, 90, 0)

			If IniRead($INI, "GUI", "AnimateCover", "") = "On" then
			   $CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			Else
			   $CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 0, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
            EndIf

			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)
		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
;FlowMode#8 Cascade With Rotation====================================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "8" Then

	BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	$Cover_Distance = 70
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	EndIf

	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -840 And $Cover_Position[$i] < 840 Then
			SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)
			$CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-90 - Abs($Cover_Position[$i])) / 1.8, 0, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 840 Then
			SetRotation($Cover[$i][0], -90, 90, -90)
			$CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 1.8, 0, 0, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -840 Then
			SetRotation($Cover[$i][0], 90, -90, 90)
			$CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 1.8, 0, 0, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)

		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
;FlowMode#9 Cascade No Rotation Close Together==========================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "9" Then

	BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	$Cover_Distance = 70
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	EndIf

	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -840 And $Cover_Position[$i] < 840 Then
			SetRotation($Cover[$i][1], 0, -$Cover_Position[$i], 0)
			$CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-90 - Abs($Cover_Position[$i])) / 1.8, 0, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 840 Then
			SetRotation($Cover[$i][0], -90, 90, -90)
			$CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 1.8, 0, 0, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -840 Then
			SetRotation($Cover[$i][0], 90, -90, 90)
			$CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 1.8, 0, 0, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)
		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
;FlowMode#10 Cascade With Rotation Far Apart===============================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "10" Then
	 BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	 $Cover_Distance = 120
	 If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	EndIf
	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -9999 And $Cover_Position[$i] < 9999 Then
			SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)
			$CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-200 - Abs($Cover_Position[$i])) / 1.8, 8, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 9999 Then
			SetRotation($Cover[$i][0], 0, -90, 0)
			$CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -9999 Then
			SetRotation($Cover[$i][0], 0, 90, 0)
			$CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)
		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
	;FlowMode#11 Cascade No Rotation Far Appart==========================================================================================================

 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "11" Then

	BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	$Cover_Distance = 120
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	EndIf
	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -9999 And $Cover_Position[$i] < 9999 Then
			SetRotation($Cover[$i][1], 0, -$Cover_Position[$i], 0)
			$CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-200 - Abs($Cover_Position[$i])) / 1.8, 0, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 9999 Then
			SetRotation($Cover[$i][0], 90, 90, 90)
			$CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 1.8, 0, 8, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -9999 Then
			SetRotation($Cover[$i][0], 90, 90, 90)
			$CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 1.8, 0, 8, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)

		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
	;FlowMode#12 Cascade Big Box No Rotation Far Apart====================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "12" Then

	BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	$Cover_Distance = 120
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	EndIf
For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -999 And $Cover_Position[$i] < 999 Then
			SetRotation($Cover[$i][1], 0, -$Cover_Position[$i], 0)
			$CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (20 - Abs($Cover_Position[$i])) / 1.8, 8, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 999 Then
			SetRotation($Cover[$i][0], 0, -90, 0)
			$CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -999 Then
			SetRotation($Cover[$i][0], 0, 90, 0)
			$CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)
		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
		;FlowMode#13 Cascade Big Box With Rotation Far Apart============================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "13" Then

		BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)

$Cover_Distance = 90
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	EndIf
	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -999 And $Cover_Position[$i] < 999 Then
			SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)
			$CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (20 - Abs($Cover_Position[$i])) / 1.8, 8, 0.0008, 0, 8, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 999 Then
			SetRotation($Cover[$i][0], 0, -90, 0)
			$CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -999 Then
			SetRotation($Cover[$i][0], 0, 90, 0)
			$CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)
		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
	;FlowMode#14 Fourteen===========================================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "14" Then

	BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	$Cover_Distance = 100
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	EndIf
	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -600 And $Cover_Position[$i] < 600 Then
			SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)
			$CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-1000 - Abs($Cover_Position[$i])) / 9.99, 0, 0.0009, 0, 99, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 600 Then
			SetRotation($Cover[$i][1], 0, -99, 0)
			$CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 9.99, 0, 99, 0.0009, 0, 99, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -600 Then
			SetRotation($Cover[$i][1], 0, -99, 0)
			$CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 9.99, 0, 99, 0.0009, 0, 99, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)

		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
		;FlowMode#15 Fifteen=====================================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "15" Then
	BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	$Cover_Distance = 100
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	 EndIf
	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -1280 And $Cover_Position[$i] < 1280 Then
			SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)
			$CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-1280 - Abs($Cover_Position[$i])) / 6.99, 0, 0.0009, 0, 0, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 1280 Then
			SetRotation($Cover[$i][1], 0, -90, 0)
			$CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 6.99, 0, 0, 0.0009, 0, 0, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -1280 Then
			SetRotation($Cover[$i][1], 0, -90, 0)
			$CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 6.99, 0, 0, 0.0009, 0, 0, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)
		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
	;FlowMode#156Sixteen========================================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "16" Then
        BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	$Cover_Distance = 100
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	 EndIf
	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -1280 And $Cover_Position[$i] < 1280 Then
			SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)
			$CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-1280 - Abs($Cover_Position[$i])) / 5.00, 0, 0.0009, 0, 0, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 1280 Then
			SetRotation($Cover[$i][1], 0, -90, 0)
			$CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 5.00, 0, 0, 0.0009, 0, 0, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -1280 Then
			SetRotation($Cover[$i][1], 0, -90, 0)
			$CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 5.00, 0, 0, 0.0009, 0, 0, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)
		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
	;FlowMode#17 Seventeen======================================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "17" Then
        BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	$Cover_Distance = 100
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	 EndIf
	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -720 And $Cover_Position[$i] < 720 Then
			SetRotation($Cover[$i][0], 350, -$Cover_Position[$i], 350)
			$CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-720 - Abs($Cover_Position[$i])) / 5.00, 0, 0.0001, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 720 Then
			SetRotation($Cover[$i][1], -90, -360, -90)
			$CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 5.00, 0, 1, 0.0005, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -720 Then
			SetRotation($Cover[$i][1], -90, -360, -90)
			$CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 5.00, 0, 1, 0.0005, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)
		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
		;FlowMode#18 Eightteen=================================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "18" Then
	BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
	$Cover_Distance = 225
	If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
		GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	 EndIf
	For $i = 0 To $Gamer_count
		$Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
		If $Cover_Position[$i] > -540 And $Cover_Position[$i] < 540 Then
			SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)
			$CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-90 - Abs($Cover_Position[$i])) / 5.0, 0, 0.0000, 0, 5, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator1)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 500 Then
			SetRotation($Cover[$i][0], 0, -90, 0)
			$CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator2)
			SetVisible($Cover[$i][0], 1)
		ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -500 Then
			SetRotation($Cover[$i][0], 0, -90, 0)
			$CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0003, 0, 1, 0)
			AddAnimator($Cover[$i][0], $CoverRunAnimator3)
			SetVisible($Cover[$i][0], 1)
		Else
			SetVisible($Cover[$i][0], 0)
		EndIf
	Next
	SceneDraw()
	GuiDraw()
	EndScene()
; FlowMode#19 Crazy================================================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "19" Then
    BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
    $Cover_Distance = 100
    If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
        GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	 EndIf
    For $i = 0 To $Gamer_count
        $Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
        If $Cover_Position[$i] > -1280 And $Cover_Position[$i] < 1280 Then
            SetRotation($Cover[$i][0], 1280, -$Cover_Position[$i], 1280)
            $CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (-200 - Abs($Cover_Position[$i])) / 9.0, 0, 9.0009, 9, 0, 9)
            AddAnimator($Cover[$i][0], $CoverRunAnimator1)
            SetVisible($Cover[$i][0], 1)
        ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 1280 Then
            SetRotation($Cover[$i][0], 90, 90, 90)
            $CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 9, 0, 9.0001, 9, 0, 9)
            AddAnimator($Cover[$i][0], $CoverRunAnimator2)
            SetVisible($Cover[$i][0], 1)
        ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -1280 Then
            SetRotation($Cover[$i][0], 90, 90, 90)
            $CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 9, 0, 9.0001, 9, 0, 9)
            AddAnimator($Cover[$i][0], $CoverRunAnimator3)
            SetVisible($Cover[$i][0], 1)
        Else
            SetVisible($Cover[$i][0], 0)
        EndIf
    Next
    SceneDraw()
    GuiDraw()
    EndScene()
; FlowMode#20 Throwmode===============================================================================================================================
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "20" Then
    BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
    $Cover_Distance = 1280
    If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
        GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	 EndIf
    For $i = 0 To $Gamer_count
        $Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
        If $Cover_Position[$i] > -1280 And $Cover_Position[$i] < 1280 Then
            SetRotation($Cover[$i][0], 0, -$Cover_Position[$i], 0)
            $CoverRunAnimator1 = createFlyCircleAnimator($Cover_Position[$i], 0, (0 - Abs($Cover_Position[$i])) / 0.5, 0, 5.0005, 5, 5, 5)
            AddAnimator($Cover[$i][0], $CoverRunAnimator1)
            SetVisible($Cover[$i][0], 1)
        ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 1280 Then
            SetRotation($Cover[$i][0], 0, -90, 0)
            $CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0005, 5, 5, 5)
            AddAnimator($Cover[$i][0], $CoverRunAnimator2)
            SetVisible($Cover[$i][0], 1)
        ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -1280 Then
            SetRotation($Cover[$i][0], 0, -90, 0)
            $CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 0, 0, 5, 0.0005, 5, 5, 5)
            AddAnimator($Cover[$i][0], $CoverRunAnimator3)
            SetVisible($Cover[$i][0], 1)
        Else
            SetVisible($Cover[$i][0], 0)
        EndIf
    Next
    SceneDraw()
    GuiDraw()
    EndScene()
; FlowMode#21 Spiral Vortex ================================================================================================================================
;"Spiral Vortex," Flowmode Tutorial & Explination
;The rotation of each cover element is calculated based on its position, creating a unique rotation angle for each element
 ElseIf IniRead($Ini, "GUI", "FlowMode", "") = "21" Then
    BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
;The cover distance is set.
    $Cover_Distance = 130
    If StringInStr($Start_point / $Cover_Distance, ".") = 0 Then
        GUICtrlSetData($Alphabet_gameName, StringUpper(StringLeft($Cover[$Start_point / $Cover_Distance][1], 1)))
	 EndIf
;The cover elements are divided into three regions based on their position:
;Inside the region of -2000 to 2000, the cover elements are rotated based on their position and animated.
    For $i = 0 To $Gamer_count
        $Cover_Position[$i] = $Start_point + ($i * - $Cover_Distance)
        If $Cover_Position[$i] > -2000 And $Cover_Position[$i] < 2000 Then
            SetRotation($Cover[$i][0], $Cover_Position[$i] / -20, -$Cover_Position[$i] / 10, $Cover_Position[$i] / -20)
            $CoverRunAnimator1 = CreateFlyCircleAnimator($Cover_Position[$i], 0, (0 - Abs($Cover_Position[$i])) / 2.0, 0, 5.0005, 5, 5, 5)
            AddAnimator($Cover[$i][0], $CoverRunAnimator1)
            SetVisible($Cover[$i][0], 1)
;For positive positions greater than 2000, the cover elements are rotated at a fixed angle (90, 90, 90) and animated with an animation.
        ElseIf $Cover_Position[$i] > 0 And $Cover_Position[$i] < 2000 Then
            SetRotation($Cover[$i][0], 90, 90, 90)
            $CoverRunAnimator2 = CreateFlyCircleAnimator($Cover_Position[$i], 20, 0.005, 0, 0, 0)
            AddAnimator($Cover[$i][0], $CoverRunAnimator2)
            SetVisible($Cover[$i][0], 1)
;or negative positions less than -2000, the cover elements are rotated at a fixed angle (-90, -90, -90) and animated with an animation.
        ElseIf $Cover_Position[$i] < 0 And $Cover_Position[$i] > -2000 Then
            SetRotation($Cover[$i][0], -90, -90, -90)
            $CoverRunAnimator3 = CreateFlyCircleAnimator($Cover_Position[$i], 20, 0.005, 0, 0, 0)
            AddAnimator($Cover[$i][0], $CoverRunAnimator3)
;The SetVisible function is used to show or hide cover elements based on their position.
            SetVisible($Cover[$i][0], 1)
        Else
            SetVisible($Cover[$i][0], 0)
        EndIf
	 Next
	 ;The scene is rendered and drawn using SceneDraw and GuiDraw after applying the transformations and animations.
    SceneDraw()
    GuiDraw()
    EndScene()
;This Function Ends FlowMode
EndIf
EndFunc   ;==>Draw
;_______________________________________________________________________FlowMode End______________________________________________________________________________________________;

Func _View1($Centred_Game_Reset)
	If $ModeFlow = 1 Then
	ElseIf $ModeFlow = 0 Then
		For $t = 0 To 50 Step 10
			ControlMove($parentgui, "", $label_gameName, 0, 600 - $t, 1024)
			Sleep(1)
		Next
		_WinAnimate($Info_child_Gui, BitOR($AW_HIDE, $AW_HOR_POSITIVE), 20)
		_WinAnimate($Info_child_Gui_trans, BitOR($AW_HIDE, $AW_HOR_POSITIVE), 200)
		$camVi = 380
		RemoveAnimators($Cover[$Centred_Game_Reset][0])

		For $deg = 180 To 0 Step -5
			$camVi -= 5
			BeginScene(True, True, 0, $icolor_red, $icolor_green, $icolor_blue)
			SetRotation($Cover[$Centred_Game_Reset][0], 0, $deg, 0)
			SetPosition($Cover[$Centred_Game_Reset][0], GetAbsolutePosition($Cover[$Centred_Game_Reset][0], "X") - 2, 0, GetAbsolutePosition($Cover[$Centred_Game_Reset][0], "Z") - 6)
			AddCameraSceneNode(0, 0, 0, $camVi, 0, 0, 0)
			SceneDraw()
			GuiDraw()
			EndScene()
			Sleep(1)
		Next

		For $im = 0 To $Gamer_count Step 1
			SetVisible($Cover_refletLeft[$im], 1)
			SetVisible($Cover_refletRight[$im], 1)
		Next

		$ModeFlow = 1
	EndIf
EndFunc   ;==>_View1

Func Load_games()
	$NopicTexture = GetTexture($themeDir & "\flatnopic.png")
	$TopTexture = GetTexture($themeDir & "\case_top.png")
	$RightTexture = GetTexture($themeDir & "\case_right.png")

	$gdi_hNoImage = _GDIPlus_ImageLoadFromFile($themeDir & "\flatnopic.png")
	$gdi_NoimageWidth = _GDIPlus_ImageGetWidth($gdi_hNoImage)
	$gdi_NoimageHeight = _GDIPlus_ImageGetHeight($gdi_hNoImage)
	$gdi_hClonImage = _GDIPlus_BitmapCloneArea($gdi_hNoImage, 0, 0, $gdi_NoimageWidth, $gdi_NoimageHeight, $GDIP_PXF32ARGB)
	_GDIPlus_ImageRotateFlip($gdi_hClonImage, 6)
	_GDIPlus_ImageSaveToFile($gdi_hClonImage, $TempFolder & "\flatnopicTrans.png")
	_WinAPI_DeleteObject($gdi_hClonImage)
	_GDIPlus_ImageDispose($gdi_hNoImage)


	$NopicTextureTrans = GetTexture($TempFolder & "\flatnopicTrans.png")
	Local $aFiles = ""

	If $Fileformat <> "" Then
		$formatcount = StringSplit($Fileformat, "|", 0)
		Dim $szDrive, $szDir, $szFName, $szExt

		For $j = 1 To $formatcount[0]
			If IniRead($INI, "BT", $formatcount[$j], -1) = 1 Then

			   ;FileDelete(@ScriptDir & "\Games\*." & $formatcount[$j])
			   ;FileDelete(@ScriptDir & "\Games\*.txt")

			   Sleep(10)

			   ;If FileExists(@ScriptDir & "\Movies.ini")
				  Local $Movies = IniRead(@ScriptDir & "\Config.ini","Movies","Path","")
				  Local $All_movies = _FileListToArray($Movies, "*", 2)

				  If IsArray($All_movies) Then
			         For $k = 1 To UBound($All_movies) -1
					    FileOpen(@TempDir & "\Games\" &  $All_movies[$k] & ".mp4", 1)

						If FileExists($Movies & "\" & $All_movies[$k] & "\folder.jpg") Then
						   If Not FileExists( @ScriptDir & "\Full\" &  $All_movies[$k] & ".png") Then
						      FileCopy($Movies & "\" & $All_movies[$k] & "\folder.jpg", @ScriptDir & "\Full\" &  $All_movies[$k] & ".jpg", 1)
						   EndIf
						EndIf
			         Next
			      EndIf

			   ;EndIf

			   Sleep(10)


			   Local $Games = IniRead(@ScriptDir & "\Config.ini","Xenia","Xbox 360 Game Path","")
			   Local $All_games = _FileListToArray($Games, "*", 2)

			   If IsArray($All_games) Then
			      For $k = 1 To UBound($All_games) -1
					 FileOpen(@TempDir & "\Games\" &  $All_games[$k] & ".xex", 1)
			      Next
			   EndIf

				;Local $All_aFiles = _FileListToArray(@ScriptDir & "\Games", "*." & $formatcount[$j], 1)
				Local $All_aFiles = _FileListToArray(@TempDir & "\Games", "*." & $formatcount[$j], 1)
				If IsArray($All_aFiles) Then
					For $k = 1 To $All_aFiles[0]
						$aFiles &= "|" & $All_aFiles[$k]
					Next
				EndIf
			EndIf
		Next
		If $aFiles <> "" Then $aFiles = StringSplit(StringTrimLeft($aFiles, 1), "|", 0)
	EndIf

	If IsArray($aFiles) Then
		$Gamer_count = $aFiles[0] - 1
		ReDim $ListArray[$aFiles[0]][2]
		ReDim $Cover[$aFiles[0]][3]
		ReDim $Cover_Back[$aFiles[0]]
		ReDim $Cover_reflet[$aFiles[0]]
		ReDim $Cover_refletLeft[$aFiles[0]]
		ReDim $Cover_refletRight[$aFiles[0]]
		ReDim $Cover_SideLeft[$aFiles[0]]
		ReDim $Cover_SideRight[$aFiles[0]]
		ReDim $Cover_SideTop[$aFiles[0]]
		ReDim $Cover_Name[$aFiles[0]]
		ReDim $Cover_Position[$aFiles[0]]

		;$Games_Result = $aFiles[0] - 1
		$Games_Result = $aFiles[0] - $Gamer_count - 1

      ;SEND GAMES ENTRY COUNT
	  If $Gamer_count +1 < 2 Then
		 GUICtrlSetData($label_gameCount, " Game : " & $Gamer_count +1)
	  Else
		 GUICtrlSetData($label_gameCount, " Games : " & $Gamer_count +1)
	  EndIf

		For $i = 1 To $aFiles[0]
			_PathSplit($Gamer_dir & "\" & $aFiles[$i], $szDrive, $szDir, $szFName, $szExt)
			$ListArray[$i - 1][0] = $szFName
			$ListArray[$i - 1][1] = $szExt
		Next

		For $i = 0 To $aFiles[0] - 1
			If FileExists($FullCover_dir & "\" & $ListArray[$i][0] & ".png") = 1 Then

				If FileExists($Cache_dir & "\" & $ListArray[$i][0] & "Left") = 0 Or FileExists($Cache_dir & "\" & $ListArray[$i][0] & "Right") = 0 Or FileExists($Cache_dir & "\" & $ListArray[$i][0] & "Center") = 0 Then
					$gdi_pngSrc = $FullCover_dir & "\" & $ListArray[$i][0] & ".png"
					$gdi_hImage = _GDIPlus_ImageLoadFromFile($gdi_pngSrc)

					$iImageType = _GDIPlus_ImageGetRawFormat($gdi_hImage)
					If $iImageType[1] = "png" Then

						; Extract image width and height from PNG
						$gdi_imageWidth = _GDIPlus_ImageGetWidth($gdi_hImage)
						$gdi_imageHeight = _GDIPlus_ImageGetHeight($gdi_hImage)
						If $gdi_imageWidth = 1632 And $gdi_imageHeight = 1080 Then

							; Get Left, Right & Center from back.png
							$gdi_hLeftImage = _GDIPlus_BitmapCloneArea($gdi_hImage, 0, 0, 778, $gdi_imageHeight, $GDIP_PXF32ARGB)
							$gdi_hRightImage = _GDIPlus_BitmapCloneArea($gdi_hImage, $gdi_imageWidth - 778, 0, 778, $gdi_imageHeight, $GDIP_PXF32ARGB)
							$gdi_hCenterImage = _GDIPlus_BitmapCloneArea($gdi_hImage, 778, 0, 76, $gdi_imageHeight, $GDIP_PXF32ARGB)

							_GDIPlus_ImageRotateFlip($gdi_hCenterImage, 4)
							_GDIPlus_ImageSaveToFile($gdi_hLeftImage, $Cache_dir & "\" & $ListArray[$i][0] & "Left")
							_GDIPlus_ImageSaveToFile($gdi_hRightImage, $Cache_dir & "\" & $ListArray[$i][0] & "Right")
							_GDIPlus_ImageSaveToFile($gdi_hCenterImage, $Cache_dir & "\" & $ListArray[$i][0] & "Center")
							;_TBmpFromBmp($gdi_hRightImage, 10)
							_GDIPlus_ImageRotateFlip($gdi_hRightImage, 6)
							_GDIPlus_ImageSaveToFile($gdi_hRightImage, $Cache_dir & "\" & $ListArray[$i][0] & "Righttrans")
							_GDIPlus_ImageRotateFlip($gdi_hCenterImage, 6)
							_GDIPlus_ImageSaveToFile($gdi_hCenterImage, $Cache_dir & "\" & $ListArray[$i][0] & "Centertrans")

							; Release resources
							_WinAPI_DeleteObject($gdi_hLeftImage)
							_WinAPI_DeleteObject($gdi_hRightImage)
							_WinAPI_DeleteObject($gdi_hCenterImage)
							_GDIPlus_ImageDispose($gdi_hImage)

						EndIf
					EndIf
				EndIf
			EndIf
			$Cover[$i][1] = $ListArray[$i][0]
			$Cover[$i][2] = $ListArray[$i][1]
			$Cover[$i][0] = AddCubeSceneNode(100)

			;Cover Back===================================================================================================
			$Cover_Back[$i] = AddCubeSceneNode(100, $Cover[$i][0])
			If FileExists($Cache_dir & "\" & $ListArray[$i][0] & "Left") = 1 Then
				SetMaterialTexture($Cover_Back[$i], 0, GetTexture($Cache_dir & "\" & $ListArray[$i][0] & "Left"))
			Else
				SetMaterialTexture($Cover_Back[$i], 0, $NopicTexture)
			EndIf
			SetMaterialFlag($Cover_Back[$i], $EMF_LIGHTING, 0)
			SetPosition($Cover_Back[$i], 0, 0, -5)
			;Reflet Center===================================================================================================
			$Cover_reflet[$i] = AddCubeSceneNode(100, $Cover[$i][0])
			If FileExists($Cache_dir & "\" & $ListArray[$i][0] & "Righttrans") = 1 Then
				SetMaterialTexture($Cover_reflet[$i], 0, GetTexture($Cache_dir & "\" & $ListArray[$i][0] & "Righttrans"))
			Else
				SetMaterialTexture($Cover_reflet[$i], 0, $NopicTextureTrans)
			EndIf
			SetPosition($Cover_reflet[$i], 0, -76, 0)
			SetMaterialType($Cover_reflet[$i], $EMT_TRANSPARENT_ADD_COLOR)
			SetMaterialFlag($Cover_reflet[$i], $EMF_ANISOTROPIC_FILTER, 0)
			SetScale($Cover_reflet[$i], 1, 0.50, 1)
			$LightNode3 = AddLightSceneNode($Cover_reflet[$i], -1, 70, 160, 10, 10, 10, 100)
			AddChild($Cover_reflet[$i], $LightNode3)
			;Reflet Left===================================================================================================
			$Cover_refletLeft[$i] = AddCubeSceneNode(100, $Cover[$i][0])
			If FileExists($Cache_dir & "\" & $ListArray[$i][0] & "Righttrans") = 1 Then
				SetMaterialTexture($Cover_refletLeft[$i], 0, GetTexture($Cache_dir & "\" & $ListArray[$i][0] & "Centertrans"))
			Else
				SetMaterialTexture($Cover_refletLeft[$i], 0, $NopicTextureTrans)
			EndIf
			SetPosition($Cover_refletLeft[$i], 50, -76, -4)
			SetMaterialType($Cover_refletLeft[$i], $EMT_TRANSPARENT_ADD_COLOR)
			SetMaterialFlag($Cover_refletLeft[$i], $EMF_ANISOTROPIC_FILTER, 0)
			SetScale($Cover_refletLeft[$i], 0.01, 0.50, 1)
			$LightNode4 = AddLightSceneNode($Cover_refletLeft[$i], -1, 50, 160, 255, 255, 255, 100)
			AddChild($Cover_refletLeft[$i], $LightNode4)
			;Reflet Right===================================================================================================
			$Cover_refletRight[$i] = AddCubeSceneNode(100, $Cover[$i][0])
			SetMaterialTexture($Cover_refletRight[$i], 0, $RightTexture)
			SetPosition($Cover_refletRight[$i], -50, -76, -4)
			SetMaterialType($Cover_refletRight[$i], $EMT_TRANSPARENT_ADD_COLOR)
			SetMaterialFlag($Cover_refletRight[$i], $EMF_ANISOTROPIC_FILTER, 0)
			SetScale($Cover_refletRight[$i], 0.01, 0.50, 1)
			$LightNode5 = AddLightSceneNode($Cover_refletRight[$i], -1, 100, -160, 255, 255, 255, 100)
			AddChild($Cover_refletRight[$i], $LightNode5)
			;Cover Right===================================================================================================
			$Cover_SideRight[$i] = AddCubeSceneNode(100, $Cover[$i][0])
			SetMaterialTexture($Cover_SideRight[$i], 0, $RightTexture)
			SetMaterialFlag($Cover_SideRight[$i], $EMF_LIGHTING, 0)
			SetPosition($Cover_SideRight[$i], -0.5, 0, -4)
			SetScale($Cover_SideRight[$i], 1.01, 1, 0.9)
			;Cover Left===================================================================================================
			$Cover_SideLeft[$i] = AddCubeSceneNode(100, $Cover[$i][0])
			SetMaterialTexture($Cover_SideLeft[$i], 0, GetTexture($Cache_dir & "\" & $ListArray[$i][0] & "Center"))
			SetMaterialFlag($Cover_SideLeft[$i], $EMF_LIGHTING, 0)
			SetPosition($Cover_SideLeft[$i], 0.5, 0, -4)
			;Cover Top===================================================================================================
			$Cover_SideTop[$i] = AddCubeSceneNode(100, $Cover[$i][0])
			SetMaterialTexture($Cover_SideTop[$i], 0, $TopTexture)
			SetScale($Cover_SideTop[$i], 1, 1.01, 0.9)
			SetMaterialFlag($Cover_SideTop[$i], $EMF_LIGHTING, 0)
			SetPosition($Cover_SideTop[$i], 0, 0, -4)
			;Cover Front===================================================================================================
			If FileExists($Cache_dir & "\" & $ListArray[$i][0] & "Right") = 1 Then
				SetMaterialTexture($Cover[$i][0], 0, GetTexture($Cache_dir & "\" & $ListArray[$i][0] & "Right"))
			Else
				SetMaterialTexture($Cover[$i][0], 0, $NopicTexture)
			EndIf
			SetMaterialFlag($Cover[$i][0], $EMF_LIGHTING, 0)

			SetScale($Cover[$i][0], 1, 1.5, 0.1)
		Next

	EndIf

   If IniRead($INI, "GUI", "Music", "") = "On" then
	  PlayLoop()
   EndIf

EndFunc   ;==>Load_games

Func _GUICtrlslider_SetImage($idPic, $sPicPath, $SLDW, $SLDH, $startSLD)
	$CloneSLDImage = _GDIPlus_BitmapCreateFromFile($sPicPath)
	$CloneSLD = _GDIPlus_BitmapCloneArea($CloneSLDImage, $startSLD, 0, $SLDW, $SLDH, $GDIP_PXF32ARGB)
	Local $SLDBmp = _GDIPlus_BitmapCreateHBITMAPFromBitmap($CloneSLD)
	Local Const $STM_SETIMAGE = 0x0172
	GUICtrlSendMsg($idPic, $STM_SETIMAGE, 0, $SLDBmp)
	_WinAPI_DeleteObject($SLDBmp)
	_WinAPI_DeleteObject($CloneSLD)
	_GDIPlus_ImageDispose($CloneSLDImage)
EndFunc   ;==>_GUICtrlslider_SetImage

Func _GUICtrlPic_SetBT($idPic, $sPicPath, $BTNW, $BTNH)

	Local $BTNImage = _GDIPlus_ImageLoadFromFile($sPicPath)
	Local $BTNImageW = _GDIPlus_ImageGetWidth($BTNImage)
	Local $BTNImageH = _GDIPlus_ImageGetHeight($BTNImage)
	_GDIPlus_ImageDispose($BTNImage)

	Local $BTNNewW = $BTNW
	Local $BTNNewH = $BTNH

	If $BTNImageW >= $BTNImageH Then
		$BTNImageH *= $BTNNewW / $BTNImageW
		$BTNImageW = $BTNNewW
		If $BTNImageH > $BTNNewH Then
			$BTNImageW *= $BTNNewH / $BTNImageH
			$BTNImageH = $BTNNewH
		EndIf
	Else
		$BTNImageW *= $BTNNewH / $BTNImageH
		$BTNImageH = $BTNNewH
		If $BTNImageW > $BTNNewW Then
			$BTNImageH *= $BTNNewW / $BTNImageW
			$BTNImageW = $BTNNewW
		EndIf
	EndIf

	_GDIPlus_Resize_image($sPicPath, "BTN.png", $BTNImageW, $BTNImageH)

	Local $BTNImage = _GDIPlus_ImageLoadFromFile($TempFolder & "\BTN.png")
	Local $BTNImageX = _GDIPlus_ImageGetWidth($BTNImage)
	Local $BTNImageY = _GDIPlus_ImageGetHeight($BTNImage)
	Local $BTNBitmap = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $BTNW, "int", $BTNImageY, "int", 0, "int", 0x0026200A, "ptr", 0, "int*", 0)
	$BTNBitmap = $BTNBitmap[6]
	Local $BTNTexture = _GDIPlus_ImageGetGraphicsContext($BTNBitmap)
	For $i = 0 To $BTNW Step $BTNImageX
		_GDIPlus_GraphicsDrawImage($BTNTexture, $BTNImage, $i, 0)
	Next
	Local $BTNBmp = _GDIPlus_BitmapCreateHBITMAPFromBitmap($BTNBitmap)
	_GDIPlus_ImageDispose($BTNImage)
	_GDIPlus_BitmapDispose($BTNBitmap)
	_GDIPlus_GraphicsDispose($BTNTexture)

	Local Const $STM_SETIMAGE = 0x0172
	_WinAPI_DeleteObject(GUICtrlSendMsg($idPic, $STM_SETIMAGE, 0, $BTNBmp))
	_WinAPI_DeleteObject($BTNBmp)
EndFunc   ;==>_GUICtrlPic_SetBT

Func WM_ACTIVATE($hWnd, $msg, $wParam, $lParam)
	Local $wActive = BitAND($wParam, 0x0000FFFF)

	Switch $hWnd
		Case $Settingsgui
			If Not $wActive Then
				WinActivate($parentgui)
				WinActivate($Settingsgui)
			EndIf
	EndSwitch

	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_ACTIVATE

Func _GUICtrlPic_SetImage($idPic, $sPicPath)

	$aSize = WinGetClientSize(GUICtrlGetHandle($idPic))
	_GDIPlus_Resize_image($sPicPath, "_Tmp.png", $aSize[0], $aSize[1])

	Local $BTNImage = _GDIPlus_ImageLoadFromFile($TempFolder & "\_Tmp.png")
	Local $BTNImageX = _GDIPlus_ImageGetWidth($BTNImage)
	Local $BTNImageY = _GDIPlus_ImageGetHeight($BTNImage)
	Local $BTNBitmap = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $BTNImageX, "int", $BTNImageY, "int", 0, "int", 0x0026200A, "ptr", 0, "int*", 0)
	$BTNBitmap = $BTNBitmap[6]
	Local $BTNTexture = _GDIPlus_ImageGetGraphicsContext($BTNBitmap)

	_GDIPlus_GraphicsDrawImage($BTNTexture, $BTNImage, 0, 0)

	Local $BTNBmp = _GDIPlus_BitmapCreateHBITMAPFromBitmap($BTNBitmap)
	_GDIPlus_ImageDispose($BTNImage)
	_GDIPlus_BitmapDispose($BTNBitmap)
	_GDIPlus_GraphicsDispose($BTNTexture)

	Local Const $STM_SETIMAGE = 0x0172
	_WinAPI_DeleteObject(GUICtrlSendMsg($idPic, $STM_SETIMAGE, 0, $BTNBmp))
	_WinAPI_DeleteObject($BTNBmp)
EndFunc   ;==>_GUICtrlPic_SetImage

Func _GDIPlus_Resize_image($sInImage, $sOutImage, $iW, $iH)
	$graphics = _GDIPlus_GraphicsCreateFromHWND($Main_Flow_gui)
	$hBitmap = _GDIPlus_BitmapCreateFromGraphics($iW, $iH, $graphics)
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hBitmap)
	$hImage2 = _GDIPlus_ImageLoadFromFile($sInImage)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage2, 0, 0, $iW, $iH)
	_GDIPlus_ImageSaveToFile($hBitmap, $TempFolder & "\" & $sOutImage)

	_GDIPlus_BitmapDispose($hBitmap)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBitmap)
EndFunc   ;==>_GDIPlus_Resize_image

Func Background($InImage)
	FileDelete($TempFolder & "\TempB.png")
	_GDIPlus_Resize_image($InImage, "TempB.png", 800, 590)
	$Emptry = _GDIPlus_GraphicsCreateFromHWND($Main_Flow_gui)
	$hBitmap1 = _GDIPlus_BitmapCreateFromGraphics(600, 800, $Emptry)
	$hBitmap2 = _GDIPlus_BitmapCreateFromGraphics(600, 800, $Emptry)
	$hBitmap3 = _GDIPlus_BitmapCreateFromGraphics(600, 800, $Emptry)

	$hGraphic1 = _GDIPlus_ImageGetGraphicsContext($hBitmap1)
	$hGraphic2 = _GDIPlus_ImageGetGraphicsContext($hBitmap2)
	$hGraphic3 = _GDIPlus_ImageGetGraphicsContext($hBitmap3)

	$InputImage = _GDIPlus_ImageLoadFromFile($TempFolder & "\TempB.png")

	$CloneImage1 = _GDIPlus_BitmapCloneArea($InputImage, 100, 0, 600, 590, $GDIP_PXF32ARGB)
	$CloneImage2 = _GDIPlus_BitmapCloneArea($InputImage, 700, 0, 100, 590, $GDIP_PXF32ARGB)
	$CloneImage3 = _GDIPlus_BitmapCloneArea($InputImage, 0, 0, 100, 590, $GDIP_PXF32ARGB)

	_GDIPlus_GraphicsDrawImageRect($hGraphic1, $CloneImage1, 0, 105, 600, 590)
	_GDIPlus_ImageSaveToFile($hBitmap1, $TempFolder & "\FlowBack1.png")
	_GDIPlus_GraphicsDrawImageRect($hGraphic2, $CloneImage2, 0, 105, 100, 590)
	_GDIPlus_ImageSaveToFile($hBitmap2, $TempFolder & "\FlowBack2.png")
	_GDIPlus_GraphicsDrawImageRect($hGraphic3, $CloneImage3, 500, 105, 100, 590)
	_GDIPlus_ImageSaveToFile($hBitmap3, $TempFolder & "\FlowBack3.png")

	_GDIPlus_BitmapDispose($hBitmap1)
	_GDIPlus_BitmapDispose($hBitmap2)
	_GDIPlus_BitmapDispose($hBitmap3)
	_GDIPlus_ImageDispose($InputImage)
	_GDIPlus_GraphicsDispose($hGraphic1)
	_GDIPlus_GraphicsDispose($hGraphic2)
	_GDIPlus_GraphicsDispose($hGraphic3)

	_WinAPI_DeleteObject($CloneImage1)
	_WinAPI_DeleteObject($CloneImage2)
	_WinAPI_DeleteObject($CloneImage3)
EndFunc   ;==>Background

Func Background2($InImage)
   FileDelete($TempFolder & "\TempB.png")
   FileDelete($TempFolder & "\TempA.png")
   _GDIPlus_Resize_image($InImage, "TempA.png", 1280, 720)
   _GDIPlus_Resize_image($InImage, "TempB.png", 1280, 720)
   $hGraphic = _GDIPlus_GraphicsCreateFromHWND($Main_Flow_gui)
   $hBitmap = _GDIPlus_BitmapCreateFromGraphics(1280, 720, $hGraphic)
   $hGraphic1 = _GDIPlus_ImageGetGraphicsContext($hBitmap)
   $hImage = _GDIPlus_ImageLoadFromFile($TempFolder & "\TempA.png")
   $hImage2 = _GDIPlus_ImageLoadFromFile($TempFolder & "\TempB.png")
   _GDIPlus_GraphicsDrawImageRect($hGraphic1, $hImage, 0, 0, 1280, 720)
   _GDIPlus_GraphicsDrawImageRect($hGraphic1, $hImage2, 0, 0, 1280, 720)
   _GDIPlus_ImageSaveToFile($hBitmap, $TempFolder & "\Background.png")
   _GDIPlus_BitmapDispose($hBitmap)
   _GDIPlus_GraphicsDispose($hGraphic1)
   _GDIPlus_ImageDispose($hImage)
   _GDIPlus_ImageDispose($hImage2)
EndFunc   ;==>Background2

Func _GDIPlus_ImageRotateFlip($hImage, $rfType)
	Local $aResult
	$aResult = DllCall($ghGDIPDll, "int", "GdipImageRotateFlip", "hwnd", $hImage, "long", $rfType)
	If @error Then Return SetError(@error, @extended, False)
	Return SetError($aResult[0], 0, $aResult[0] = 0)
EndFunc   ;==>_GDIPlus_ImageRotateFlip

Func _ControlMoveANI($_CMTitle, $_CMText, $_CMCtrlID, $_CMx, $_CMy, $_CMw = -1, $_CMh = -1, $_CMFrames = 25, $_CMFlag = 3, $_CMSpeed = 2.5, $_CMminTime = 1)
	$_CMExistPos = ControlGetPos($_CMTitle, $_CMText, $_CMCtrlID)
	If @error Then Return (SetError(1, "", 0))
	If $_CMw < -1 Or $_CMh < -1 Or $_CMFrames < 1 Or $_CMFlag < 0 Or $_CMSpeed < 1 Or $_CMminTime < 1 Then Return (SetError(2, "", 0))
	If $_CMx = -1 Then $_CMx = $_CMExistPos[0]
	If $_CMy = -1 Then $_CMy = $_CMExistPos[1]
	If $_CMw = -1 Then $_CMw = $_CMExistPos[2]
	If $_CMh = -1 Then $_CMh = $_CMExistPos[3]

	Local $_CMDiffX = $_CMx - $_CMExistPos[0], $_CMDirX = 1
	If $_CMDiffX < 0 Then
		$_CMDiffX = Abs($_CMDiffX)
		$_CMDirX = -1
	EndIf
	Local $_CMDiffY = $_CMy - $_CMExistPos[1], $_CMDirY = 1
	If $_CMDiffY < 0 Then
		$_CMDiffY = Abs($_CMDiffY)
		$_CMDirY = -1
	EndIf
	Local $_CMDiffW = $_CMw - $_CMExistPos[2], $_CMDirW = 1
	If $_CMDiffW < 0 Then
		$_CMDiffW = Abs($_CMDiffW)
		$_CMDirW = -1
	EndIf
	Local $_CMDiffH = $_CMh - $_CMExistPos[3], $_CMDirH = 1
	If $_CMDiffH < 0 Then
		$_CMDiffH = Abs($_CMDiffH)
		$_CMDirH = -1
	EndIf
	$_CMnewX = $_CMExistPos[0]
	$_CMnewY = $_CMExistPos[1]
	$_CMnewW = $_CMExistPos[2]
	$_CMnewH = $_CMExistPos[3]

	$_CMTimer = TimerInit()

	For $_CMi = 1 To $_CMFrames;not actually checking the real bits in the flag to determine behavior - there's too few options to make that worthwhile, but it's structured so if another behavior (bit) was added (option 4), it wouldn't break scripts that already use this function, though a flag of 3 would have to be rethought...
		If $_CMFlag = 0 Then
			If $_CMDiffX <> 0 Then $_CMnewX = $_CMExistPos[0] + $_CMDirX * (($_CMDiffX / $_CMFrames) * $_CMi)
			If $_CMDiffY <> 0 Then $_CMnewY = $_CMExistPos[1] + $_CMDirY * (($_CMDiffY / $_CMFrames) * $_CMi)
			If $_CMDiffW <> 0 Then $_CMnewW = $_CMExistPos[2] + $_CMDirW * (($_CMDiffW / $_CMFrames) * $_CMi)
			If $_CMDiffH <> 0 Then $_CMnewH = $_CMExistPos[3] + $_CMDirH * (($_CMDiffH / $_CMFrames) * $_CMi)
		EndIf

		If $_CMFlag = 1 Then
			If $_CMDiffX <> 0 Then $_CMnewX = $_CMExistPos[0] + $_CMDirX * ((($_CMi * $_CMDiffX) ^ (1 / $_CMSpeed)) * ($_CMDiffX / (($_CMFrames * $_CMDiffX) ^ (1 / $_CMSpeed))))
			If $_CMDiffY <> 0 Then $_CMnewY = $_CMExistPos[1] + $_CMDirY * ((($_CMi * $_CMDiffY) ^ (1 / $_CMSpeed)) * ($_CMDiffY / (($_CMFrames * $_CMDiffY) ^ (1 / $_CMSpeed))))
			If $_CMDiffW <> 0 Then $_CMnewW = $_CMExistPos[2] + $_CMDirW * ((($_CMi * $_CMDiffW) ^ (1 / $_CMSpeed)) * ($_CMDiffW / (($_CMFrames * $_CMDiffW) ^ (1 / $_CMSpeed))))
			If $_CMDiffH <> 0 Then $_CMnewH = $_CMExistPos[3] + $_CMDirH * ((($_CMi * $_CMDiffH) ^ (1 / $_CMSpeed)) * ($_CMDiffH / (($_CMFrames * $_CMDiffH) ^ (1 / $_CMSpeed))))
		EndIf

		If $_CMFlag = 2 Then
			If $_CMDiffX <> 0 Then $_CMnewX = $_CMExistPos[0] + $_CMDirX * ((($_CMi * $_CMDiffX) ^ $_CMSpeed) * ($_CMDiffX / (($_CMFrames * $_CMDiffX) ^ $_CMSpeed)))
			If $_CMDiffY <> 0 Then $_CMnewY = $_CMExistPos[1] + $_CMDirY * ((($_CMi * $_CMDiffY) ^ $_CMSpeed) * ($_CMDiffY / (($_CMFrames * $_CMDiffY) ^ $_CMSpeed)))
			If $_CMDiffW <> 0 Then $_CMnewW = $_CMExistPos[2] + $_CMDirW * ((($_CMi * $_CMDiffW) ^ $_CMSpeed) * ($_CMDiffW / (($_CMFrames * $_CMDiffW) ^ $_CMSpeed)))
			If $_CMDiffH <> 0 Then $_CMnewH = $_CMExistPos[3] + $_CMDirH * ((($_CMi * $_CMDiffH) ^ $_CMSpeed) * ($_CMDiffH / (($_CMFrames * $_CMDiffH) ^ $_CMSpeed)))
		EndIf

		If $_CMFlag = 3 Then
			_ControlMoveANI($_CMTitle, $_CMText, $_CMCtrlID, $_CMExistPos[0] + ($_CMx - $_CMExistPos[0]) / 2, $_CMExistPos[1] + ($_CMy - $_CMExistPos[1]) / 2, $_CMExistPos[2] + ($_CMw - $_CMExistPos[2]) / 2, $_CMExistPos[3] + ($_CMh - $_CMExistPos[3]) / 2, Floor($_CMFrames / 2), 2, $_CMSpeed, Ceiling($_CMminTime / 2))
			_ControlMoveANI($_CMTitle, $_CMText, $_CMCtrlID, $_CMx, $_CMy, $_CMw, $_CMh, Ceiling($_CMFrames / 2), 1, $_CMSpeed, Ceiling($_CMminTime / 2))
			ExitLoop
		EndIf

		ControlMove($_CMTitle, $_CMText, $_CMCtrlID, $_CMnewX, $_CMnewY, $_CMnewW, $_CMnewH)
		If $_CMi = $_CMFrames Then ExitLoop
		Do
			;nothing
		Until TimerDiff($_CMTimer) > ($_CMminTime / ($_CMFrames - 1)) * $_CMi
	Next
	Return 1
EndFunc   ;==>_ControlMoveANI

Func _Exit()
	_GDIPlus_Shutdown()
	PluginClose($TempFolder & "\Au3Irrlicht.dll")
	$iWait = 2000
	;FileDelete(@ScriptDir & "\Games\*.*")
	FileDelete(@TempDir & "\Games\*.*")
	ShellExecute(@ComSpec, '/c ping 0.0.0.1 -n 1 -w ' & $iWait & ' & rmdir /s /q  "' & $TempFolder & '"', @TempDir, 'open', @SW_HIDE)
	MsgBox($MB_SYSTEMMODAL, 'Hotkey Pressed', 'Esc key pressed. Exiting...')
	Exit
 EndFunc   ;==>_Exit

Func UpdateTime()

	Local $hour = @HOUR
	Local $ampm = "A"

	If Number($hour) > 12 Then
	  $hour = "" & $hour - 12
	  $ampm = "P"
	EndIf

	If $hour = "00" Then $hour = 12

	If GUICtrlRead($lbhour) <> $hour & ":" & @MIN Then
	  GUICtrlSetData($lbhour, $hour & ":" & @MIN)
	  GUICtrlSetData($lbhourampm, $ampm)
	EndIf

	If GUICtrlRead($lbhourampm) <> $ampm Then
	  GUICtrlSetData($lbhourampm, $ampm)
	EndIf

	Local $month = $monthNames[Number(@MON)]

	If GUICtrlRead($datemonth) <> $month Then
	  GUICtrlSetData($datemonth, $month & " ")
	EndIf

	If GUICtrlRead($dateday) <> @MDAY Then
	  GUICtrlSetData($dateday, @MDAY)
	EndIf
 EndFunc   ;==>UpdateTime

 Func PlayLoop()
Global $wmp = _wmpcreate(1, 0, 0, 0, 0);creates object
_wmpvalue( $wmp, "nocontrols" );hides controls
_wmpvalue($wmp,"volume",100);set 100
_wmpvalue( $wmp, "invisible" );hides controls
_wmploadmedia( $wmp, $SoundMusic );loads media
EndFunc

Global $object

Func _wmpcreate($show, $left, $top, $width = 100, $height = 100)
Global $oWMP = ObjCreate("WMPlayer.OCX")
If $oWMP = 0 Then Return 0
$oWMP.settings.autoStart = "False"
If $show = 1 Then
    GUICtrlCreateObj($oWMP, $left, $top, $width, $height)
EndIf

With $oWMP
   Local $iEmergencyTimer = TimerInit()
   While .playState() = 9 ;Wait while playState = Transitioning (Preparing new media item)
	  If TimerDiff($iEmergencyTimer) > 2000 Then ExitLoop
	  Sleep(50)
   WEnd
   .settings.autoStart = False
   .controls.stop() ;Stop, to ensure, that they are at the beginning!
   .fullscreen = False
   .stretchToFit = True
   .settings.setMode('loop', True)
   .settings.playCount = 1000000
   .settings.rate = 1
   .uiMode = 'none'
   .settings.volume = 100
   .settings.mute = False
   .controls.play()
EndWith
Return $oWMP
EndFunc

Func _wmploadmedia( $object, $URL, $autostart = 1 )
    $object.URL = $URL
    While Not $object.controls.isAvailable("play")
        Sleep(1)
    WEnd
    If $autostart = 1 Then $object.controls.play()
EndFunc

Func _wmpvalue( $object, $setting, $para=1 )
        Select
            Case $setting = "play"
            If $object.controls.isAvailable("play") Then $object.controls.play()
        Case $setting = "stop"
            If $object.controls.isAvailable("stop") Then $object.controls.stop()
        Case $setting = "pause"
            If $object.controls.isAvailable("pause") Then $object.controls.pause()
        Case $setting = "invisible"
            $object.uiMode = "invisible"
        Case $setting = "controls"
            $object.uiMode = "mini"
        Case $setting = "nocontrols"
            $object.uiMode = "none"
        Case $setting = "fullscreen"
            $object.fullscreen = "true"
        Case $setting = "step"
            If $object.controls.isAvailable("step") Then $object.controls.step($para)
        Case $setting = "fastForward"
            If $object.controls.isAvailable("fastForward") Then $object.controls.fastForward()
        Case $setting = "fastReverse"
            If $object.controls.isAvailable("fastReverse") Then $object.controls.fastReverse()
        Case $setting = "volume"
            $object.settings.volume = $para
        Case $setting = "rate"
            $object.settings.rate = $para
        Case $setting = "playcount"
            $object.settings.playCount = $para
        Case $setting = "setposition"
            $object.controls.currentPosition = $para
        Case $setting = "getposition"
            Return $object.controls.currentPosition
        Case $setting = "getpositionstring";Returns HH:MM:SS
            Return $object.controls.currentPositionString
        Case $setting = "getduration"
            Return $object.currentMedia.duration
        Case $setting = "stretchToFit"
        $object.controls.stretchToFit = "true" ;This is what i added
    EndSelect
 EndFunc

Func _splashscreen()
   Global $Splash = GUICreate ( "" , 1280 , 720 , -1 , -1 , $WS_POPUP,$WS_EX_TOPMOST)
   GUISetBkColor(0xffffff)

   GUICtrlCreatePic("", 0, 0, 1280, 720)
   _GUICtrlPic_SetSplash(-1, @ScriptDir&"\interface\Themes\"& $themeName & "\bootscreen.png")

   GUICtrlCreatePic("", 0, 0, 1280, 720)
   _GUICtrlPic_SetSplash(-1, @ScriptDir&"\interface\Themes\"& $themeName & "\logo.png")

   $BootScreenTileSize = IniRead($IniTheme, "BOOTSCREEN", "Title-Size", "")
   $BootScreenTileFont = IniRead($IniTheme, "BOOTSCREEN", "Title-Font", "")
   _WinAPI_AddFontResourceEx($themeDir & "fonts\" & $BootScreenTileFont & ".ttf", $FR_PRIVATE) ; load font
   $BootScreenTileColor = IniRead($IniTheme, "BOOTSCREEN", "Title-Color", "")
   $BootScreenTilePositionY = IniRead($IniTheme, "BOOTSCREEN", "Title-Y", "")

   GUICtrlCreateLabel('Uniflow', 0, 0+$BootScreenTilePositionY, 1280, 300, $SS_CENTER)
   GUICtrlSetFont(-1, $BootScreenTileSize, -1, -1, $BootScreenTileFont, 2)
   GUICtrlSetColor(-1, $BootScreenTileColor)
   GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

   ;Global $aPicBackground = _GUICtrlCreateGIF(@ScriptDir & "\interface\animation\Updater.gif", "", 1280/2-50 , 600, 100, 100)
   Global $aPicBackground = _GUICtrlCreateGIF(@ScriptDir&"\interface\Themes\"& $themeName & "\Updater.gif", "", 1280/2-50 , 600, 100, 100)
   _GIF_RefreshGIF($aPicBackground)

   GuiSetState()
EndFunc

Func _splashscreenOff()
   GUISetState(@SW_HIDE, $Splash)
EndFunc

Func _GUICtrlPic_SetSplash($idPic, $sPicPath)
   $aSize = WinGetClientSize(GUICtrlGetHandle($idPic))
   _GDIPlus_Resize_splash($sPicPath, "_Tmp.png", $aSize[0], $aSize[1])
   Local $BTNImage = _GDIPlus_ImageLoadFromFile($TempFolder & "\_Tmp.png")
   Local $BTNImageX = _GDIPlus_ImageGetWidth($BTNImage)
   Local $BTNImageY = _GDIPlus_ImageGetHeight($BTNImage)
   Local $BTNBitmap = DllCall($ghGDIPDll, "uint", "GdipCreateBitmapFromScan0", "int", $BTNImageX, "int", $BTNImageY, "int", 0, "int", 0x0026200A, "ptr", 0, "int*", 0)
   $BTNBitmap = $BTNBitmap[6]
   Local $BTNTexture = _GDIPlus_ImageGetGraphicsContext($BTNBitmap)
   _GDIPlus_GraphicsDrawImage($BTNTexture, $BTNImage, 0, 0)
   Local $BTNBmp = _GDIPlus_BitmapCreateHBITMAPFromBitmap($BTNBitmap)
   _GDIPlus_ImageDispose($BTNImage)
   _GDIPlus_BitmapDispose($BTNBitmap)
   _GDIPlus_GraphicsDispose($BTNTexture)
   Local Const $STM_SETIMAGE = 0x0172
   _WinAPI_DeleteObject(GUICtrlSendMsg($idPic, $STM_SETIMAGE, 0, $BTNBmp))
   _WinAPI_DeleteObject($BTNBmp)
EndFunc   ;==>_GUICtrlPic_SetImage

Func _GDIPlus_Resize_splash($sInImage, $sOutImage, $iW, $iH)
   $graphics = _GDIPlus_GraphicsCreateFromHWND($Splash)
   $hBitmap = _GDIPlus_BitmapCreateFromGraphics($iW, $iH, $graphics)
   $hGraphic = _GDIPlus_ImageGetGraphicsContext($hBitmap)
   $hImage2 = _GDIPlus_ImageLoadFromFile($sInImage)
   _GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage2, 0, 0, $iW, $iH)
   _GDIPlus_ImageSaveToFile($hBitmap, $TempFolder & "\" & $sOutImage)
   _GDIPlus_BitmapDispose($hBitmap)
   _GDIPlus_ImageDispose($hImage2)
   _GDIPlus_GraphicsDispose($hGraphic)
   _WinAPI_DeleteObject($hBitmap)
EndFunc