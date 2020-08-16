module Interface(interpreter)where

import Type
import Lexer
import Eval 
import Std

interpreter :: String->Val

interpreter=eval . (appENV std_env) . term_gen . words . preProcess





preProcess :: String->String --在 '(' , ')' 周围加上空格
preProcess []=[]
preProcess (x:xs) = if ((x=='(')||(x==')')) then ' ':x:' ':(preProcess xs) else x:(preProcess xs)