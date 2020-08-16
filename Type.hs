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
            deriving (Show,Eq)


data Val = Num Int
          |Op Int
          |Lambda [Not] Term
          |Boolean Bool
          |Character Char
          |Cons Val Val
          |Null
            deriving (Show,Eq)


type Not = [Char]


type ENV = [[Def]]

emptyENV=[[]]


data Def = Def Not Term 
          |ClosedDef Not Term
            deriving (Show,Eq)