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
Global $themeName = IniRead($config_file, "GUI", "Theme", "Default")
Global $preview_width = 800, $preview_height = 450 ; Global variables for preview dimensions
Global $button_margin = 10, $listview_width = 200, $button_height = 30 ; Global variables for button layout

; Create GUI
Global $hGUI = GUICreate("Select FlowMode", 1280, 720)
GUISetState(@SW_SHOW)

; Register GDI+ library
_GDIPlus_Startup()

Example()

Func Example()
    Local $msg, $n
    Local $btnNext, $btnPrev, $btnSelect
    Local $lblFlowMode

    Opt("GUICoordMode", 1)

    ; Read flow mode names from Config.ini
    Local $flowModeNames[21]
    For $i = 1 To 21
        $flowModeNames[$i - 1] = IniRead($config_file, "FlowMode", $i, "")
    Next

    ; Create a list view with a vertical scrollbar
    Local $listview = _GUICtrlListView_Create($button_margin, $button_margin, $listview_width, 400 - $button_margin * 2)
    _GUICtrlListView_SetExtendedListViewStyle($listview, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES))

    ; Add buttons to the list view
    For $i = 1 To 21
        _GUICtrlListView_AddItem($listview, $flowModeNames[$i - 1], $i - 1) ; added $i - 1 as the image index
    Next

    ; Create label to display flow mode number and name
    $lblFlowMode = GUICtrlCreateLabel("", $button_margin + $listview_width + $button_margin * 2, $button_margin / 2, $preview_width, $button_height / 2)
    GUICtrlSetFont($lblFlowMode, 10, 800)

    ; Create preview window
    Global $hPreview = GUICtrlCreatePic("", $button_margin + $listview_width + $button_margin * 2, $button_margin + $button_height, $preview_width, $preview_height)

    ; Create buttons
    $btnPrev = GUICtrlCreateButton("Previous", $button_margin + $listview_width + $button_margin * 2, $button_margin + $button_height + $preview_height + $button_margin, $preview_width / 3, $button_height)
    $btnSelect = GUICtrlCreateButton("Select", $button_margin + $listview_width + $button_margin * 2 + $preview_width / 3, $button_margin + $button_height + $preview_height + $button_margin, $preview_width / 3, $button_height)
    $btnNext = GUICtrlCreateButton("Next", $button_margin + $listview_width + $button_margin * 2 + 2 * $preview_width / 3, $button_margin + $button_height + $preview_height + $button_margin, $preview_width / 3, $button_height)

    GUISetState(@SW_SHOW)

    ; Select default flow mode and update preview
    $previewIndex = IniRead($config_file, "GUI", "FlowMode", 1)
    UpdatePreview($previewIndex, $lblFlowMode)

    While 1
        $msg = GUIGetMsg()

        Select
            Case $msg >= 1000 And $msg <= 1020 ; ID of buttons in the list view
                UpdateConfig($msg - 1000 + 1)
            Case $msg = $btnPrev
                $previewIndex = Mod($previewIndex - 2 + 21, 21) + 1
                UpdatePreview($previewIndex, $lblFlowMode)
            Case $msg = $btnNext
                $previewIndex = Mod($previewIndex, 21) + 1
                UpdatePreview($previewIndex, $lblFlowMode)
            Case $msg = $btnSelect
                UpdateConfig($previewIndex)
            Case $msg = $GUI_EVENT_CLOSE
                ExitLoop
        EndSelect
    WEnd
EndFunc ;==>Example

Func UpdateConfig($mode)
    IniWrite($config_file, "GUI", "FlowMode", $mode)
    MsgBox(64, 'Confirmation', 'Flow Mode ' & $mode & ': ' & IniRead($config_file, "FlowMode", $mode, "Default Name") & ' has been saved to config.ini.')
EndFunc

Func UpdatePreview($index, $lblFlowMode)
    Local $previewImagePath = "interface\flowmode\flow" & $index & ".png"
    If FileExists($previewImagePath) Then
        ; Load PNG image
        Local $hImage = _GDIPlus_ImageLoadFromFile($previewImagePath)
        If Not $hImage Then
            MsgBox(48, "Error", "Failed to load preview image!")
            Return
        EndIf

        ; Get the dimensions of the loaded image
        Local $iWidth = _GDIPlus_ImageGetWidth($hImage)
        Local $iHeight = _GDIPlus_ImageGetHeight($hImage)

        ; Calculate the new dimensions to fit within the preview window
        Local $iNewWidth, $iNewHeight
        If $iWidth > $iHeight Then
            $iNewWidth = $preview_width
            $iNewHeight = $preview_width * $iHeight / $iWidth
        Else
            $iNewHeight = $preview_height
            $iNewWidth = $preview_height * $iWidth / $iHeight
        EndIf

        ; Draw the resized image onto the GUI
        Local $hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
        _GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage, $button_margin + $listview_width + $button_margin * 2, $button_margin + $button_height, $iNewWidth, $iNewHeight)

        ; Display flow mode information
        GUICtrlSetData($lblFlowMode, "Flow Mode " & $index & ": " & IniRead($config_file, "FlowMode", $index, "Default Name"))

        ; Release resources
        _GDIPlus_GraphicsDispose($hGraphic)
        _GDIPlus_ImageDispose($hImage)
    Else
        MsgBox(48, "Error", "Preview image for FlowMode " & $index & " not found!")
    EndIf
EndFunc