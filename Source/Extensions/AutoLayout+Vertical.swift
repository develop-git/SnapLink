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
    func vert(_ offset: Float = .offset) -> Self {
        return self.top(offset.alv)
            .bottom(offset.alv)
    }
    
    /// 垂直动态扩展
    @discardableResult
    func vertDynamic(_ type: AutoLayoutDynamicType, _ offset: Float) -> Self {
        switch type {
        case .fixedStart:
            return self.top(offset.alv)
                .bottom(.max(offset))
        case .fixedEnd:
            return self.top(.min(offset))
                .bottom(offset.alv)
        case .fixedCenter:
            return self.top(.min(offset))
                .bottom(.max(offset))
        }
    }
    
    /// 【上下边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func vertSafe(_ offset: Float = .offset) -> Self {
        return topSafe(offset.alv)
            .bottomSafe(offset.alv)
    }
    
    /// 【左右边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func vert(_ top: AutoLayoutExtraValue,
              _ bottom: AutoLayoutExtraValue) -> Self
    {
        return self.top(top)
            .bottom(bottom)
    }
    
    /// 【左右安全边距 】
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
    
    /// 【左右边距 】
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
              top: AutoLayoutExtraValue = nil,
              bottom: AutoLayoutExtraValue = nil) -> Self
    {
        return self.top(by: view.lyt.top, offset: top)
            .bottom(by: view.lyt.bottom, offset: bottom)
    }
}
