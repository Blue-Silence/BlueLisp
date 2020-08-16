module Std (std_env) where

import Type

std_env=
    [[
    (ClosedDef "+" (TermVal (Lambda ["x","y"] (Termf (Op 1) [(TermVar "x" emptyENV) , (TermVar "y" emptyENV)] emptyENV))))
    ,(ClosedDef "-" (TermVal (Lambda ["x","y"] (Termf (Op 2) [(TermVar "x" emptyENV) , (TermVar "y" emptyENV)] emptyENV))))
    ,(ClosedDef "*" (TermVal (Lambda ["x","y"] (Termf (Op 3) [(TermVar "x" emptyENV) , (TermVar "y" emptyENV)] emptyENV))))
    ,(ClosedDef "/" (TermVal (Lambda ["x","y"] (Termf (Op 4) [(TermVar "x" emptyENV) , (TermVar "y" emptyENV)] emptyENV))))
    ]]
