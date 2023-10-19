//
//  SnapKit+horz.swift
//  AutoLayout
//
//  Created by jian on 2023/8/10.
//


// MARK: 水平

public extension AutoLayoutViewDSL {
    /// 【左右边距，默认 10 】
    @discardableResult
    func horz(_ offset: CGFloat = .offset) -> Self {
        return self.leading(offset)
            .trailing(offset)
    }
    
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func horz(_ offset: AutoLayoutExtraValue) -> Self {
        switch offset.raw.restrict.raw.relation {
        case .equal:
            return self.leading(offset)
                .trailing(offset)
        case .min:
            return self.leading(offset)
                .trailing(AutoLayoutExtraValue.max(offset.raw.val))
        case .max:
            return self.leading(offset)
                .trailing(AutoLayoutExtraValue.min(offset.raw.val))
        }
    }
    
    /// 【左右安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func horzSafe(_ offset: CGFloat = .offset) -> Self {
        return self.leadingSafe(offset)
            .trailingSafe(offset)
    }
    
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func horzSafe(_ offset: AutoLayoutExtraValue) -> Self {
        switch offset.raw.restrict.raw.relation {
        case .equal:
            return self.leadingSafe(offset)
                .trailingSafe(offset)
        case .min:
            return self.leadingSafe(offset)
                .trailingSafe(AutoLayoutExtraValue.max(offset.raw.val))
        case .max:
            return self.leadingSafe(offset)
                .trailingSafe(AutoLayoutExtraValue.min(offset.raw.val))
        }
    }
    
    @discardableResult
    func horz(_ leading: CGFloat,
              _ trailing: CGFloat) -> Self
    {
        return self.leading(leading)
            .trailing(trailing)
    }
    
    /// 【左右边距，默认 10 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func horz(_ leading: AutoLayoutExtraValue,
              _ trailing: AutoLayoutExtraValue) -> Self
    {
        return self.leading(leading)
            .trailing(trailing)
    }
    
    /// 【左右安全边距，默认 10 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func horzSafe(_ leading: AutoLayoutExtraValue,
                  _ trailing: AutoLayoutExtraValue) -> Self
    {
        return self.leadingSafe(leading)
            .trailingSafe(trailing)
    }
    
    /// 【左右边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func horz(_ leading: AutoLayoutCompoundExtraXaxisValue,
              _ trailing: AutoLayoutCompoundExtraXaxisValue) -> Self
    {
        return self.leading(leading)
            .trailing(trailing)
    }
    
    @discardableResult
    func horz(by view: AppView,
              leading: AutoLayoutExtraValue = .eq(.zero),
              trailing: AutoLayoutExtraValue = .eq(.zero)) -> Self
    {
        return self.leading(by: view.lyt.leading, offset: leading)
            .trailing(by: view.lyt.trailing, offset: trailing)
    }
}
