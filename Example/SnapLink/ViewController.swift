//
//  ViewController.swift
//  SnapLink
//
//  Created by FullStack-Jian on 11/08/2023.
//  Copyright (c) 2023 FullStack-Jian. All rights reserved.
//

import UIKit
import SnapLink

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let temp = UIView()
        temp.backgroundColor = .cyan
        temp.snapIn(view)
            // 不设置具体底部边距，则视图具有向下扩展的能力
            .safeMargins(.unbottom, 0)
        
        let lab1 = textlab("第一个文本数据，视图可压缩展示")
        let lab2 = textlab("第二个文本数据，占据剩余所有空间，并具有动态增加特性")
        
        lab1.snapIn(temp)
            .width(.min(100))
            .leading()
            // 安全区域基础上再偏移10
            .safeTop(10)
            // 压缩视图
            .compress(true)
            .bottom(.max(10))
        
        lab2.snapIn(temp)
            .leading(by: lab1.lyt.trailing)
            .trailing()
            // 未叠加安全区域 偏移10
            .top()
            // 底部动态扩展，最大距离底部10（lab2相对于temp）
            .bottom(.max(10))
    }
    
    func textlab(_ text: String) -> UILabel {
        let lab = UILabel()
        lab.text = text
        lab.backgroundColor = .orange
        return lab
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
}

