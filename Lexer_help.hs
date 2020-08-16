module Lexer_help(
    chunken
   ,split
   ,dropLast
)where

chunken :: [String]->[[String]] --将[String]根据括号对称分成[[String]]
chunken [] = []
chunken (s:ss)
    |s=="(" =let (chunk,ss')=getPair 1 [] ss in (s:chunk):(chunken ss')
    |otherwise=[s]:(chunken ss)

getPair 0 re l=((reverse re),l)
getPair n re (s:ss)=let n'= if s=="(" then (n+1) else if s==")" then (n-1) else n 
                        in getPair n' (s:re) ss

split :: (Eq a)=>a->[a]->([a],[a]) --根据参数切分数组(切分后不包含原参数)
split n s =splitH n ([],s)

splitH _ (re,[])=((reverse re),[])
splitH n (re,(x:xs))
    |n==x = ((reverse re),xs)
    |otherwise = splitH n ((x:re),xs)


dropLast (x:[])=[]
dropLast (x:xs)=x:(dropLast xs)








