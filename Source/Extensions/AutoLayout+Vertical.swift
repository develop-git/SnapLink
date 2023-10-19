//
//  SnapKit+vert.swift
//  AutoLayout
//
//  Created by jian on 2023/8/10.
//


// MARK: 垂直
public extension AutoLayoutViewDSL {
    /// 【上下边距，默认 10 】
    @discardableResult
    func vert(_ offset: CGFloat = .offset) -> Self {
        return self.top(offset)
            .bottom(offset)
    }
    
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func vert(_ offset: AutoLayoutExtraValue) -> Self {
        switch offset.raw.restrict.raw.relation {
        case .equal:
            return top(offset)
                .bottom(offset)
        case .min:
            return top(offset)
                .bottom(AutoLayoutExtraValue.max(offset.raw.val))
        case .max:
            return top(offset)
                .bottom(AutoLayoutExtraValue.min(offset.raw.val))
        }
    }
    
    /// 【上下边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func vertSafe(_ offset: CGFloat = .offset) -> Self {
        return topSafe(offset)
            .bottomSafe(offset)
    }
    
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func vertSafe(_ offset: AutoLayoutExtraValue) -> Self {
        switch offset.raw.restrict.raw.relation {
        case .equal:
            return topSafe(offset)
                .bottomSafe(offset)
        case .min:
            return topSafe(offset)
                .bottomSafe(AutoLayoutExtraValue.max(offset.raw.val))
        case .max:
            return topSafe(offset)
                .bottomSafe(AutoLayoutExtraValue.min(offset.raw.val))
        }
    }
    
    @discardableResult
    func vert(_ top: CGFloat,
              _ bottom: CGFloat) -> Self
    {
        return self.top(top)
            .bottom(bottom)
    }
    
    /// 【左右边距，默认 10 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func vert(_ top: AutoLayoutExtraValue,
              _ bottom: AutoLayoutExtraValue) -> Self
    {
        return self.top(top)
            .bottom(bottom)
    }
    
    /// 【左右安全边距，默认 10 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func vertSafe(_ top: AutoLayoutExtraValue,
                  _ bottom: AutoLayoutExtraValue) -> Self
    {
        return topSafe(top)
            .bottomSafe(bottom)
    }
    
    /// 【左右边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func vert(_ top: AutoLayoutCompoundExtraYaxisValue,
              _ bottom: AutoLayoutCompoundExtraYaxisValue) -> Self
    {
        return self.top(top)
            .bottom(bottom)
    }
    
    /// 【左右边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func vert(by view: AppView,
              top: AutoLayoutExtraValue = .eq(.zero),
              bottom: AutoLayoutExtraValue = .eq(.zero)) -> Self
    {
        return self.top(by: view.lyt.top, offset: top)
            .bottom(by: view.lyt.bottom, offset: bottom)
    }
}
