//
//  ViewController.swift
//  AutoLayout
//
//  Created by 承轩 on 10/08/2023.
//  Copyright (c) 2023 承轩. All rights reserved.
//

import AutoLayoutLink
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        /** 等价关系
         lab.layoutIn(view)
            ||
         view.addSubview(lab)
         lab.lyt
         */
        
        // 使用案例
        // MARK: 顶部偏移
        topExample()
        // MARK: 底部偏移
        bottomExample()
        // MARK: leading
//        leadingExample()
        // MARK: trailing
//        trailingExample()
        // MARK: 外边距margin<->fill
//        marginsExample()
//        fillExample()
        // MARK: 水平间距
//        horizontalExample()
        // MARK: 垂直边距
//        verticalExample()
        // MARK: 网格布局
//        grid()
        // MARK: 线性布局
//        linear()
        test()
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
        lab.layoutIn(view)
            .size(10.0) // size = 10
            .size(.fill) // size = view.size
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
        lab.layoutIn(view)
            .width(10) // width = 10
            .width(.max(30)) // width <= 30
            .width(.min(30)) // width >= 30
            .width(.fill) // width = view.width
            .width(.byMult(.halfone))
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
        lab.layoutIn(view)
            .height(10) // height = 10
            .height(.max(30)) // height <= 30
            .height(.min(30)) // height >= 30
            .height(.fill) // height = view.height
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
        view.addSubview(lab)
        lab.layoutIn(view)
            // 未添加安全区域
            // 相对父视图布局
            .top(10) // offset = 10
            .top(.offset(.one)) // offset = 1.0
            .top(.max(10)) // offset <= 10
            .top(.min(10)) // offset >= 10
            // 相对目标视图布局
            .top(by: view) // offset = 10
            .top(by: view.lyt.top) // offset = 10
            .top(by: view.lyt.top, offset: .max(10)) // offset <= view.top + 10
            .top(by: view.lyt.top, offset: .min(10)) // offset >= view.top + 10
            .top(.by(view.lyt.top, offset:nil)) // offset = 0
        
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .topSafe() // offset = 10
            // 相对目标视图布局
            .topSafe(by: view) // offset = 10
            .topSafe(by: view.lyt.top) // offset = 10
        
            .leadingTop(by: view, offset: 10)
            .trailing()
            .height(.max(100))
    }
    
    // MARK: bottom

    func bottomExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加底部部边距
        lab.layoutIn(view)
            // 未添加安全区域
            // 相对父视图布局
            .bottom(10) // offset = 10
            .bottom(.max(10)) // offset <= 10
            .bottom(.min(10)) // offset >= 10
            // 相对目标视图布局
            .bottom(by: view) // offset = 10
            .bottom(by: view.lyt.bottom) // offset = 10
            .bottom(by: view.lyt.bottom, offset: .max(10)) // offset <= view.lyt.bottom - 10
            .bottom(by: view.lyt.bottom, offset: .min(10)) // offset >= view.lyt.bottom - 10
            .bottom(.by(view.lyt.bottom)) // offset = 10
        
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .bottomSafe() // offset = 10
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
        lab.layoutIn(view)
            // 未添加安全区域
            // 相对父视图布局
            .leading(10) // offset = 10
//            .leading(.zero) // offset = 0
            .leading(.offset(.one)) // offset = 1.0
            .leading(.max(10)) // offset <= 10
            .leading(.min(10)) // offset >= 10
            // 相对目标视图布局
            .leading(by: view) // offset = 10
            .leading(by: view.lyt.leading) // offset = 10
//            .leading(by: view.lyt.leading, offset: .max(10)) // offset <= view.lyt.leading + 10
//            .leading(by: view.lyt.leading, offset: .min(10)) // offset >= view.lyt.leading + 10
            .leading(.by(view.lyt.leading)) // offset = 10
        
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .leadingSafe() // offset = 10
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
        lab.layoutIn(view)
            // 未添加安全区域
            // 相对父视图布局
            .trailing(10) // offset = 10
            .trailing(.bySuper) // offset = 0
            .trailing(.offset(.one)) // offset = 1.0
            .trailing(.max(10)) // offset <= 10
            .trailing(.min(10)) // offset >= 10
            // 相对目标视图布局
            .trailing(by: view) // offset = 10
            .trailing(by: view.lyt.trailing) // offset = 10
            .trailing(by: view.lyt.trailing, offset: .max(10)) // offset <= view.lyt.trailing - 10
            .trailing(by: view.lyt.trailing, offset: .min(10)) // offset >= view.lyt.trailing - 10
            .trailing(.by(view.lyt.trailing)) // offset = 10
        
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .trailingSafe() // offset = 10
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
        lab.layoutIn(view)
            // 未添加安全区域
            // 相对父视图布局
            .horz(10) // offset = 10
            // 相对目标视图布局
            .horz(by: view) // offset = 10
            .horzDynamic(.fixedStart)
        
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .horzSafe() // offset = 10
    }
    
    // MARK: vertical

    func verticalExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加左右两侧侧边距
        lab.layoutIn(view)
            // 未添加安全区域
            // 相对父视图布局
            .vert(10) // offset = 10
            // 相对目标视图布局
            .vert(by: view) // offset = 10
            
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .vertSafe() // offset = 10
    }
    
    // MARK: margins

    func marginsExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加左右两侧侧边距
        lab.layoutIn(view)
            // 未添加安全区域
            // 相对父视图布局
            .margins(.init(len: 10.3)) // offset = 10
            .margins(.horz, 10)
            .margins(.init(horz: 10, vert: 10))
    }
    
    // MARK: fill

    func fillExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加左右两侧侧边距
        lab.layoutIn(view)
            // 未添加安全区域
            // 相对父视图布局
            .fill() // offset = 10
            // 添加安全区域
            .fillSafe()
    }
}

extension ViewController {
    // MARK: 九宫格

    func grid() {
        
        let temp = UIView()
        temp.backgroundColor = .cyan
        temp.layoutIn(view)
            .horz()
            .height(by: view, mult: 0.8)
//            .center()
            .top()
//            .top(.max(10))
        let ds = ["第一个数据","第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长","第三个","最后一个数据，非常非常","第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长","第三个","最后一个数据，非常非常","第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长","第三个","最后一个数据，非常非常"]
        var labs: [UILabel] = []
        ds.forEach { idx in
            let lab = UILabel()
            lab.text = "\(idx)"
            lab.numberOfLines = 0
            lab.backgroundColor = .red
            labs.append(lab)
        }
        labs.layoutIn(view)
            /// 九宫格布局
            .gridLayout(layout: .equal, spaces: .diff(10, 5), insets: .init(len: 1.0))
    }
    
    // MARK: 线性布局（垂直、水平）

    func linear() {
        
        let base = UIView()
        base.backgroundColor = .lightGray
        base.layoutIn(view).size(.fill)
            .bottomSafe(.max(10))
       
        let temp = UIView()
        temp.backgroundColor = .cyan
        temp.layoutIn(base)
            .width(.fill)

            .topSafe()
            .bottomSafe()
        let ds = ["第一个数据","第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长","第三个","最后一个数据，非常非常","第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长","第三个","最后一个数据，非常非常","第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长","第三个","最后一个数据，非常非常"]
        let labs: [UIView] = ds.map {
            let lv = UIView()
            lv.backgroundColor = .purple
            
            let lab1 = UILabel()
            lab1.text = $0
            lab1.backgroundColor = .red
            lab1.numberOfLines = 0
            
            lab1.layoutIn(lv).fill()
            return lv
        }
        
        labs.layoutIn(temp)
            .vertLayout(flex: false)
        
        let lab = UILabel()
        lab.text = "bottom"
        lab.backgroundColor = .yellow
        lab.layoutIn(base)
            .top(by: temp.lyt.bottom, offset: 10)
            .horz()
            .height(40)
    }
    
    func textlab(_ text: String) -> UILabel {
        let lab1 = UILabel()
        lab1.text = text
        lab1.backgroundColor = .red
        lab1.numberOfLines = 0
        return lab1
    }
    
    func test() {
        let temp = UIView()
        temp.backgroundColor = .cyan
        temp.layoutIn(view)
            // 不设置具体底部边距，则视图具有向下扩展的能力
            .marginsSafe(.unbottom, 0)
        
        let lab1 = textlab("第一个文本数据，视图可压缩展示")
        let lab2 = textlab("第二个文本数据，占据剩余所有空间，并具有动态增加特性")
        
        lab1.layoutIn(temp)
            .width(.min(100))
            .leading()
            // 安全区域基础上再偏移10
            .topSafe(10)
            // 压缩视图
            .compress()
            .bottom(.max(10))
        
        lab2.layoutIn(temp)
            .leading(by: lab1.lyt.trailing)
            .trailing()
            // 未叠加安全区域 偏移10
            .top()
            // 底部动态扩展，最大距离底部10（lab2相对于temp）
            .bottom(.max(10))
    }
}
