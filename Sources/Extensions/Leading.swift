//
//  SnapKit+Leading.swift
//  SnapLink
//
//  Created by jian on 2023/8/10.
//

// MARK: leading
public extension SnapViewDSL {
    /// 【左边距，默认 10 】
    /// 可设置
    @discardableResult
    func leading(_ offset: ExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .leading, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距 】
    @discardableResult
    func leading(_ offset: XaxisOffset) -> Self {
        guard let ret = verify(at: .leading, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeLeading(_ offset: ExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .leading, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func leading(by anchor: ViewXaxisAnchor?, offset: ExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .leading, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func leading(by view: AppView, offset: ExtraValue = nil) -> Self {
        guard let ret = verify(at: .leading, from: view.lyt.leading, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeLeading(by anchor: ViewXaxisAnchor?, offset: ExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .leading, from: anchor, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeLeading(by view: AppView, offset: ExtraValue = nil) -> Self {
        guard let ret = verify(at: .leading, from: view.lyt.safeLeading, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左中边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingCenterY(_ leading: XaxisOffset,
                        _ centerY: YaxisOffset? = nil) -> Self
    {
        guard let centerY = centerY else {
            return self.leading(leading)
                .centerY(by: leading.raw.item?.view.lyt.centerY)
        }
        return self.leading(leading)
            .centerY(centerY)
    }
    
    /// 【左中边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingCenterY(by leading: AppView, offset: ExtraValue = nil) -> Self {
        return self.leading(by: leading, offset: offset)
            .centerY(by: leading)
    }
}

// MARK: 左上 左下(done)
public extension SnapViewDSL {
    /// 【左上边距，默认 10 】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingTop(_ value: ExtraValue = .eq(.offset)) -> Self {
        return self.leading(value)
            .top(value)
    }
    
    @discardableResult
    func leadingTop(by view: AppView, offset: ExtraValue = nil) -> Self {
        return self.leading(by: view, offset: offset)
            .top(by: view, offset: offset)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeLeadingTop(_ value: ExtraValue = .eq(.offset)) -> Self {
        return self.safeLeading(value)
            .safeTop(value)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeLeadingTop(by view: AppView, offset: ExtraValue = nil) -> Self {
        return self.safeLeading(by: view, offset: offset)
            .safeTop(by: view, offset: offset)
    }
    
    /// 【左上边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingTop(_ leading: XaxisOffset,
                    _ top: YaxisOffset) -> Self
    {
        return self.leading(leading)
            .top(top)
    }
    
    /// 【左上边距】
    /// 若需要 offset 动态变化，将值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingTop(_ leading: ExtraValue,
                    _ top: ExtraValue) -> Self
    {
        return self.leading(leading)
            .top(top)
    }
    
    /// 【左下边距，默认 10 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingBottom(_ value: ExtraValue = .eq(.offset)) -> Self {
        return self.leading(value)
            .bottom(value)
    }
    
    @discardableResult
    func leadingBottom(by view: AppView, offset: ExtraValue = nil) -> Self {
        return self.leading(by: view, offset: offset)
            .bottom(by: view, offset: offset)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeLeadingBottom(_ value: ExtraValue = .eq(.offset)) -> Self {
        return self.safeLeading(value)
            .safeBottom(value)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeLeadingBottom(by view: AppView, offset: ExtraValue = nil) -> Self {
        return self.safeLeading(by: view, offset: offset)
            .safeBottom(by: view, offset: offset)
    }
    
    /// 【左下边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingBottom(_ leading: XaxisOffset,
                       _ bottom: YaxisOffset) -> Self
    {
        return self.leading(leading)
            .bottom(bottom)
    }
    
    /// 【左下边距 】
    /// 若需要 offset 动态变化，将值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingBottom(_ leading: ExtraValue,
                       _ bottom: ExtraValue) -> Self
    {
        return self.leading(leading)
            .bottom(bottom)
    }
}
