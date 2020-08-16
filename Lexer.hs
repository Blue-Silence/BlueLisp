module Lexer
(term_gen)where

import Type
import Eval
import Lexer_help
import Data.Char


term_gen :: [String]->Term

term_gen (x:[]) = constrtSingle x
term_gen (_:"Lambda":xs) = (constrtLambda . dropLast) xs 
term_gen (_:xs) = let (x:y:ys) = (chunken . dropLast) xs 
                    in 
                        if isDef y 
                            then let env=createENV (y:ys) in ((appENV env) . term_gen) x
                            else Terms (term_gen x) (map term_gen (y:ys)) emptyENV

isDef (_:"def":_) = True
isDef _ = False      

constrtSingle :: String->Term  --构造常量/标识符
constrtLambda :: [String]->Term --构造Lambda表达式
createENV :: [[String]]->ENV 

constrtSingle a@(x:xs)
    |isNumber x = TermVal (Num (read a))
--    |isSyscall a = TermVal (Op (constrtNot a))
    |otherwise = TermVar (constrtNot a) emptyENV

constrtLambda s = let (binder,t)=split "->" s
                    in TermVal (Lambda (map constrtNot binder) (term_gen t))

----------------------------------------------------------------------------------------------------------------

createENV x = [map createDef x] --与ENV实现有关

createDef ("(":"def":n:xs)=Def (constrtNot n) ((term_gen . dropLast) xs) 

constrtNot x = x --与Not实现有关