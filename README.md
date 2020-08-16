# BlueLisp
A toy language for practice.

语法结构:
    Lambda表达式:  (Lambda x y ...  -> (...))
                            (标识符)     (表达式)
    表达式1:  (t1 t2 t3 ...)
             (t为表达式/常量)
    表达式2:  (t1 d1 d2 ...)
             (d为定义)
    定义:  (def n t) 
            (n为标识符)
    标识符:  由非数字字符开头,不得为关键字"def","->",不包含'(',')'

语言Feature:
    1.惰性求值
    2.闭包
    3.自动柯里化

内置函数:


    eq? 
        exp: (eq? Null 1) =>False
    + 
        exp: (+ 1 2) =>3
    -
    *
    /

    if
        exp: (if True 1 Null) =>1
             (if False 1 Null) =>Null

    seq! --对表达式进行按序求值,返回第二个表达式值
        exp: (seq! 1 2) =>2
    seq_def! --对最内层Def进行按序求值绑定
        exp: ((+ a y) (def z 3) (def a 4)) (def x 1) (def y 2))
        求值顺序:   3       1         2
    
    cons
        exp: (cons 1 Null) =>(Cons 1 Null)
    car
        exp: (car (Cons 1 Null)) =>1
    cdr
        exp: (cdr (Cons 1 Null)) =>Null

    toStr --将值转为Cons结构字符串
    printStr --打印字符串
    
未实现功能:
    1.GC
    2.IO(部分)
    
使用说明:
    调用Interface模块中的interpreter,输入量为String,输出量为Val(定义于Type模块中)

Example:
    (
        (foo x y)
        (def foo (Lambda a b -> (- (+ a b) z)))
        (def z 3)
        (def x 6)
        (def y 2)
    )
   => Val 5


Note:高中学生狗,Bug多勿怪