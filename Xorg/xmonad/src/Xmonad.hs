module Main where

import Graphics.X11.ExtraTypes.XF86
import System.Exit
import System.IO
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.DynamicProjects
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.SpawnOn
import XMonad.Actions.UpdatePointer
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Util.Run
import XMonad.Util.Run(spawnPipe)

import qualified DBus as D
import qualified DBus.Client as D
import qualified Codec.Binary.UTF8.String as UTF8

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import qualified XMonad.Hooks.EwmhDesktops as ED

------------------------------------------------------------------------
-- Terminal

myTerminal = "termite"

------------------------------------------------------------------------
-- Projects

projects :: [Project]
projects =
    [ Project { projectName = "xmonad config"
              , projectDirectory = "~/myXmonad"
              , projectStartHook = Just $ do spawnOn dyws2 "termite -e 'kak ~/myXmonad/src/Xmonad.hs -e new'"
                                             spawnOn dyws2 "termite"
              }

    , Project { projectName = "sys"
              , projectDirectory = "~"
              , projectStartHook = Just $ do spawnOn myws1 "termite"
                                             spawnOn myws1 "termite"
                                             spawnOn myws1 "termite"
              }
    , Project { projectName = "music"
              , projectDirectory = "~"
              , projectStartHook = Just $ do spawnOn myws6 "termite -t ncmpcpp --class=ncmpcpp --name ncmpcpp -e ncmpcpp"
              }
    , Project { projectName = "bankless reborn"
              , projectDirectory = "~/workspace/webcorporate/bankless-reborn/"
              , projectStartHook = Just $ do spawnOn dyws3 "termite"
              }
    ]

------------------------------------------------------------------------
-- Workspaces


myws1 = "sys"
myws2 = "www"
myws3 = "im"
myws4 = "file"
myws5 = "game"
myws6 = "music"

dyws1 = "graphic"
dyws2 = "xmonad config"
dyws3 = "bankless reborn"

myWorkspaces = [myws1, myws2, myws3, myws4, myws5, myws6]

------------------------------------------------------------------------
-- Window rules

myManageHook = composeAll
    [ className =? "chromium"           --> doShift myws2
    , className =? "Firefox"            --> doShift myws2
    , className =? "Icecat"             --> doShift myws2
    , className =? "Iceweasel"          --> doShift myws2
    , className =? "Iridium-browser"    --> doShift myws2

    , className =? "toxic"              --> doShift myws3
    , className =? "telegram-desktop"   --> doShift myws3
    , className =? "weechat"            --> doShift myws3

    , className =? "Thunar"             --> doShift myws4
    , className =? "ranger"             --> doShift myws4

    , className =? "ncmpcpp"            --> doShift myws6

    --, className =? "calcurse"           --> doShift myws0

    , className =? "Gimp"               --> doShift dyws1
    , className =? "Inkscape"           --> doShift dyws1

    , className =? "stalonetray"        --> doIgnore
    , isFullscreen                      --> (doF W.focusDown <+> doFullFloat)]

------------------------------------------------------------------------
-- Layouts

myLayout =
    smartBorders $
    avoidStruts (
        spacing 2 $
            -- Tall 1 (3/100) (1/2)
            ResizableTall 1 (3/100) (1/2) []
        -- ||| Mirror (Tall 1 (3/100) (1/2))
        ||| Mirror (ResizableTall 1 (3/100) (1/2) [])
        ||| ThreeColMid 1 (3/100) (1/2)
        ||| spiral (6/7)
        ||| Full
        -- ||| tabbed shrinkText tabConfig
    )
    ||| noBorders (fullscreenFull Full)

------------------------------------------------------------------------
-- Colors and borders

myNormalBorderColor  = "#44475a"
myFocusedBorderColor = "#bd93f9"

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.

tabConfig = defaultTheme {
      activeBorderColor   = "#000000"
    , activeTextColor     = "#bd93f9"
    , activeColor         = "#44475a"
    , inactiveBorderColor = "#000000"
    , inactiveTextColor   = "#6272a4"
    , inactiveColor       = "#000000"
    , fontName            = "xft:DejaVu Sans:size=9"
}

-- Color of current window title in xmobar.
xmobarTitleColor = "#f8f8f2"

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#bd93f9"

-- Width of the window border in pixels.
myBorderWidth = 2

------------------------------------------------------------------------
-- Key bindings

myModMask = mod4Mask

myKeys conf@XConfig {XMonad.modMask = modMask} = M.fromList $
  ----------------------------------------------------------------------
  -- Custom key bindings

  -- terminal
  [ ((modMask .|. shiftMask, xK_Return),
     spawn $ XMonad.terminal conf)

  -- Launch dmenu via yeganesh.
  , ((modMask, xK_p),
    spawn "rofi -show drun")

  , ((modMask .|. shiftMask, xK_p),
    spawn "rofi -show run")

  -- select screenshot
  --, ((modMask .|. shiftMask, xK_p),
     --spawn "screenshot-select")

  -- screenshot
  --, ((modMask .|. controlMask .|. shiftMask, xK_p),
     --spawn "screenshot")

  --, ((modMask, xK_Tab), switchProjectPrompt)
  --, ((modMask .|. shiftMask, xK_Tab), shiftToProjectPrompt)

  , ((modMask,               xK_Down), sendMessage MirrorShrink)
  , ((modMask,               xK_Up), sendMessage MirrorExpand)

  --------------------------------------------------------------------
  -- "Standard" xmonad key bindings

  -- Close focused window.
  , ((modMask .|. shiftMask, xK_c),
     kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space),
     sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_n),
     refresh)

  -- Move focus to the next window.
  --, ((modMask, xK_Tab),
     --windows W.focusDown)

  -- Move focus to the next window.
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask, xK_k),
     windows W.focusUp  )

  -- Move focus to the master window.
  , ((modMask, xK_m),
     windows W.focusMaster  )

  -- Swap the focused window and the master window.
  , ((modMask, xK_Return),
     windows W.swapMaster)

  -- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown  )

  -- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp    )

  -- Shrink the master area.
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Push window back into tiling.
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- Quit xmonad.
  , ((modMask .|. shiftMask, xK_q),
     io exitSuccess)

  -- Restart xmonad.
  --, ((modMask, xK_q),
     --restart "xmonad" True)

  , ((modMask .|. shiftMask, xK_Right), swapNextScreen)
  , ((modMask .|. shiftMask, xK_Left),   shiftPrevScreen)

  , ((0, xF86XK_AudioLowerVolume   ), spawn "pactl set-sink-volume 0 -5%")
  , ((0, xF86XK_AudioRaiseVolume   ), spawn "pactl set-sink-volume 0 +5%")
  , ((0, xF86XK_AudioMute          ), spawn "pactl set-sink-mute 0 toggle")
  , ((0, xF86XK_AudioPlay             ), spawn "mpc toggle")
  , ((modMask, xF86XK_AudioRaiseVolume), spawn "mpc next")
  , ((modMask, xF86XK_AudioLowerVolume), spawn "mpc prev")

  , ((modMask, xK_i), spawn "iceweasel -p")
  ]
  ++


  [ ((modMask              , xK_d        ), switchProjectPrompt promptConfig)
  --, ((modMask .|. shiftMask, xK_d        ), withWorkspace promptConfig (windows . W.shift))
  --, ((modMask .|. shiftMask, xK_BackSpace), removeWorkspace)
  ]
  ++

  [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [0x26, 0x5b, 0x7b, 0x7d, 0x28, 0x3d, 0x2a, 0x29, 0x2b, 0x5d]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
  ++

  -- mod-{o,e,u}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
  [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_o, xK_e, xK_u] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

promptConfig :: XPConfig
promptConfig = def { position          = Top
                   , font              = "xft:DejaVu Sans:size=10"
                   --, bgColor           = myHLBG
                   --, fgColor           = myFG
                   --, fgHLight          = myBG
                   --, bgHLight          = myHL
                   --, promptKeymap      = defaultXPKeymap' wordSep
                   , promptBorderWidth = 0 }

------------------------------------------------------------------------
-- Mouse bindings

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myMouseBindings XConfig {XMonad.modMask = modMask} = M.fromList
  [
    -- mod-button1, Set the window to floating mode and move by dragging
    ((modMask, button1),
     \w -> focus w >> mouseMoveWindow w)

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, button2),
       \w -> focus w >> windows W.swapMaster)

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, button3),
       \w -> focus w >> mouseResizeWindow w)
  ]

------------------------------------------------------------------------
-- Startup hook

myStartupHook = return ()

-- Override the PP values as you would otherwise, adding colors etc depending
-- on  the statusbar used
myLogHook :: D.Client -> PP
myLogHook dbus = def { ppOutput = dbusOutput dbus }

-- Emit a DBus signal on log updates
dbusOutput :: D.Client -> String -> IO ()
dbusOutput dbus str = do
    let signal = (D.signal objectPath interfaceName memberName) {
            D.signalBody = [D.toVariant $ UTF8.decodeString str]
        }
    D.emit dbus signal
  where
    objectPath = D.objectPath_ "/org/xmonad/Log"
    interfaceName = D.interfaceName_ "org.xmonad.Log"
    memberName = D.memberName_ "Update"

------------------------------------------------------------------------
-- Main

main = do
{-   xmproc <- spawnPipe "xmobar"  -}
  dbus <- D.connectSession
  -- Request access to the DBus name
  D.requestName dbus (D.busName_ "org.xmonad.Log")
      [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]

  xmonad $ dynamicProjects projects defaults {
      {--      logHook = dynamicLogWithPP xmobarPP {
            ppOutput = hPutStrLn xmproc
          , ppTitle = xmobarColor xmobarTitleColor "" . shorten 100
          , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
          , ppSep = "   "
      } >> updatePointer (0.5, 0.5) (0.5, 0.5) >> myLogHook
      --}
        logHook = dynamicLogWithPP (myLogHook dbus) >> updatePointer (0.5, 0.5) (0.5, 0.5)
      , manageHook = manageSpawn <+> manageDocks <+> myManageHook
      , startupHook = setWMName "LG3D"
      , handleEventHook = docksEventHook <+> fullscreenEventHook
--       , handleEventHook    = fullscreenEventHook
  }

defaults = desktopConfig {
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,
    keys               = myKeys,
    mouseBindings      = myMouseBindings,
    layoutHook         = myLayout,
    manageHook         = myManageHook,
    startupHook        = myStartupHook
}

