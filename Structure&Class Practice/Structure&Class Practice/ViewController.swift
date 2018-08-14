//
//  ViewController.swift
//  Structure&Class Practice
//
//  Created by 姜守栋 on 2018/8/14.
//  Copyright © 2018年 Munger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let theData = NSData.init(base64Encoded: "wAEP/w==") {
            
            var x = MyData(theData)
            var y = x
//            print(x._data === y._data)
            x.append(0x55)
            y.append(0x66)
            print(x, y)
        }
        
    }
}


