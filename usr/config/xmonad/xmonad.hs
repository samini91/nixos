{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

import           Data.Default                   ( def )
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


main :: IO ()
main =
  xmonad $ def
    {
      modMask = mod4Mask
    , borderWidth = 4
    , focusedBorderColor = "#000000"
    , startupHook = myStartupHook
    , keys = \c -> mykeys c `M.union` keys def c
    }

myStartupHook =
  do
    spawn "xmodmap ~/.Xmodmap &"
    SpawnOnce.spawnOnce "nitrogen --restore &"
    SpawnOnce.spawnOnce "compton &"
    SpawnOnce.spawnOnce "emacs --daemon &"
    
    
mykeys (XConfig {modMask = modm}) = M.fromList $
         [ ((modm , xK_e), spawn "emacsclient -c") ]
