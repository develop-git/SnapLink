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
    func horz(_ offset: Float = .offset) -> Self {
        return self.leading(offset.alv)
            .trailing(offset.alv)
    }
    
    /// 水平动态扩展
    @discardableResult
    func horzDynamic(_ type: AutoLayoutDynamicType = .fixedStart, _ offset: Float = .offset) -> Self {
        switch type {
        case .fixedStart:
            return self.leading(offset.alv)
                .trailing(.max(offset))
        case .fixedEnd:
            return self.leading(.min(offset))
                .trailing(offset.alv)
        case .fixedCenter:
            return self.leading(.min(offset))
                .trailing(.max(offset))
        }
    }
    
    /// 【左右安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func horzSafe(_ offset: Float = .offset) -> Self {
        return self.leadingSafe(offset.alv)
            .trailingSafe(offset.alv)
    }
    
    /// 【左右边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func horz(_ leading: AutoLayoutExtraValue,
              _ trailing: AutoLayoutExtraValue) -> Self
    {
        return self.leading(leading)
            .trailing(trailing)
    }
    
    /// 【左右安全边距】
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
              leading: AutoLayoutExtraValue = nil,
              trailing: AutoLayoutExtraValue = nil) -> Self
    {
        return self.leading(by: view.lyt.leading, offset: leading)
            .trailing(by: view.lyt.trailing, offset: trailing)
    }
}
