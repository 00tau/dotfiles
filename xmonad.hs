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

import qualified XMonad.StackSet as W
import qualified XMonad.Prompt as P

import Data.Ratio ((%))

------------------------------------------------------------------------
-- Run xmonad with the defaults below
--
main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobar.hs"
  xmonad $ myConfig {
               logHook = dynamicLogWithPP $ xmobarPP {
                           ppOutput = hPutStrLn xmproc
                         , ppTitle = xmobarColor "#FFB6B0" "" . shorten 100
                         , ppCurrent = xmobarColor "#CEFFAC" ""
                         , ppSep = "   "}
             , startupHook = setWMName "LG3D"
             }

------------------------------------------------------------------------
-- Xmonad configuration
--
-- myWorkspaces, myManageHook, myLayout, myKeys
--
myConfig = defaultConfig {
             terminal           = "xterm" -- "urxvt -pe tabbed"
           , focusFollowsMouse  = True
           , borderWidth        = 1
           , modMask            = mod4Mask
           , normalBorderColor  = "#7c7c7c"
           , focusedBorderColor = "#ffb6b0"
           , workspaces         = myWorkspaces
           , manageHook         = myManageHook
           , layoutHook         = myLayout
           , keys               = myKeys
           }

-- I really use this a lot
role = stringProperty "WM_WINDOW_ROLE"

------------------------------------------------------------------------
-- Scratchpads
--
-- The used programs obviously need to be installed on the system,
-- namely: urxvt, pcmanfm and the google-chromium-chat extension.
--
myScratchpads =
    [ NS "term" "urxvt" (className =? "URxvt") -- urxvt -pe tabbed
             (customFloating $ W.RationalRect (1/16) 0 (7/8) (2/3))
    , NS "fold" "pcmanfm --no-desktop" (className =? "Pcmanfm")
             (customFloating $ W.RationalRect (1/2) 0 (1/2) 1)
    , NS "chat" "xterm" (className =? "Chromium" <&&> role =? "pop-up")
             (customFloating $ W.RationalRect 0 0 (1/3) 1)
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
    , "reading"
    , "managing"
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
-- FIXME: Use >>= instead of two entries ??
--
myManageHook :: ManageHook
myManageHook = manageDocks <+> namedScratchpadManageHook myScratchpads <+> composeAll
    [ className =? "Evolution"       --> doShift "webbing"
    -- , className =? "Firefox"         --> doShift "webbing"
    -- , className =? "Chromium" <&&> role =? "pop-up" --> unfloat -- doShift "chatting"
    -- , className =? "Chromium" <&&> title /=? "Chat" --> doShift "webbing"
    , className =? "Chromium"        --> doShift "webbing"
    , className =? "Gvim"            --> doShift "editing"
    -- , className =? "Emacs"           --> doShift "editing"
    -- , className =? "Mendeleydesktop" --> doShift "editing"
    , className =? "Xpdf"            --> doShift "reading"
    -- , className =? "Evince"          --> doShift "reading"
    -- , className =? "Okular"          --> unfloat
    -- , className =? "Okular"          --> viewShift "reading"
    -- , className =? "Nautilus"        --> doShift "managing"
    -- , className =? "Thunar"          --> doShift "managing"
    -- , className =? "Pcmanfm"         --> doShift "managing"
    -- , className =? "Skype"           --> doShift "chatting"
    -- , className =? "Xchat"           --> doShift "chatting"
    , className =? "Vlc"             --> doShift "listening"
    , className =? "Rhythmbox"       --> doShift "listening"
    , resource  =? "Manager"         --> doShift "NSP"
    , className =? "Galculator"      --> doFloat
    , className =? "Gimp"            --> doFloat
    , resource  =? "gpicview"        --> doFloat
    , className =? "MPlayer"         --> doFloat
    -- , title     =? "EmacsMinibuffer" --> doFloat
    -- , title     =? "EmacsMinibuffer" --> doIgnore
    , className =? "Wicd-client.py"  --> doFloat
    , resource  =? "desktop_window"  --> doIgnore
    -- , isFullscreen --> (doF W.focusDown <+> doFullFloat)
    -- , className =? "Empathy" <&&> title =? "Kontaktliste" --> doShift "chatting"
    ]
    where unfloat   = ask >>= doF . W.sink
          -- viewShift = doF . liftM2 (.) W.greedyView W.shift

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
               ||| bChat
    where
    msepane  = mouseResizableTile {draggerType = BordersDragger}
    twopane  = TwoPane (1%100) (1%2)
    tabpane  = tabbed shrinkText tabConfig
    mChat    = withIM (1%7) (Role "pop-up") msepane
    tChat    = withIM (1%7) (Role "pop-up") twopane
    bChat    = withIM (1%7) (Role "pop-up") tabpane

-- Colors for text and backgrounds of each tab when in "Tabbed" layout.
tabConfig = defaultTheme {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#CEFFAC",
    activeColor = "#000000",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#000000"
}

------------------------------------------------------------------------
-- Keybindings used for manipulating frames and workspaces
--

myKeys :: XConfig Layout -> Map.Map (ButtonMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modm})
    = Map.fromList $
      [ ((0, xK_Menu), dmenu)
      , ((modm, xK_7         ), sendMessage ToggleStruts)
      , ((modm, xK_5         ), withFocused $ windows . W.sink)
      , ((modm, xK_3         ), spawn "xscreensaver-command -lock")
      , ((modm, xK_1         ), spawn "scrot -s") -- single frame shot
      , ((modm, xK_9         ), spawn "scrot") -- full screen shot
--      , ((modm, xK_0         ), 
--      , ((modm, xK_2         ),
--      , ((modm, xK_4         ),
      , ((modm, xK_6         ), io (exitWith ExitSuccess))
      , ((modm, xK_8         ), refresh)
      , ((modm, xK_Tab       ), restart "xmonad" True)
      --
      , ((modm, xK_question  ), toggleWS' ["NSP"])
      , ((modm, xK_odiaeresis), screenWorkspace 0 >>= flip whenJust (windows . W.view))
      , ((modm, xK_comma     ), screenWorkspace 1 >>= flip whenJust (windows . W.view))
--      , ((modm, xK_period    ),
--      , ((modm, xK_p         ),
--      , ((modm, xK_y         ),
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
      , ((modm, xK_adiaeresis), shiftToPrev)
      , ((modm, xK_udiaeresis), shiftToNext)
      , ((modm, xK_q         ), prevWS) 
      , ((modm, xK_j         ), nextWS)
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
          rBrowser  = runOrRaiseNext "chromium" (className =? "Chromium" <&&> role =? "browser")
          rBrowserC = runOrCopy      "chromium" (className =? "Chromium" <&&> role =? "browser")
          rReader   = raiseNext (className =? "Okular" <||> className =? "Evince")
          rReaderC  = runOrCopy "evince" (className =? "Okular" <||> className =? "Evince")
          rBib      = raiseNext (className =? "Mendeleydesktop")
          rTerm = namedScratchpadAction myScratchpads "term"
          rChat = namedScratchpadAction myScratchpads "chat"
          rFold = namedScratchpadAction myScratchpads "fold"
          swapScreens = do
            screen <- gets (listToMaybe . W.visible . windowset)
            whenJust screen $ windows . W.greedyView . W.tag . W.workspace
