module Sys(
    syscall
   ,fList
   ,nameList
   ,isSyscall
)where

import Type


syscall :: Val->[Val]->Val

syscall (Op n) x = (match n fList) x

fList ::[(Not,([Val]->Val))] --syscall名称与实际函数对应关系(由实现决定)
nameList ::[String] --syscall名称(由实现决定)

isSyscall x = elem x nameList 

match n ((id,f):idfs)
    |n==id = f 
    |otherwise = match n idfs


-----------------------------------------------------------------------------------------
--Where the magic happens

fList = [
    ("+",plus)
   ,("-",minus)]

nameList = ["+","-"]

plus ((Num x):(Num y):[])=Num (x+y)
minus ((Num x):(Num y):[])=Num (x-y)