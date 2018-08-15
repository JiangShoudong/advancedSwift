//
//  ViewController.swift
//  Encoing&DecodingPractice
//
//  Created by 姜守栋 on 2018/8/15.
//  Copyright © 2018年 Munger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  本质：编码： 内部数据结构 -->  可交互的数据结构；
        //             解码： 内部数据结构 <--  可交互的数据结构;
        
        let places = [
            Placemark(name: "Berlin", coordinate: Coordinate(latitude: 52, longtitude: 13)),
            Placemark(name: "Cape Town", coordinate: Coordinate(latitude: -34, longtitude: 18))
        ]
        
        do {
            let encoder = JSONEncoder()  // 创建并配置编码器
            let jsonData = try encoder.encode(places) // 将值传递进行编码。得到一个字节集合。
            let jsonString = String.init(decoding: jsonData, as: UTF8.self) // 为了显示，将字节集合转化为字符串
            print(jsonString)
            print(jsonData)
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Placemark].self, from: jsonData)
                
                print(decoded)
            } catch  {
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
}

