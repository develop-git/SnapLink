//
//  SnapKit+margins.swift
//  SnapLink
//
//  Created by jian on 2023/8/10.
//

// MARK: - ------ margins ------
public extension SnapViewDSL {
    
    /// 【充满父视图】
    @discardableResult
    func fill() -> Self {
        return self.top(0).bottom(0)
            .leading(0).trailing(0)
    }
    
    /// 【充满父视图】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeFill() -> Self {
        return self.safeTop(0).safeBottom(0)
            .safeLeading(0).safeTrailing(0)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右 边距，默认 10 】
    @discardableResult
    func margins(_ len: Float = .offset) -> Self {
        let lv = len.extval
        return self.top(lv).bottom(lv)
            .leading(lv).trailing(lv)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeMargins(_ len: Float = .offset) -> Self {
        let lv = len.extval
        return self.safeTop(lv).safeBottom(lv)
            .safeLeading(lv).safeTrailing(lv)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右 不同边距 】
    @discardableResult
    func margins(_ inset: EdgeInsets) -> Self {
        return self.top(inset.top.extval).bottom(inset.bottom.extval)
            .leading(inset.left.extval).trailing(inset.right.extval)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右 不同安全边距 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeMargins(_ inset: EdgeInsets) -> Self {
        return self.safeTop(inset.top.extval).safeBottom(inset.bottom.extval)
            .safeLeading(inset.left.extval).safeTrailing(inset.right.extval)
    }
    
    /// 【以传入的数值设置当前对象的 上下左右可选 安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeMargins(_ edges: RectEdge, _ len: Float = .offset) -> Self {
        let lv = len.extval
        if edges.contains(.all) {
            return self.safeTop(lv).safeBottom(lv)
                .safeLeading(lv).safeTrailing(lv)
        }
        /// top
        if edges.contains(.top) {
            self.safeTop(lv)
        }
        /// left
        if edges.contains(.left) {
            self.safeLeading(lv)
        }
        /// right
        if edges.contains(.right) {
            self.safeTrailing(lv)
        }
        /// bottom
        if edges.contains(.bottom) {
            self.safeBottom(lv)
        }
        return self
    }
    
    /// 【以传入的数值设置当前对象的 上下左右可选 边距，默认 10 】
    @discardableResult
    func margins(_ edges: RectEdge, _ len: Float = .offset) -> Self {
        let lv = len.extval
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
