//
//  FunctionVC1.swift
//  函数的灵活性
//
//  Created by 姜守栋 on 2018/8/31.
//  Copyright © 2018年 Munger. All rights reserved.
//

import UIKit


class FunctionVC1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let myArray = [1,4,0, 3, 9]
//        print(myArray.sorted())
//        print(myArray.sorted(by: >))
//        var numberStrings = [(2, "Two"),  (1, "One"),(3, "Three")]
//        print(numberStrings.sorted(by: >))
        let people = [
            Person(first: "Emily", last: "Young", yearOfBirth: 2002),
            Person(first: "David", last: "Gray", yearOfBirth: 1991),
            Person(first: "Robert", last: "Barnes", yearOfBirth: 1985),
            Person(first: "Ava", last: "Barnes", yearOfBirth: 2000),
            Person(first: "Joanne", last: "Miller", yearOfBirth: 1994),
            Person(first: "Ava", last: "Barnes", yearOfBirth: 1998),
        ]
        
//     sortedArray(using:  descriptors) ：这个方法为了确定两个元素之间的顺序，他会先使用第一个描述符，并检查其结果。如果两个元素在第一个描述符下相同，那么他将使用第二个描述，以此类推。
//        排序描述符用到了两个OC运行时特性，首先，key是oc的键路径，他其实是一个包含属性名字的链表。第二个是oc运行时的键值编程，它可以在运行时通过键查找一个对象上对应的值。
        
//        let lastDescriptor = NSSortDescriptor(key: #keyPath(Person.last), ascending: true,
//                                              selector: #selector(NSString.localizedStandardCompare(_:)))
//        let firstDescriptor = NSSortDescriptor(key: #keyPath(Person.first), ascending: true,
//                                              selector: #selector(NSString.localizedStandardCompare(_:)))
//        let yearDescriptor = NSSortDescriptor(key: #keyPath(Person.yearOfBirth),
//                                               ascending: true)
//        let descriptors = [lastDescriptor, firstDescriptor, yearDescriptor]
//        let sorted =  (people as NSArray).sortedArray(using:  descriptors) as! [Person]
//        sorted.map { print($0.first)}
        
        print(people.sorted { $0.yearOfBirth < $1.yearOfBirth } )
        
        typealias SortDescriptor<Value> = (Value, Value) -> Bool
        
//        let sortedByYear: SortDescriptor<Person> = { $0. yearOfBirth < $1.yearOfBirth }
//        let sortedByLastName: SortDescriptor<Person> = {
//            $0.last.localizedStandardCompare($1.last) == .orderedAscending
//        }
        
    }
    
}


@objcMembers // 此标记的作用是被标记的类的所有成员都将在Objective-C中可见
final class Person: NSObject {
    let first: String
    let last: String
    let yearOfBirth: Int
    init(first: String, last: String, yearOfBirth: Int) {
        self.first = first
        self.last = last
        self.yearOfBirth = yearOfBirth
    }
}


