//
//  ViewController.swift
//  Function
//
//  Created by 姜守栋 on 2018/8/15.
//  Copyright © 2018年 Munger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Swift 只允许在函数声明中包含标签，这些标签不是函数类型的一部分。也就是说，现在你不能将参数标签赋值给一个类型是函数的变量，不过这在未来 的 Swift 版本中可能会有改变。
        func printInt(i: Int) {
            print("you passed \(i)")
        }
        let funcVar = printInt
        funcVar(2)
        
        func userFunction(function: (Int) -> ()) {
            function(3)
        }
        // 为什么将函数作为变量来处理这件事情如此关键?因为它让你很容易写出 “高阶” 函数，高阶函 数将函数作为参数的能力使得它们在很多方面都非常有用，我们已经在内建集合中看到过它的威力了。
        userFunction(function: printInt)
        userFunction(function: funcVar)
        
        // 函数作为返回值
        func returnFunction() -> (Int) -> String {
            func innerFunc(i: Int) -> String {
                return "you passed \(i)"
            }
            return innerFunc
        }
        
        let myFunc = returnFunction()
        
        print(myFunc(6))
        
        // 函数可以捕获存在于他们作用范围之外的变量
        func counterFunction() -> (Int) -> String {
            var counter = 0
            func innerFunc(i: Int) -> String {
                counter += i
                return "running total: \(counter)"
            }
            return innerFunc
        }
        
        let f  = counterFunction()
        print(f(3))
        print(f(4))
        
        let g = counterFunction()
        print(g(2))
        print(g(3))
        
        /// 编程术语中，一个函数和他们所捕获的变量环境组合起来，被称为 闭包。
        
        /// 函数可以使用 {} 来声明为闭包表达式
        
        func doubler(i: Int) -> Int {
            return i * 2
        }
        print([1, 2, 3, 4].map(doubler))
        
        let doublerAlt = { (i: Int) -> Int in return i * 2 } /// 函数字面量
        
        print([1, 2, 3, 4].map(doublerAlt))
        
        func isEven<T: BinaryInteger>(_ i: T) -> Bool {
            return i % 2 == 0
        }
        
        let int8IsEven: (Int8) -> Bool = isEven
        
        
    }


}

