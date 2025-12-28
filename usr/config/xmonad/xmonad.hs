{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

-- import           Data.Default                   ( def )
import qualified Data.Map                      as M
import           XMonad
import           XMonad.Hooks.ManageDocks       ( manageDocks )
import           XMonad.Hooks.SetWMName         ( setWMName )
import           XMonad.Layout.LayoutModifier   ( ModifiedLayout )
import           XMonad.Layout.ThreeColumns     ( ThreeCol(ThreeColMid) )
import           XMonad.Util.Types              ( Direction2D(U, D, L, R) )
import qualified System.Exit                   as X
import qualified XMonad.Layout.Decoration      as D
import qualified XMonad.Layout.Grid            as L
import qualified XMonad.Layout.MultiToggle     as MT
import qualified XMonad.Layout.Reflect         as L
import qualified XMonad.Layout.Spacing         as L
import qualified XMonad.StackSet               as W
import qualified XMonad.Util.CustomKeys        as C
import qualified XMonad.Util.SpawnOnce         as SpawnOnce
import qualified XMonad.Util.Run               as Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Actions.CopyWindow

import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ScreenCorners
import XMonad.Hooks.FadeWindows

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Config.Desktop


-- import XMonad.Operations (unGrab)
--import XMonad.Util.Ungrab


import XMonad.Util.NamedScratchpad

import XMonad.Layout.Magnifier

import XMonad.Hooks.EwmhDesktops
import XMonad.Util.ClickableWorkspaces


main :: IO ()
main =
  xmonad $ withSB mySB . ewmh . docks $ myConfig  -- . defToggleStrutsKey
  -- . withEasySB (statusBarProp "xmobar" (clickableWrap myXmobarPP)) defToggleStrutsKey
  --  . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey
  


myStatusBar = "xmobar -x 0 ~/.xmobarrc/xmobar.hs"

myStartupHook =
  do
    spawn "xmodmap ~/.Xmodmap &"
    SpawnOnce.spawnOnce "nitrogen --restore &"
    SpawnOnce.spawnOnce "picom &"
    SpawnOnce.spawnOnce "emacs --daemon &"
    
    
mykeys (XConfig {modMask = modm}) = M.fromList $
         [ ((modm , xK_e), spawn "emacsclient -c") ]

temp = [
  "<action=xdotool key alt+" ++ "1" ++ ">" ++ "a" ++ "</action>",
  "<action=xdotool key alt+" ++ "2" ++ ">" ++ "b" ++ "</action>"
       ]

myConfig = desktopConfig
    {
      modMask = mod4Mask
--    , workspaces = temp
    , borderWidth = 4
    , focusedBorderColor = "#000000"
    , startupHook = myStartupHook
    , logHook = myLogHook
    , keys = \c -> mykeys c `M.union` keys def c
    }


myPP :: PP
myPP = filterOutWsPP [scratchpadWorkspaceTag] $ def
        { ppCurrent = xmobarColor "#4381fb" "" . wrap "[" "]"
        , ppHidden = xmobarColor "#d1426e" "" -- . clickableWS
        , ppHiddenNoWindows = xmobarColor "#061d8e" "" -- . clickableWS
        , ppUrgent = xmobarColor "#fa5c5f" "" -- . clickableWS
        , ppTitle = xmobarColor "#ffffff" "" . shorten 50 
        , ppSep = "<fc=#909090> | </fc>"
        , ppWsSep = "<fc=#666666> . </fc>"
        , ppExtras = [windowCount] 
        , ppOrder = \(ws:l:t:ex) -> [ws,l]++ex++[t]
        }

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

mySB :: StatusBarConfig
mySB = statusBarProp myStatusBar
       --(copiesPP (xmobarColor "#6435e6" "" . clickableWS) myPP)
       (copiesPP (xmobarColor "#6435e6" "") myPP)

myLogHook = do
    fadeWindowsLogHook myFadeHook
    statusBarPPLogHook

myFadeHook :: Query Opacity
myFadeHook = composeAll 
    [ opaque
    , isUnfocused --> transparency 0.10
    , isFullscreen --> opaque
    ]

statusBarPPLogHook :: X ()
statusBarPPLogHook = dynamicLogWithPP $ myPP 

--myXmobarPP :: PP
--myXmobarPP = def
--    { ppSep             = magenta " • "
--    , ppTitleSanitize   = xmobarStrip
--    , ppCurrent         = magenta . wrap "[" "]"
--    , ppHidden          = white . wrap " " ""
--    , ppHiddenNoWindows = lowWhite . wrap " " ""
--    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
--    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
--    , ppExtras          = [logTitles formatFocused formatUnfocused]
--    , ppTitle           = magenta . shorten 60
--    }
--  where
--    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
--    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow
--
--    -- | Windows should have *some* title, which should not not exceed a
--    -- sane length.
--    ppWindow :: String -> String
--    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30
--
--    blue, lowWhite, magenta, red, white, yellow :: String -> String
--    magenta  = xmobarColor "#ff79c6" ""
--    blue     = xmobarColor "#bd93f9" ""
--    white    = xmobarColor "#f8f8f2" ""
--    yellow   = xmobarColor "#f1fa8c" ""
--    red      = xmobarColor "#ff5555" ""
--    lowWhite = xmobarColor "#bbbbbb" ""
--
--
