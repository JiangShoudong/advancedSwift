//
//  MyData.swift
//  Structure&Class Practice
//
//  Created by 姜守栋 on 2018/8/14.
//  Copyright © 2018年 Munger. All rights reserved.
//

import Foundation

struct MyData {
    
    fileprivate var _data: Box<NSMutableData>
    
    fileprivate var _dataForWriting: NSMutableData {
        mutating get {
//            _data = _data.mutableCopy() as! NSMutableData
//            return _data
            
            /// 写时复制技术实现
            if !isKnownUniquelyReferenced(&_data) {
                _data = Box(_data._unbox.mutableCopy() as! NSMutableData)
            }
            
            return _data._unbox
        }
    }
    
    init() {
        _data = Box(NSMutableData())
    }
    
    init(_ data: NSData) {
        _data = Box(data.mutableCopy() as! NSMutableData)
    }
    
}

extension MyData {
    
   mutating func append(_ byte: UInt8) {
         var mutableByte = byte
    print("MyData\(_data)")
        _dataForWriting.append(&mutableByte, length: 1)
    print(_data)
    }
    
}

final class Box<A> {
    var _unbox: A
    init(_ value: A) {  _unbox = value }
}
