//
//  SnapKit+horz.swift
//  SnapLink
//
//  Created by jian on 2023/8/10.
//

// MARK: 水平

public extension SnapViewDSL {
    /// 【左右边距，默认 10 】
    @discardableResult
    func horz(_ offset: Float = .offset) -> Self {
        return self.leading(offset.extval)
            .trailing(offset.extval)
    }
    
    /// 【左右安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeHorz(_ offset: Float = .offset) -> Self {
        return self.safeLeading(offset.extval)
            .safeTrailing(offset.extval)
    }
    
    /// 【左右边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func horz(_ leading: ExtraValue,
              _ trailing: ExtraValue) -> Self
    {
        return self.leading(leading)
            .trailing(trailing)
    }
    
    /// 【左右安全边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeHorz(_ leading: ExtraValue,
                  _ trailing: ExtraValue) -> Self
    {
        return self.safeLeading(leading)
            .safeTrailing(trailing)
    }
    
    /// 【左右边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func horz(_ leading: XaxisOffset,
              _ trailing: XaxisOffset) -> Self
    {
        return self.leading(leading)
            .trailing(trailing)
    }
    
    @discardableResult
    func horz(by view: AppView,
              leading: ExtraValue = nil,
              trailing: ExtraValue = nil) -> Self
    {
        return self.leading(by: view.lyt.leading, offset: leading)
            .trailing(by: view.lyt.trailing, offset: trailing)
    }
}
