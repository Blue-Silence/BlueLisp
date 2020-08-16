module Eval(
    eval
   ,appENV
)where

import Type


eval :: Term->Val

eval (TermVal v) = v
eval (TermVar var env) = eval (getDef env var)
eval (Terms t1 ts env) = let t1_val=(eval . (appENV env)) t1 
                            in eval (Termf t1_val ts env)
eval (Termf v ts env) = case v of
                        (Op n) -> let ts'=map ((appENV env)) ts 
                                    in eval (syscall n ts')
                        (Lambda _ _)->let ts_envd=map (appENV env) ts 
                                        in eval (funApply v ts_envd)


getDef :: ENV->Not->Term
appENV :: ENV->Term->Term 
funApply :: Val->[Term]->Term

funApply (Lambda [] t) _ = t 
funApply v [] =TermVal v 
funApply (Lambda (n:ns) t) (it:its) = let t_n=bind (ClosedDef n it) t 
                                        in funApply (Lambda ns t_n) its 


mapOnENV :: (ENV->ENV)->Term->Term 
mapOnENV f t = case t of
    (Terms t1 ts env)->Terms t1 ts (f env)
    (Termf v ts env)->Termf v ts (f env)
    (TermVar name env)->TermVar name (f env)
    (TermVal v)->case v of 
                    (Lambda ns term)->TermVal (Lambda ns (mapOnENV f term))
                    _->TermVal v


syscall :: Int->[Term]->Term

syscall n x = (match n fList) x

match n ((id,f):idfs)
    |n==id = f 
    |otherwise = match n idfs

------------------------------------------------------------------------------------------
--与 ENV 实现相关

bind :: Def->Term->Term
bind def t = let f=(\(e:es)->(def:e):es) in mapOnENV f t

appENV env_n t=let f=(\env->env++env_n) in mapOnENV f t 


getDef (e:es) n = let maybeTerm=findMatch n e 
                    in case maybeTerm of 
                        Just (Def _ t)->appENV (e:es) t
                        Just (ClosedDef _ t)->t 
                        _->getDef es n 

findMatch _ []=Nothing
findMatch n (d:ds)
    |(getN d)==n = Just d
    |otherwise=findMatch n ds 
        where getN (Def n _)=n
              getN (ClosedDef n _)=n

----------------------------------------------------------------------------------------------------
--外部调用部分 

fList = [
    (1,plus)
   ,(2,minus)
   ,(3,mul)
   ,(4,division)
   ]

plus (x:y:[])=let (Num xv)=eval x in let (Num yv)=eval y in TermVal (Num (xv+yv))
minus (x:y:[])=let (Num xv)=eval x in let (Num yv)=eval y in TermVal (Num (xv-yv))
mul (x:y:[])=let (Num xv)=eval x in let (Num yv)=eval y in TermVal (Num (xv*yv))
division (x:y:[])=let (Num xv)=eval x in let (Num yv)=eval y in TermVal (Num (div xv yv))