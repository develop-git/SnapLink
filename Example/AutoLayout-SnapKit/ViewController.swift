//
//  ViewController.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 10/08/2023.
//  Copyright (c) 2023 承轩. All rights reserved.
//

import UIKit
import AutoLayout_SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 使用案例
//        topExample()
//        bottomExample()
//        leadingExample()
//        trailingExample()
//        marginsExample()
//        fillExample()
//        horizontalExample()
//        verticalExample()
        grid()
//        divide()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController {
    // MARK: size
    func sizeExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        lab.lyt
            .size(10) // size = 10
            .size(.bySuper) // size = view.size
            .size(by: view) // size = view.size
            .size(by: view.lyt.width) // size = view.width
    }
    
    // MARK: width
    func widthExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加顶部边距
        lab.lyt
            .width(10) // width = 10
            .width(.max(30)) // width <= 30
            .width(.min(30)) // width >= 30
            .width(.bySuper) // width = view.width
            .width(by: view) // width = view.width
            .width(by: view, mult: .max(0.5)) // width <= view.width * 0.5
            .width(by: view, mult: 0.5) // width = view.width * 0.5
            .width(by: view.lyt.width) // width = view.width
    }
    
    // MARK: height
    func heightExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        lab.lyt
            .height(10) // height = 10
            .height(.max(30)) // height <= 30
            .height(.min(30)) // height >= 30
            .height(.bySuper) // height = view.height
            .height(by: view) // height = view.height
            .height(by: view, mult: .max(0.5)) // height <= view.height * 0.5
            .height(by: view, mult: 0.5) // height = view.height * 0.5
            .height(by: view.lyt.height) // height = view.height
        
    }
    
    // MARK: top
    func topExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加顶部边距
        lab.lyt
            // 未添加安全区域
            // 相对父视图布局
            .top(10) // offset = 10
            .top(.bySuper) // offset = 0
            .top(.bySuperOffset(.one)) // offset = 1.0
            .top(.max(10)) // offset <= 10
            .top(.min(10)) // offset >= 10
            // 相对目标视图布局
            .top(by: view) // offset = 10
            .top(by: view.lyt.top) // offset = 10
            .top(by: view.lyt.top, offset: .max(10)) // offset <= view.top + 10
            .top(by: view.lyt.top, offset: .min(10)) // offset >= view.top + 10
            .top(.by(view.lyt.top)) // offset = 10
        
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .topSafe()// offset = 10
            // 相对目标视图布局
            .topSafe(by: view) // offset = 10
            .topSafe(by: view.lyt.top) // offset = 10
    }
    
    // MARK: bottom
    func bottomExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加底部部边距
        lab.lyt
            // 未添加安全区域
            // 相对父视图布局
            .bottom(10) // offset = 10
            .bottom(.bySuper) // offset = 0
            .bottom(.bySuperOffset(.one)) // offset = 1.0
            .bottom(.max(10)) // offset <= 10
            .bottom(.min(10)) // offset >= 10
            // 相对目标视图布局
            .bottom(by: view) // offset = 10
            .bottom(by: view.lyt.bottom) // offset = 10
            .bottom(by: view.lyt.bottom, offset: .max(10)) // offset <= view.lyt.bottom + 10
            .bottom(by: view.lyt.bottom, offset: .min(10)) // offset >= view.lyt.bottom + 10
            .bottom(.by(view.lyt.bottom)) // offset = 10
        
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .bottomSafe()// offset = 10
            // 相对目标视图布局
            .bottomSafe(by: view) // offset = 10
            .bottomSafe(by: view.lyt.bottom) // offset = 10
    }
    
    // MARK: leading
    func leadingExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加左侧边距
        lab.lyt
            // 未添加安全区域
            // 相对父视图布局
            .leading(10) // offset = 10
            .leading(.bySuper) // offset = 0
            .leading(.bySuperOffset(.one)) // offset = 1.0
            .leading(.max(10)) // offset <= 10
            .leading(.min(10)) // offset >= 10
            // 相对目标视图布局
            .leading(by: view) // offset = 10
            .leading(by: view.lyt.leading) // offset = 10
            .leading(by: view.lyt.leading, offset: .max(10)) // offset <= view.lyt.leading + 10
            .leading(by: view.lyt.leading, offset: .min(10)) // offset >= view.lyt.leading + 10
            .leading(.by(view.lyt.leading)) // offset = 10
        
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .leadingSafe()// offset = 10
            // 相对目标视图布局
            .leadingSafe(by: view) // offset = 10
            .leadingSafe(by: view.lyt.leading) // offset = 10
    }
    
    // MARK: trailing
    func trailingExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加右侧边距
        lab.lyt
            // 未添加安全区域
            // 相对父视图布局
            .trailing(10) // offset = 10
            .trailing(.bySuper) // offset = 0
            .trailing(.bySuperOffset(.one)) // offset = 1.0
            .trailing(.max(10)) // offset <= 10
            .trailing(.min(10)) // offset >= 10
            // 相对目标视图布局
            .trailing(by: view) // offset = 10
            .trailing(by: view.lyt.trailing) // offset = 10
            .trailing(by: view.lyt.trailing, offset: .max(10)) // offset <= view.lyt.trailing + 10
            .trailing(by: view.lyt.trailing, offset: .min(10)) // offset >= view.lyt.trailing + 10
            .trailing(.by(view.lyt.trailing)) // offset = 10
        
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .trailingSafe()// offset = 10
            // 相对目标视图布局
            .trailingSafe(by: view) // offset = 10
            .trailingSafe(by: view.lyt.trailing) // offset = 10
    }
    
    // MARK: horizontal
    func horizontalExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加左右两侧侧边距
        lab.lyt
            // 未添加安全区域
            // 相对父视图布局
            .horz(10) // offset = 10
            .horz(.max(10)) // offset <= 10
            .horz(.min(10)) // offset >= 10
            // 相对目标视图布局
            .horz(by: view) // offset = 10
            
        
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .horzSafe()// offset = 10
    }
    
    // MARK: vertical
    func verticalExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加左右两侧侧边距
        lab.lyt
            // 未添加安全区域
            // 相对父视图布局
            .vert(10) // offset = 10
            // 相对目标视图布局
            .vert(by: view) // offset = 10
            
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .vertSafe()// offset = 10
    }
    
    // MARK: margins
    func marginsExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加左右两侧侧边距
        lab.lyt
            // 未添加安全区域
            // 相对父视图布局
            .margins(10) // offset = 10
            .margins(.horz, 10)
            .margins(UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20).ui)
    }
    
    // MARK: fill
    func fillExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加左右两侧侧边距
        lab.lyt
            // 未添加安全区域
            // 相对父视图布局
            .fill() // offset = 10
            .fill(inset: 10)
            // 添加安全区域
            .fillSafe()
            .fillSafe(inset: 10)
    }
}

extension ViewController {
    // MARK: 九宫格
    func grid() {
        let temp = UIView()
        temp.backgroundColor = .cyan
        view.layout(temp)
            .horz()
            .height(by:view, mult: 0.4)
            .center()
        
        
        var labs:[UILabel] = []
        (0...3).forEach { idx in
            let lab = UILabel()
            lab.text = "\(idx)"
            lab.backgroundColor = .red
            labs.append(lab)
        }
        temp.layout(labs)
            /// 水平平分视图
            //.horzLayout()
            /// 九宫格布局
            .gridLayout()
    }
    
    // MARK: 平分（垂直、水平）
    func divide() {
        let temp = UIView()
        temp.backgroundColor = .cyan
        view.layout(temp)
            .horz()
            .height(by:view, mult: 0.4)
            .center()
        
        
        var labs:[UILabel] = []
        (0...3).forEach { idx in
            let lab = UILabel()
            lab.text = "\(idx)"
            lab.backgroundColor = .red
            labs.append(lab)
        }
        temp.layout(labs)
            /// 水平平分视图
            //.horzLayout()
            /// 垂直平分视图
            .vertLayout()
    }
}



