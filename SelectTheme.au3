#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <FileConstants.au3>
#include <GuiListView.au3>
#include <Constants.au3>
#include <GuiConstants.au3>
#include <GDIPlus.au3>
#include <File.au3>

Opt('MustDeclareVars', 1)

Global $config_file = "Config.ini"
Global $previewIndex
Global $themesDir = @ScriptDir & "\interface\themes"
Global $themeList = _FileListToArray($themesDir, "*", 2)

; Create GUI
Global $hGUI = GUICreate("Select Theme", 1280, 720)
GUISetState(@SW_SHOW)

; Register GDI+ library
_GDIPlus_Startup()

Example()

Func Example()
    Local $msg, $n
    Local $button_width = 200, $button_height = 30
    Local $button_margin = 10
    Local $scroll_height = 400
    Local $listview_width = 200
    Local $preview_width = 800, $preview_height = 450
    Local $btnNext, $btnPrev, $btnSelect
    Local $lblThemeName

    Opt("GUICoordMode", 1)

    ; Create a list view with a vertical scrollbar
    Local $listview = _GUICtrlListView_Create($button_margin, $button_margin, $listview_width, $scroll_height - $button_margin * 2)
    _GUICtrlListView_SetExtendedListViewStyle($listview, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES))

    ; Add themes to the list view
    For $i = 1 To $themeList[0]
        _GUICtrlListView_AddItem($listview, $themeList[$i], $i - 1)
    Next

    ; Create label to display theme name
    $lblThemeName = GUICtrlCreateLabel("", $button_margin + $listview_width + $button_margin * 2, $button_margin / 2, $preview_width, $button_height / 2)
    GUICtrlSetFont($lblThemeName, 10, 800)

    ; Create preview window
    Global $hPreview = GUICtrlCreatePic("", $button_margin + $listview_width + $button_margin * 2, $button_margin + $button_height, $preview_width, $preview_height)

    ; Create buttons
    $btnPrev = GUICtrlCreateButton("Previous", $button_margin + $listview_width + $button_margin * 2, $button_margin + $button_height + $preview_height + $button_margin, $preview_width / 3, $button_height)
    $btnSelect = GUICtrlCreateButton("Select", $button_margin + $listview_width + $button_margin * 2 + $preview_width / 3, $button_margin + $button_height + $preview_height + $button_margin, $preview_width / 3, $button_height)
    $btnNext = GUICtrlCreateButton("Next", $button_margin + $listview_width + $button_margin * 2 + 2 * $preview_width / 3, $button_margin + $button_height + $preview_height + $button_margin, $preview_width / 3, $button_height)

    GUISetState(@SW_SHOW)

    ; Select default theme and update preview
    $previewIndex = _ArraySearch($themeList, IniRead($config_file, "GUI", "Theme", "Default"))
    UpdatePreview($previewIndex, $lblThemeName, $button_margin, $listview_width, $button_height, $preview_width, $preview_height)

    While 1
        $msg = GUIGetMsg()

        Select
            Case $msg >= 1000 And $msg <= 1020 ; ID of buttons in the list view
                UpdateConfig($msg - 1000 + 1)
            Case $msg = $btnPrev
                $previewIndex = Mod($previewIndex - 2 + $themeList[0], $themeList[0]) + 1
                UpdatePreview($previewIndex, $lblThemeName, $button_margin, $listview_width, $button_height, $preview_width, $preview_height)
            Case $msg = $btnNext
                $previewIndex = Mod($previewIndex, $themeList[0]) + 1
                UpdatePreview($previewIndex, $lblThemeName, $button_margin, $listview_width, $button_height, $preview_width, $preview_height)
            Case $msg = $btnSelect
                UpdateConfig($previewIndex)
            Case $msg = $GUI_EVENT_CLOSE
                ExitLoop
        EndSelect
    WEnd
EndFunc ;==>Example

Func UpdateConfig($index)
    IniWrite($config_file, "GUI", "Theme", $themeList[$index])
    MsgBox(64, 'Confirmation', 'Theme "' & $themeList[$index] & '" has been saved to config.ini.')
EndFunc

Func UpdatePreview($index, $lblThemeName, $button_margin, $listview_width, $button_height, $preview_width, $preview_height)
    Local $themeDir = $themesDir & "\" & $themeList[$index]
    Local $previewImagePath = $themeDir & "\preview.png"
    
    ; Check if preview.png exists, if not, use nopreview.png
    If Not FileExists($previewImagePath) Then
        $previewImagePath = @ScriptDir & "\interface\background\nopreview.png"
    EndIf

    ; Load PNG image
    Local $hImage = _GDIPlus_ImageLoadFromFile($previewImagePath)
    If Not $hImage Then
        MsgBox(48, "Error", "Failed to load preview image!")
        Return
    EndIf

    ; Create a graphics object from the GUI
    Local $hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)

    ; Get the dimensions of the loaded image
    Local $iWidth = _GDIPlus_ImageGetWidth($hImage)
    Local $iHeight = _GDIPlus_ImageGetHeight($hImage)

    ; Calculate the new dimensions to fit within the preview window
    Local $iNewWidth, $iNewHeight
    If $iWidth > $preview_width Or $iHeight > $preview_height Then
        If $iWidth > $iHeight Then
            $iNewWidth = $preview_width
            $iNewHeight = $iHeight * $iNewWidth / $iWidth
        Else
            $iNewHeight = $preview_height
            $iNewWidth = $iWidth * $iNewHeight / $iHeight
        EndIf
    Else
        $iNewWidth = $iWidth
        $iNewHeight = $iHeight
    EndIf

    ; Draw the image onto the preview window
    _GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage, $button_margin + $listview_width + $button_margin * 2, $button_margin + $button_height, $iNewWidth, $iNewHeight)

    ; Display theme name
    GUICtrlSetData($lblThemeName, "Theme: " & $themeList[$index])

    ; Release resources
    _GDIPlus_GraphicsDispose($hGraphic)
    _GDIPlus_ImageDispose($hImage)
EndFunc