module Type (
    Term(..)
   ,Val(..)
   ,Not
   ,ENV
   ,Def(..)
   ,emptyENV
) where


data Term = Terms Term [Term] ENV 
           |Termf Val [Term] ENV 
           |TermVal Val 
           |TermVar Not ENV 
            deriving Show


data Val = Num Int
          |Op Int
          |Lambda [Not] Term
          |Boolean Bool
          |Character Char
            deriving Show


type Not = [Char]


type ENV = [[Def]]

emptyENV=[[]]


data Def = Def Not Term 
          |ClosedDef Not Term
            deriving Show