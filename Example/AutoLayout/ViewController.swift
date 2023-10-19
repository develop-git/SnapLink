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
         view.layoutAv(lab)
            ||
         view.addSubview(lab)
         lab.lyt
         */
        let temp = UIView()
        temp.backgroundColor = .cyan
        view.layoutAv(temp)
            .size(200)
            .center()
        
        let lab = UILabel()
        lab.backgroundColor = .red
        lab.text = "测试label"
        temp.layoutAv(lab)
            .top()
            .horz()
        
        // 使用案例
//        topExample()
//        bottomExample()
//        leadingExample()
//        trailingExample()
//        marginsExample()
//        fillExample()
//        horizontalExample()
//        verticalExample()
//        grid()
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
        view.layoutAv(lab)
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
        view.layoutAv(lab)
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
        view.layoutAv(lab)
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
        view.addSubview(lab)
        view.layoutAv(lab)
            // 未添加安全区域
            // 相对父视图布局
            .top(10) // offset = 10
            .top(.zero) // offset = 0
            .top(.offset(.one)) // offset = 1.0
            .top(.max(10)) // offset <= 10
            .top(.min(10)) // offset >= 10
            // 相对目标视图布局
            .top(by: view) // offset = 10
            .top(by: view.lyt.top) // offset = 10
            .top(by: view.lyt.top, offset: .max(10)) // offset <= view.top + 10
            .top(by: view.lyt.top, offset: .min(10)) // offset >= view.top + 10
            .top(.by(view.lyt.top, offset:.eq(.zero))) // offset = 0
        
            // 添加安全区域, 设置思路同上
            // 相对父视图布局
            .topSafe() // offset = 10
            // 相对目标视图布局
            .topSafe(by: view) // offset = 10
            .topSafe(by: view.lyt.top) // offset = 10
        
            .leadingTop(by: view, offset: 10)
            .trailing()
            .height(100)
    }
    
    // MARK: bottom

    func bottomExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加底部部边距
        view.layoutAv(lab)
            // 未添加安全区域
            // 相对父视图布局
            .bottom(10) // offset = 10
//            .bottom(.bySuper) // offset = 0
//            .bottom(.offset(.one)) // offset = 1.0
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
        view.layoutAv(lab)
            // 未添加安全区域
            // 相对父视图布局
            .leading(10) // offset = 10
            .leading(.zero) // offset = 0
            .leading(.offset(.one)) // offset = 1.0
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
        view.layoutAv(lab)
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
            .trailing(by: view.lyt.trailing, offset: .max(10)) // offset <= view.lyt.trailing + 10
            .trailing(by: view.lyt.trailing, offset: .min(10)) // offset >= view.lyt.trailing + 10
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
        view.layoutAv(lab)
            // 未添加安全区域
            // 相对父视图布局
            .horz(10) // offset = 10
            .horz(.max(10)) // offset <= 10
            .horz(.min(10)) // offset >= 10
            // 相对目标视图布局
            .horz(by: view) // offset = 10
            .horz(.offset(.one), .offset(.max(10)))
        
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
        view.layoutAv(lab)
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
        view.layoutAv(lab)
            // 未添加安全区域
            // 相对父视图布局
            .margins(10) // offset = 10
            .margins(.horz, 10)
            .margins(.insets(.top, 10))
    }
    
    // MARK: fill

    func fillExample() {
        /// 下列方法中，根据项目需求选择其一即可,
        /// 更多使用方法，请修改参数试试
        let lab = UILabel()
        lab.backgroundColor = .green
        // lab 添加左右两侧侧边距
        view.layoutAv(lab)
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
        view.layoutAv(temp)
            .horz()
            .height(by: view, mult: 0.4)
            .center()
        
        var labs: [UILabel] = []
        (0...3).forEach { idx in
            let lab = UILabel()
            lab.text = "\(idx)"
            lab.backgroundColor = .red
            labs.append(lab)
        }
        temp.layoutAv(labs)
            /// 九宫格布局
            .gridLayout()
    }
    
    // MARK: 平分（垂直、水平）

    func divide() {
        let scroll = UIScrollView()
        scroll.backgroundColor = .yellow
        view.layoutAv(scroll)
            .fill()
        let temp = UIView()
        temp.backgroundColor = .cyan
        scroll.layoutAv(temp)
            .width(by: scroll)
            .topSafe(.zero)
            .bottomSafe(.maxzero)
        
        var labs: [UILabel] = []
        for v in ["第一个数据","第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长第二个数据，这个有点长","第三个","最后一个数据，非常非常"] {
            let lab = UILabel()
            lab.text = "\(v)"
            lab.backgroundColor = .red
            lab.numberOfLines = 0
//            lab.textAlignment = .center
            labs.append(lab)
        }
        
        let lab1 = textlab("第一个")
        let lab2 = textlab("第二个个发奥委会发恶怕我好发怕我拍发怕文峰怕我发")
        let lab3 = textlab("第三个，发呵呵高文化高啊评委会怕我骗我后果怕我胡歌怕吴哥啊我拍个啊评委会副怕文峰和怕我会平分饿啊我好发和平阿婆温和副怕我")
        lab3.font = .systemFont(ofSize: 20)
        lab3.numberOfLines = 0
        
        temp.layoutAv(lab1)
            .top(50)
            .size(100)
            .leading()
        
        temp.layoutAv(lab3)
            .height(250)
            .leading(by: lab1.lyt.trailing)
            .firstBaseline(by: lab1)
            .trailing()
        
//        temp.addSubview(lab1)
//        temp.addSubview(lab2)
//        temp.addSubview(lab3)
        
//        lab1.snp.makeConstraints { make in
//            make.top.equalTo(50)
//            make.height.equalTo(100)
//            make.leading.equalTo(temp.snp.leadingMargin)
//            make.width.equalTo(100)
//        }
//        
//        lab3.snp.makeConstraints { make in
//            make.leading.equalTo(lab1.snp.trailingMargin).offset(10)
//            make.firstBaseline.equalTo(lab1.snp.firstBaseline)
//            make.trailing.equalTo(temp.snp.trailing)
//            make.height.equalTo(250)
//        }
        
//        temp.layoutAv(labs)
//            /// 水平平分视图
////            .horzLayout(flex: true)
//        /// 垂直平分视图
//            .vertLayout()
    }
    
    func textlab(_ text: String) -> UILabel {
        let lab1 = UILabel()
        lab1.text = text
        lab1.backgroundColor = .red
        
        return lab1
    }
}
