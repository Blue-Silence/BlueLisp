module Type (
    Term(..)
   ,Val(..)
   ,Not
   ,ENV
   ,Def(..)
) where

data Term = Terms Term [Term] ENV 
           |Termf Val [Term] ENV 
           |TermVal Val 
           |TermVar Not ENV 
            deriving Show
            
data Val = Num Int
          |Op Not
          |Lambda [Not] Term 
            deriving Show

type Not = [Char]
    
type ENV = [[Def]]

data Def = Def Not Term 
          |ClosedDef Not Term
            deriving Show