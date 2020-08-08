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

内置函数:
    +,-,*,/
    
未实现功能:
    1.Bool类型
    2.if内置函数
    2.GC
    3.复合数据类型
    4.IO
    
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