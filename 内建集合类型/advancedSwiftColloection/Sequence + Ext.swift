//
//  Sequence + Ext.swift
//  advancedSwiftColloection
//
//  Created by 姜守栋 on 2018/8/13.
//  Copyright © 2018年 Munger. All rights reserved.
//

import Foundation

extension Sequence {
    
    func last(where predicate: (Element) -> Bool) -> Element? {
        
        for element in reversed() where predicate(element) {
            return element
        }
        
        return nil
    }
    
    func all(matching predicate: (Element) -> Bool) -> Bool {
        // 对于一个条件，如果没有一个元素不满足它，那就意味着所有元素都满足它
        return !contains{!predicate($0)}
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
