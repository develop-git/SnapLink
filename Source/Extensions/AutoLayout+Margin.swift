//
//  SnapKit+margins.swift
//  AutoLayout
//
//  Created by jian on 2023/8/10.
//

// MARK: - ------ margins ------
public extension AutoLayoutViewDSL {
    
    /// 【充满父视图】
    @discardableResult
    func fill() -> Self {
        return self.top(0).bottom(0)
            .leading(0).trailing(0)
    }
    
    /// 【充满父视图】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func fillSafe() -> Self {
        return self.topSafe(0).bottomSafe(0)
            .leadingSafe(0).trailingSafe(0)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右 边距，默认 10 】
    @discardableResult
    func margins(_ len: Float = .offset) -> Self {
        let lv = len.alv
        return self.top(lv).bottom(lv)
            .leading(lv).trailing(lv)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func marginsSafe(_ len: Float = .offset) -> Self {
        let lv = len.alv
        return self.topSafe(lv).bottomSafe(lv)
            .leadingSafe(lv).trailingSafe(lv)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右 不同边距 】
    @discardableResult
    func margins(_ inset: EdgeInsets) -> Self {
        return self.top(inset.top.alv).bottom(inset.bottom.alv)
            .leading(inset.left.alv).trailing(inset.right.alv)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右 不同安全边距 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func marginsSafe(_ inset: EdgeInsets) -> Self {
        return self.topSafe(inset.top.alv).bottomSafe(inset.bottom.alv)
            .leadingSafe(inset.left.alv).trailingSafe(inset.right.alv)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右可选 安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func marginsSafe(_ edges: RectEdge, _ len: Float = .offset) -> Self {
        let lv = len.alv
        if edges.contains(.all) {
            return self.topSafe(lv).bottomSafe(lv)
                .leadingSafe(lv).trailingSafe(lv)
        }
        /// top
        if edges.contains(.top) {
            self.topSafe(lv)
        }
        /// left
        if edges.contains(.left) {
            self.leadingSafe(lv)
        }
        /// right
        if edges.contains(.right) {
            self.trailingSafe(lv)
        }
        /// bottom
        if edges.contains(.bottom) {
            self.bottomSafe(lv)
        }
        return self
    }
    
    /// 【以传入的数值设置当前对象的 上下左右可选 边距，默认 10 】
    @discardableResult
    func margins(_ edges: RectEdge, _ len: Float = .offset) -> Self {
        let lv = len.alv
        if edges.contains(.all) {
            return self.top(lv).bottom(lv)
                .leading(lv).trailing(lv)
        }
        /// top
        if edges.contains(.top) {
            self.top(lv)
        }
        /// left
        if edges.contains(.left) {
            self.leading(lv)
        }
        /// right
        if edges.contains(.right) {
            self.trailing(lv)
        }
        /// bottom
        if edges.contains(.bottom) {
            self.bottom(lv)
        }
        return self
    }
}
