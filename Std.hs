module Std (std_env) where

import Type

std_env=
    [[
    (ClosedDef "+" (TermVal (Lambda ["x","y"] (Termf (Op 1) [(TermVar "x" emptyENV) , (TermVar "y" emptyENV)] emptyENV))))
    ,(ClosedDef "-" (TermVal (Lambda ["x","y"] (Termf (Op 2) [(TermVar "x" emptyENV) , (TermVar "y" emptyENV)] emptyENV))))
    ,(ClosedDef "*" (TermVal (Lambda ["x","y"] (Termf (Op 3) [(TermVar "x" emptyENV) , (TermVar "y" emptyENV)] emptyENV))))
    ,(ClosedDef "/" (TermVal (Lambda ["x","y"] (Termf (Op 4) [(TermVar "x" emptyENV) , (TermVar "y" emptyENV)] emptyENV))))
    ,(ClosedDef "if" (TermVal (Lambda ["x","y","z"] (Termf (Op 5) [(TermVar "x" emptyENV) , (TermVar "y" emptyENV) , (TermVar "z" emptyENV)] emptyENV))))
    ,(ClosedDef "seq!" (TermVal (Lambda ["x","y"] (Termf (Op 6) [(TermVar "x" emptyENV) , (TermVar "y" emptyENV)] emptyENV))))
    ,(ClosedDef "seq_def!" (TermVal (Lambda ["x"] (Termf (Op 7) [(TermVar "x" emptyENV)] emptyENV))))
    ]]
