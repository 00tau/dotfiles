------------------------------------------------------------------------
-- Xmonad configuration file by Thomas Friedrich (friedrich@suud.de)
--
import System.IO
import System.Exit

import Data.Maybe
import qualified Data.Map as Map

import Control.Monad (liftM2)

import XMonad

import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook

import XMonad.Actions.CopyWindow
import XMonad.Actions.CycleWS
import XMonad.Actions.DwmPromote
import XMonad.Actions.RotSlaves
import XMonad.Actions.WindowGo
import XMonad.Actions.GridSelect

import XMonad.Util.NamedScratchpad
import XMonad.Util.Run(spawnPipe)

import XMonad.Layout.NoBorders
import XMonad.Layout.IM
import XMonad.Layout.TwoPane
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.Named
import XMonad.Layout.Grid

import qualified XMonad.StackSet as W
import qualified XMonad.Prompt as P

import Data.Ratio ((%))
import Graphics.X11.ExtraTypes.XF86

-- I really use this a lot
role = stringProperty "WM_WINDOW_ROLE"
special = "#159828"
comment = "#999988"
hiddenc = "#7b7b7b"
urgendc = "#ebac54"

------------------------------------------------------------------------
-- Run xmonad with configuration myConfig
--
main = do
  status <- spawnPipe myDzenStatus -- xmonad status on the left
  conky  <- spawnPipe myDzenConky  -- conky status on the right
  spawn "/home/friedrich/.autostart"
  xmonad $ withUrgencyHook NoUrgencyHook $ myConfig status

------------------------------------------------------------------------
-- Xmonad configuration
--
-- myWorkspaces, myManageHook, myLayout, myKeys
--
myConfig status = defaultConfig
           { terminal           = "xterm"
           , focusFollowsMouse  = True
           , borderWidth        = 1
           , modMask            = mod4Mask
           , normalBorderColor  = comment
           , focusedBorderColor = special
           , handleEventHook    = ewmhDesktopsEventHook
           , startupHook        = setWMName "lg3d"
           , workspaces         = myWorkspaces
           , manageHook         = myManageHook
           , layoutHook         = myLayout
           , keys               = myKeys
           , logHook            = myLogHook status
           }

------------------------------------------------------------------------
-- Statusbar 
--
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP
        { ppCurrent           =   dzenColor special "black" . addIcons
        , ppVisible           =   dzenColor "white" "black" . addIcons
        , ppHidden            =   dzenColor "white" "black" . addIcons
        , ppHiddenNoWindows   =   dzenColor comment "black" . addIcons
        , ppUrgent            =   dzenColor urgendc "black" . addIcons
        , ppWsSep             =   " "
        , ppSep               =   " | "
        , ppLayout            =   dzenColor special "black" .
                                    (\x -> case x of
                                       "Tile" -> "^i(" ++ myIcons ++ "empty.xbm)"
                                       "Pane" -> "^i(" ++ myIcons ++ "half.xbm)"
                                       "Tabd" -> "^i(" ++ myIcons ++ "info_01.xbm)"
                                       "Full" -> "^i(" ++ myIcons ++ "full.xbm)"
                                       "Grid" -> "^i(" ++ myIcons ++ "cpu.xbm)"
                                       _      -> x
                                    )
        , ppTitle             =   (" " ++) . dzenColor "white" "black" . dzenEscape
        , ppOutput            =   hPutStrLn h
        } where myIcons = "/home/friedrich/Dropbox/.icons/"
                addIcons x = case x of
                    "webbing"   -> "^i(" ++ myIcons ++ "fox.xbm)"
                    "editing"   -> "^i(" ++ myIcons ++ "cat.xbm)"
                    "chatting"  -> "^i(" ++ myIcons ++ "bug_01.xbm)"
                    "listening" -> "^i(" ++ myIcons ++ "note.xbm)"
                    "NSP"       -> "^i(" ++ myIcons ++ "mem.xbm)"
                    _           -> x

myDzenStatus = "dzen2 -ta l -h 18 -bg black"
myDzenConky = "conky -c ~/.xmonad/conkyrc | dzen2 -x 900 -w 300 -ta r -h 18 -bg black"

------------------------------------------------------------------------
-- Scratchpads
--
-- The used programs obviously need to be installed on the system,
-- namely: urxvt, pcmanfm and the google-chromium-chat extension.
--
myScratchpads =
    [ NS "term" "xterm -class ScratchIt -e tmux new-session -s 00tau" (className =? "ScratchIt")
          (customFloating $ W.RationalRect (1%16) (1%32) (7%8) (2%3))
    , NS "fold" "pcmanfm --no-desktop" (className =? "Pcmanfm")
          (customFloating $ W.RationalRect (1%2) 0 (1%2) 1)
    , NS "chat" "pidgin" (role =? "conversation")
          (customFloating $ W.RationalRect (1%2) 0 (1%2) (1%2))
    ]

------------------------------------------------------------------------
-- Workspaces
--
-- The different workspaces used in the set up are sorted
-- by theme of use.
--
myWorkspaces :: [String]
myWorkspaces =
    [ "webbing"
    , "editing"
    , "chatting"
    , "listening"
    , "NSP"]

------------------------------------------------------------------------
-- Window rules
--
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook :: ManageHook
myManageHook = manageDocks <+> namedScratchpadManageHook myScratchpads <+> composeAll
    [ role =? "browser"              --> doShift "webbing"
    , className =? "Gvim"            --> doShift "editing"
    , className =? "Xpdf"            --> doShift "editing"
    , className =? "Evince"            --> doShift "editing"
    , className =? "Pidgin"          --> doShift "chatting"
    , className =? "Skype"           --> doShift "chatting"
    , className =? "Vlc"             --> doShift "listening"
    , className =? "Clementine"      --> doShift "listening"
    , className =? "Gimp"            --> doFloat
    , className =? "Wicd-client.py"  --> doFloat
    , className =? "Xfce4-notifyd"   --> doIgnore
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)
    ] -- where unfloat = ask >>= doF . W.sink

------------------------------------------------------------------------
-- Layouts
--
-- Provides three layouts, namely
--   (1) one resizable with the mouse,
--   (2) one two pane layout,
--   (3) one tabbed layout.
-- where (1)+(2) can be toggeled into fullscreen.
--
myLayout = smartBorders $ avoidStrutsOn [] $
               toggleLayouts Full mChat
               ||| toggleLayouts Full tChat
               ||| toggleLayouts Grid bChat
    where
    msepane  = mouseResizableTile {draggerType = BordersDragger}
    twopane  = TwoPane (1%100) (1%2)
    tabpane  = tabbed shrinkText tabConfig
    mChat    = named "Tile" $ withIM (1%7) (Role "conversation") msepane
    tChat    = named "Pane" $ withIM (1%7) (Role "conversation") twopane
    bChat    = named "Tabd" $ withIM (1%7) (Role "conversation") tabpane

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
tabConfig = defaultTheme
    { activeBorderColor = "#000000"
    , activeTextColor = special
    , activeColor = comment
    , inactiveBorderColor = "#000000"
    , inactiveTextColor = special
    , inactiveColor = "#000000"
    }

------------------------------------------------------------------------
-- Keybindings used for manipulating frames and workspaces
--

myKeys :: XConfig Layout -> Map.Map (ButtonMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modm})
    = Map.fromList $
      [ ((0, xK_Menu), dmenu)
      , ((0   , xF86XK_Launch1), spawn "xscreensaver-command -lock")
      , ((modm, xF86XK_Launch1), spawn "~/.rat-hack")
      --
      , ((0, xF86XK_AudioLowerVolume), spawn "amixer -- sset Master playback 10%-")
      , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -- sset Master playback 10%+")
      , ((0, xF86XK_AudioMute), spawn "amixer -- sset Master playback toggle")
      --
      , ((modm                , xK_Print), spawn "scrot -q 100") -- shot of whole screen
      , ((modm .|. shiftMask  , xK_Print), spawn "scrot -q 100 -s") -- shot of one frame
      , ((modm .|. controlMask, xK_Print), spawn "scrot -q 100 -m") -- shot of xinemera
      --
      , ((modm, xK_7         ), sendMessage ToggleStruts)
      , ((modm, xK_5         ), withFocused $ windows . W.sink)
--      , ((modm, xK_3         ),
      , ((modm, xK_1         ), spawn "xscreensaver-command -lock")
      , ((modm, xK_9         ), spawn "~/.rat-hack")
      , ((modm, xK_0         ), swapScreens)
      , ((modm, xK_2         ), screenWorkspace 1 >>= flip whenJust (windows . W.view))
      , ((modm, xK_4         ), screenWorkspace 0 >>= flip whenJust (windows . W.view))
      , ((modm, xK_6         ), io (exitWith ExitSuccess))
      , ((modm, xK_8         ), refresh)
      , ((modm, xK_Tab       ), spawn "killall trayer dzen2 && xmonad --recompile && xmonad --restart")
      --
      , ((modm, xK_question  ), toggleWS' ["NSP"])
      , ((modm, xK_odiaeresis), shiftToPrev)
      , ((modm, xK_comma     ), shiftToNext)
      , ((modm, xK_period    ), prevWS) 
      , ((modm, xK_p         ), nextWS)
      , ((modm, xK_y         ), moveTo Next NonEmptyWS)
--      , ((modm, xK_f         ),
      , ((modm, xK_g         ), sendMessage ToggleLayout)
      , ((modm, xK_c         ), windows W.focusUp)
      , ((modm, xK_r         ), rotSlavesUp)
      , ((modm, xK_l         ), windows W.swapUp)
      , ((modm, xK_slash     ), rBib)
      --
      , ((modm, xK_a         ), dmenu)
      , ((modm, xK_o         ), windows copyToAll)
      , ((modm, xK_e         ), kill)
      , ((modm, xK_u         ), killAllOtherCopies)
      , ((modm, xK_i         ), kill1)
      , ((modm, xK_d         ), windows W.focusMaster)
      , ((modm, xK_h         ), dwmpromote)
      , ((modm, xK_t         ), windows W.focusDown)
      , ((modm, xK_n         ), rotSlavesDown)
      , ((modm, xK_s         ), windows W.swapDown)
      , ((modm, xK_ssharp    ), rChat)
      , ((modm, xK_minus     ), moveTo Next NonEmptyWS)
      --
--      , ((modm, xK_adiaeresis),
--      , ((modm, xK_udiaeresis),
--      , ((modm, xK_q         ),
--      , ((modm, xK_j         ),
--      , ((modm, xK_k         ),
--      , ((modm, xK_x         ),
      , ((modm, xK_b         ), rTerm)
      , ((modm, xK_m         ), rEditor)
      , ((modm, xK_w         ), rBrowser)
      , ((modm, xK_v         ), rReader)
      , ((modm, xK_z         ), rFold)
      --
      , ((modm, xK_Up        ), sendMessage ShrinkSlave)
      , ((modm, xK_Down      ), sendMessage ExpandSlave)
      , ((modm, xK_Left      ), sendMessage Shrink)
      , ((modm, xK_Right     ), sendMessage Expand)
      , ((modm .|. shiftMask, xK_Left ), sendMessage (IncMasterN 1))
      , ((modm .|. shiftMask, xK_Right), sendMessage (IncMasterN (-1)))
      --
      , ((modm,                 xK_space), sendMessage NextLayout)
      , ((modm .|. shiftMask,   xK_space), sendMessage ToggleLayout)
      , ((modm .|. controlMask, xK_space), setLayout $ XMonad.layoutHook conf)
      --
      , ((modm,                 xK_Return), spawn $ XMonad.terminal conf)
      , ((modm .|. shiftMask,   xK_Return), swapScreens)
      ]
    where dmenu     = spawn "exe=`dmenu_run | yeganesh` && eval \"exec $exe\""
          rEditor   = runOrRaiseNext "gvim" (className =? "Gvim" <||> className =? "Emacs")
          rEditorC  = runOrCopy      "gvim" (className =? "Gvim" <||> className =? "Emacs")
          rBrowser  = runOrRaiseNext "firefox" (role =? "browser")
          rBrowserC = runOrCopy      "firefox" (role =? "browser")
          rReader   = raiseNext (className =? "Evince")
          rReaderC  = runOrCopy "evince" (className =? "Evince")
          rBib      = raiseNext (className =? "Mendeleydesktop")
          rTerm = namedScratchpadAction myScratchpads "term"
          rChat = namedScratchpadAction myScratchpads "chat"
          rFold = namedScratchpadAction myScratchpads "fold"
          swapScreens = do
            screen <- gets (listToMaybe . W.visible . windowset)
            whenJust screen $ windows . W.greedyView . W.tag . W.workspace
