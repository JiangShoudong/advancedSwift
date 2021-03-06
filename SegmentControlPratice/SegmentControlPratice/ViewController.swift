//
//  ViewController.swift
//  SegmentControlPratice
//
//  Created by 姜守栋 on 2018/8/16.
//  Copyright © 2018年 Munger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initSegControl()
        
    }

    func initSegControl() {
        let segData = ["apple", "orange", "banana"]
        let segControl = UISegmentedControl.init(items: segData)
        segControl.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        // 按下按钮时的颜色
        segControl.tintColor = UIColor.init(hexString: "#EDD826")
        
        segControl.selectedSegmentIndex = 0
        
       let attributes = [NSAttributedStringKey.font: UIFont.init(name: "PingFangSC-Semibold", size: 15), NSAttributedStringKey.foregroundColor: UIColor.init(hexString: "#7F7F7F")]
        segControl.setTitleTextAttributes(attributes, for: .normal)
        
        let highlightAttributes = [NSAttributedStringKey.font: UIFont.init(name: "PingFangSC-Semibold", size: 15), NSAttributedStringKey.foregroundColor: UIColor.init(hexString: "#7F7F7F")]
        segControl.setTitleTextAttributes(highlightAttributes, for: .highlighted)
        
        let selectedAttributes = [NSAttributedStringKey.font: UIFont.init(name: "PingFangSC-Semibold", size: 15), NSAttributedStringKey.foregroundColor: UIColor.init(hexString: "#000000")]
        segControl.setTitleTextAttributes(selectedAttributes, for: .selected)
        
//        segControl.apportionsSegmentWidthsByContent = true // 设置标签宽度是否随内容自适应
        
        view.addSubview(segControl)
    }

}

extension String{
    /// 将十六进制颜色转伟UIColor
    /// - Returns: UIColor
    public func toUIColor() -> UIColor {
        //处理数值
        var cString = self.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let length = (cString as NSString).length
        //错误处理
        if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7)){
            return UIColor.white
        }
        
        if cString.hasPrefix("#"){
            cString = (cString as NSString).substring(from: 1)
        }
        
        //字符chuan截取
        var range = NSRange()
        range.location = 0
        range.length = 2
        
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        //存储转换后的数值
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
        //进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        //根据颜色值创建UIColor
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
}
extension UIColor{
    
    convenience init(hexString:String){
        //处理数值
        var cString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let length = (cString as NSString).length
        //错误处理
        if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7)){
            //返回whiteColor
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            return
        }
        
        if cString.hasPrefix("#"){
            cString = (cString as NSString).substring(from: 1)
        }
        
        //字符chuan截取
        var range = NSRange()
        range.location = 0
        range.length = 2
        
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        //存储转换后的数值
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
        //进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        //根据颜色值创建UIColor
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
}
