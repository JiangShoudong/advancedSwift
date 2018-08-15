//
//  Coordinate.swift
//  Encoing&DecodingPractice
//
//  Created by 姜守栋 on 2018/8/15.
//  Copyright © 2018年 Munger. All rights reserved.
//

import Foundation

struct Coordinate: Codable {
    var latitude: Double
    var longtitude: Double
}

struct Placemark: Codable {
    var name: String
    var coordinate: Coordinate
}
