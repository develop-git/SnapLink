//
//  SnapKit+ArrSize.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/8/10.
//

#if canImport(SnapKit)

public extension AppViewsArrayDSL {
    /// 【SnapKit:  width】
    @discardableResult
    func width(_ width: CGFloat) -> Self {
        array.forEach { $0.lyt.width(width) }
        return self
    }

    /// 【SnapKit:  width】
    @discardableResult
    func width(_ width: AutoLayoutExtraValue) -> Self {
        array.forEach { $0.lyt.width(width) }
        return self
    }

    /// 【SnapKit: 将传入视图的width/height赋值给当前对象的 width】
    @discardableResult
    func width(by anchor: AppViewSizeAnchor?, mult: AutoLayoutExtraValue = .one) -> Self {
        array.forEach { $0.lyt.width(by: anchor, mult: mult) }
        return self
    }

    /// 【SnapKit: 将传入视图的width/height赋值给当前对象的 width】
    @discardableResult
    func width(by view: AppView, mult: AutoLayoutExtraValue = .one) -> Self {
        array.forEach { $0.lyt.width(by: view, mult: mult) }
        return self
    }
}

public extension AppViewsArrayDSL {
    /// 【SnapKit: height】
    @discardableResult
    func height(_ height: CGFloat) -> Self {
        array.forEach { $0.lyt.height(height) }
        return self
    }

    /// 【SnapKit: height】
    @discardableResult
    func height(_ height: AutoLayoutExtraValue) -> Self {
        array.forEach { $0.lyt.height(height) }
        return self
    }

    /// 【SnapKit: 将传入视图的width/height赋值给当前对象的 height】
    @discardableResult
    func height(by anchor: AppViewSizeAnchor?, mult: AutoLayoutExtraValue = .one) -> Self {
        array.forEach { $0.lyt.height(by: anchor, mult: mult) }
        return self
    }

    /// 【SnapKit: 将传入视图的width/height赋值给当前对象的 height】
    @discardableResult
    func height(by view: AppView, mult: AutoLayoutExtraValue = .one) -> Self {
        array.forEach { $0.lyt.height(by: view, mult: mult) }
        return self
    }
}

public extension AppViewsArrayDSL {
    
    /// 【SnapKit: 平分父视图的width】
    /// - Parameters:
    ///   - space: 子视图间距
    ///   - inset: 整体视图外边距
    @discardableResult
    func horzLayout(space: CGFloat = .offset,
                    insets: SnapEdgeInsets = SnapEdgeInsets(10)) -> Self
    {
        array.enumerated { v, emRef in
            let offset = emRef.isfirst ? insets.left : space
            v.lyt.vert(insets.top, insets.bottom)
            v.lyt.leading(by: emRef.refer?.lyt.trailing, offset: offset)
            if emRef.islast { v.lyt.trailing(insets.right) }
            if let prev = emRef.refer { v.lyt.width(by: prev.lyt.width) }
        }
        return self
    }

    /// 【SnapKit: 平分父视图的height】
    /// - Parameters:
    ///   - space: 子视图间距
    ///   - inset: 整体视图外边距
    @discardableResult
    func vertLayout(space: CGFloat = .offset,
                    insets: SnapEdgeInsets = SnapEdgeInsets(10)) -> Self
    {
        array.enumerated { v, emrt in
            let offset = emrt.isfirst ? insets.top : space
            v.lyt.horz(insets.left, insets.right)
            v.lyt.top(by: emrt.refer?.lyt.bottom, offset: offset)
            if emrt.islast {
                v.lyt.bottom(insets.bottom)
            }
            if let prev = emrt.refer {
                v.lyt.height(by: prev.lyt.height)
            }
        }
        return self
    }

    /// 【SnapKit: 九宫格视图】
    /// - Parameters:
    ///   - colums: 布局多少列
    ///   - layout: 布局类型（相等，方形，内容适配）
    ///   - spaces: 布局间距
    ///   - inset: 布局外边距
    @discardableResult
    func gridLayout(colums: Int = 3,
                    layout: AutoLayoutGridExtraLayout = .equal,
                    spaces: AutoLayoutGridExtraValue = .global,
                    inset: SnapEdgeInsets = SnapEdgeInsets(10)) -> Self
    {
        array.enumeratedGrid(colums: colums) { v, prev, row, col in
            // rows
            let rowOffset = row.isfirst ? inset.top : spaces.raw.row
            v.lyt.top(by: row.refer?.lyt.bottom, offset: rowOffset)
            if row.islast {
                v.lyt.bottom(inset.bottom)
            }
            // cols
            let colOffset = col.isfirst ? inset.left : spaces.raw.col
            v.lyt.leading(by: col.refer?.lyt.trailing, offset: colOffset)
            if col.islast {
                v.lyt.trailing(inset.right)
            }

            if let prev = prev {
                switch layout {
                case .equal: v.lyt.size(by: prev)
                case .square: v.lyt.size(by: prev.lyt.width)
                case .flex: v.lyt.width(by: prev.lyt.width)
                }
            }
        }
        // Fix first element size layout for square
        if layout == .square, let first = array.first, let last = array.last {
            first.lyt.size(by: last)
        }
        return self
    }
}


private extension Array {
    struct EnumeratedRefer {
        var isfirst: Bool = true
        var islast: Bool = true
        var refer: Element?
        init(isfirst: Bool, islast: Bool, refer: Element?) {
            self.isfirst = isfirst
            self.islast = islast
            self.refer = refer
        }
    }
    
    /// 数组遍历
    func enumerated(_ enumerate: (_ elmt: Element, _ elmtRef: EnumeratedRefer)->Void) {
        
        guard count > 0 else { return }
        
        var prev: Element?
        
        for (i,e) in self.enumerated() {
            
            let emrt = EnumeratedRefer(isfirst: i == 0, islast: i == count - 1, refer: prev)
            enumerate(e, emrt)
            
            prev = e
        }
    }
    
    /// 九宫格遍历
    func enumeratedGrid(colums: Int, enumerate: (_ elmt: Element, _ prev: Element?, _ rowRef: EnumeratedRefer, _ colRef: EnumeratedRefer)->Void) {
        
        guard count > 0 else { return }
        
        let arr = self
        let colums = Swift.min(count, Swift.max(colums, 2))
        let rows = count % colums == 0 ? count / colums : count / colums + 1
        
        var prev: Element?
        
        for (i,e) in arr.enumerated() {
            
            let curRow = i / colums
            let curCol = i % colums
            
            let row = EnumeratedRefer(isfirst: curRow == 0, islast: curRow == rows - 1, refer: arr.at(i - colums))
            let col = EnumeratedRefer(isfirst: curCol == 0, islast: curCol == colums - 1, refer: curCol == 0 ? nil : prev)
            
            enumerate(e, prev, row, col)
            
            prev = e
        }
    }
    
    func isSafe(at index: Int) -> Bool {
        if (startIndex..<endIndex).contains(index) {
            return true
        }
        return false
    }
    
    func at(_ index: Int?) -> Element? {
        guard let index = index else { return nil }
        return isSafe(at: index) ? self[index] : nil
    }
}
#endif
