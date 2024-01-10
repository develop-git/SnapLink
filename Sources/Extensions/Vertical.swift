//
//  SnapKit+vert.swift
//  SnapLink
//
//  Created by jian on 2023/8/10.
//


// MARK: 垂直
public extension SnapViewDSL {
    /// 【上下边距，默认 10 】
    @discardableResult
    func vert(_ offset: Float = .offset) -> Self {
        return self.top(offset.extval)
            .bottom(offset.extval)
    }
    
    /// 【上下边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeVert(_ offset: Float = .offset) -> Self {
        return safeTop(offset.extval)
            .safeBottom(offset.extval)
    }
    
    /// 【左右边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func vert(_ top: ExtraValue,
              _ bottom: ExtraValue) -> Self
    {
        return self.top(top)
            .bottom(bottom)
    }
    
    /// 【左右安全边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeVert(_ top: ExtraValue,
                  _ bottom: ExtraValue) -> Self
    {
        return safeTop(top)
            .safeBottom(bottom)
    }
    
    /// 【左右边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func vert(_ top: YaxisOffset,
              _ bottom: YaxisOffset) -> Self
    {
        return self.top(top)
            .bottom(bottom)
    }
    
    /// 【左右边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func vert(by view: AppView,
              top: ExtraValue = nil,
              bottom: ExtraValue = nil) -> Self
    {
        return self.top(by: view.lyt.top, offset: top)
            .bottom(by: view.lyt.bottom, offset: bottom)
    }
}
