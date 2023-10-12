//
//  SnapKit+margins.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/8/10.
//

#if canImport(SnapKit)

// MARK: - ------ margins ------
public extension AutoLayoutViewDSL {
    
    /// 【SnapKit: 充满父视图】
    @discardableResult
    func fill(inset: CGFloat = .zero) -> Self {
        return self.top(inset).bottom(inset)
            .leading(inset).trailing(inset)
    }
    
    /// 【SnapKit: 充满父视图】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func fillSafe(inset: CGFloat = .zero) -> Self {
        return self.topSafe(inset).bottomSafe(inset)
            .leadingSafe(inset).trailingSafe(inset)
    }
    
    /// 【SnapKit: 以传入的数值设置当前对象的 上下左右 边距，默认 10 】
    @discardableResult
    func margins(_ len: CGFloat = .offset) -> Self {
        return self.top(len).bottom(len)
            .leading(len).trailing(len)
    }
    
    /// 【SnapKit: 以传入的数值设置当前对象的 上下左右安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func marginsSafe(_ len: CGFloat = .offset) -> Self {
        return self.topSafe(len).bottomSafe(len)
            .leadingSafe(len).trailingSafe(len)
    }
    
    /// 【SnapKit: 以传入的数值设置当前对象的 上下左右 不同边距，默认 10 】
    @discardableResult
    func margins(_ inset: SnapEdgeInsets) -> Self {
        return self.top(inset.top).bottom(inset.bottom)
            .leading(inset.left).trailing(inset.right)
    }
    
    /// 【SnapKit: 以传入的数值设置当前对象的 上下左右 不同安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func marginsSafe(_ inset: SnapEdgeInsets) -> Self {
        return self.topSafe(inset.top).bottomSafe(inset.bottom)
            .leadingSafe(inset.left).trailingSafe(inset.right)
    }
    
    /// 【SnapKit: 以传入的数值设置当前对象的 上下左右可选 安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func marginsSafe(_ edges: SnapRectEdge, _ len: CGFloat = .offset) -> Self {
        if edges.contains(.all) {
            return topSafe(len).bottomSafe(len)
                .leadingSafe(len).trailingSafe(len)
        }
        /// top
        if edges.contains(.top) {
            self.topSafe(len)
        }
        /// left
        if edges.contains(.left) {
            self.leadingSafe(len)
        }
        /// right
        if edges.contains(.right) {
            self.trailingSafe(len)
        }
        /// bottom
        if edges.contains(.bottom) {
            self.bottomSafe(len)
        }
        return self
    }
    
    /// 【SnapKit: 以传入的数值设置当前对象的 上下左右可选 边距，默认 10 】
    @discardableResult
    func margins(_ edges: SnapRectEdge, _ len: CGFloat = .offset) -> Self {
        if edges.contains(.all) {
            return self.top(len).bottom(len)
                .leading(len).trailing(len)
        }
        /// top
        if edges.contains(.top) {
            self.top(len)
        }
        /// left
        if edges.contains(.left) {
            self.leading(len)
        }
        /// right
        if edges.contains(.right) {
            self.trailing(len)
        }
        /// bottom
        if edges.contains(.bottom) {
            self.bottom(len)
        }
        return self
    }
}

#endif
