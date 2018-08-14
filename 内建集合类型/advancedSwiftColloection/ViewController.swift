//
//  ViewController.swift
//  advancedSwiftColloection
//
//  Created by 姜守栋 on 2018/8/10.
//  Copyright © 2018年 Munger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let array = [1, 1, 1]
//        print(array.map{$0 * $0})
//        for x in array.dropFirst(3)
//            print(x)
//        }
//        for x in array.dropLast(5) {
//            print(x)
//        }
//        if let index = array.index(where: { $0 == 8}) {
//            print(index == 6)
//        }
//        if let index = array.index(of: 8) {
//            print(index)
//        }
//        let array1 = [1, 1, 2];
//        let storeVersion = "3.14.10"
//        let currentVersion = "3.130.10"
        
//        print(storeVersion.versionToInt().lexicographicallyPrecedes(currentVersion.versionToInt()))
//        print(array.lexicographicallyPrecedes(array1))
//        var numbers = [30, 40, 20, 30, 60, 10, nil];
//        let p = numbers.partition(by: {$0 > 30})
//        let head = numbers.prefix(upTo: p)
//        let end = numbers.suffix(from: p)
//        print(p)
        
//        let p = numbers.map { $0 /  10 }
//
//        print(p)
        
        // map 函数： map就是把模板代码分离出来，这些模板代码不会随着每次调用发生变化，发生变化的是那些功能代码，也就是如何变化每个元素的逻辑代码。map函数通过接受调用者所提供的变换函数作为参数来做到这一点。这就是将行为进行参数化的一种设计模式。
//        let possibleNumbers = ["1", "2", "three", "///4///", "5"]
//
//        let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
//        // [1, 2, nil, nil, 5]
//
//        let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
//        // [1, 2, 5]
//        print(mapped, compactMapped)
//        var numbers = [30, 40, 20, 30, 60, 10]
//        if let max =  numbers.max() {
//            print(max)
//        }
//        print(numbers.starts(with: [30, 40, 10]))
//        print(numbers.split(separator: 50))
//        print(numbers.prefix(while: {$0 > 10}))
//        print(numbers.drop(while: { $0 > 20 }))
//        print(numbers.sorted(by: {$0 > $1 }))
//        print(numbers.contains(where: { $0 > 100 }))
//
//        let names = ["Paula", "Elena", "Zoe"]
//        print(names.last(where: {$0.hasSuffix("a")}))
//        print(numbers.accumulate(0, +))
//        print(numbers.reduce(0, +))
//        print(numbers.all(matching: {$0 % 2 == 0}))
//        print(numbers.reduce("", {$0 + "\($1),"}))
//        let suits = ["♠", "♥", "♣", "♦"]
//        let ranks = ["J","Q","K","A"]
//
//        let result = suits.flatMap { suit in
//            ranks.map { rank in
//                (suit, rank)
//            }
//        }
//        print(result)
//
//        let slice = numbers[1...]
//        print(Array(slice), type(of: Array(slice)))
        
        //MARK: - 字典:
        //   字典其实是哈希表，字典通过键的hashvalue来为每个键指定一个位置，以及它所对应的存储。这也是Dictionary要求它的key类型需要遵守Hashable协议的原因。标准库中所有的基本数据类型都是遵守Hashable协议的。包括字符串，整数，浮点数，布尔值以及不带有关联值的枚举类型。
        // 优秀的哈希算法特性：1、较少的哈希碰撞；2、快速计算。
        //MARK: - Set:
        // 看做成只有键没有值的字典即：有键无值的字典。因此，Set中的元素也必须是遵守Hashable协议的。
        // Set应用场景： 高效测试一个序列中是否包含某个元素：O(1) ，数组为O(n)
        
        let defaultSettings: [String: Setting] = [
            "Airplane Mode": .bool(false),
            "Name": .text("My iphone"),
            
        ]
        
        var settings = defaultSettings
        let overrideSettings: [String: Setting] = [
            "Name": .text("Jane's iPhone"),
        ]
        settings.merge(overrideSettings, uniquingKeysWith: { (current, new) in new })
        print(settings)
        
        let settingsAsStrings = settings.mapValues { setting -> String in
            switch setting {
            case .text( let text ): return text
            case .int(let num ): return String(num)
            case .bool( let value): return String(value)
            }
        }
        print(settingsAsStrings)
        
//        let singleDigitNumber = 0..<10
//        Array(singleDigitNumber)
//        let lowercaseLetters = Character("a")...Character("z")
        
//        print(lowercaseLetters.overlaps("c"..<"f"))
        
        let frequencies = "hello".frequencies
        frequencies.filter { $0.value > 1 }
        print(frequencies, frequencies.filter { $0.value > 1 })
        
        settings.map {
            print($0)
        }
        
        let arr = [1,2,3,12,1,3,4,5,6,4,6]
        print(arr.unique())
        print(arr.frequencies)
        
    }
}
enum Setting {
    case text(String)
    case int(Int)
    case bool(Bool)
}
extension String {
    func versionToInt() -> [Int] {
        return self.components(separatedBy: ".")
            .map{ Int.init($0) ?? 0}
    }
}

