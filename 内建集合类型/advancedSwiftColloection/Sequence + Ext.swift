//
//  Sequence + Ext.swift
//  advancedSwiftColloection
//
//  Created by 姜守栋 on 2018/8/13.
//  Copyright © 2018年 Munger. All rights reserved.
//

import Foundation

extension Sequence where Element: Hashable {
    
    func last(where predicate: (Element) -> Bool) -> Element? {
        
        for element in reversed() where predicate(element) {
            return element
        }
        
        return nil
    }
    
    /// 判断序列中所有的元素是否都满足条件
    ///
    /// - Parameter predicate: 判断条件
    /// - Returns: 结果
    func all(matching predicate: (Element) -> Bool) -> Bool {
        // 对于一个条件，如果没有一个元素不满足它，那就意味着所有元素都满足它
        return !contains{!predicate($0)}
    }
    
    
    
    /// 序列化为字典- 统计每个元素次数
    var frequencies: [Element: Int] {
        let frequenciesPairs = self.map { ($0, 1) }
        return Dictionary.init(frequenciesPairs, uniquingKeysWith: +)
    }
    
    
    /// 按顺序获取序列中所有的唯一元素
    ///
    /// - Returns: 结果
    func unique() -> [Element] {
        var seen: Set<Element> = []
        return filter { element in
            if seen.contains(element) {
                return false
            } else {
                seen.insert(element)
                return true
            }
        }
    }
}

extension Array {
    
    func accumulate<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> [Result] {
        var running = initialResult
        return map{ next in
            running = nextPartialResult(running, next)
            return running
        }
    }
}
