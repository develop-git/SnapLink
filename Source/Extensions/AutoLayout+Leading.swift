//
//  SnapKit+Leading.swift
//  AutoLayout
//
//  Created by jian on 2023/8/10.
//


// MARK: leading
public extension AutoLayoutViewDSL {
    /// 【左边距，默认 10 】
    @discardableResult
    func leading(_ offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .leading, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func leading(_ offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .leading, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距 】
    @discardableResult
    func leading(_ offset: AutoLayoutCompoundExtraXaxisValue) -> Self {
        guard let ret = verify(at: .leading, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func leadingSafe(_ offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .leading, extra: .eq(offset), inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func leadingSafe(_ offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .leading, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func leading(by anchor: AppViewXaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .leading, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距，默认 10 】
    @discardableResult
    func leading(by anchor: AppViewXaxisAnchor?, offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .leading, from: anchor, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func leading(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .leading, from: view.lyt.leading, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左边距，默认 0 】
    @discardableResult
    func leading(by view: AppView, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .leading, from: view.lyt.leading, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func leadingSafe(by anchor: AppViewXaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .leading, from: anchor, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func leadingSafe(by anchor: AppViewXaxisAnchor?, offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .leading, from: anchor, extra: .eq(offset), inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func leadingSafe(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .leading, from: view.lyt.leadingSafe, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左安全边距，默认 0 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func leadingSafe(by view: AppView, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .leading, from: view.lyt.leadingSafe, extra: .eq(offset), inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .leading, extra: ret.extra)
    }
    
    /// 【左中边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingCenterY(_ leading: AutoLayoutCompoundExtraXaxisValue,
                        _ centerY: AutoLayoutCompoundExtraYaxisValue? = nil) -> Self
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
    func leadingCenterY(by leading: AppView, offset: AutoLayoutExtraValue = .eq(.zero)) -> Self {
        return self.leading(by: leading, offset: offset)
            .centerY(by: leading)
    }
}

// MARK: 左上 左下(done)
public extension AutoLayoutViewDSL {
    /// 【左上边距，默认 10 】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingTop(_ value: CGFloat = .offset) -> Self {
        return self.leading(value)
            .top(value)
    }
    
    @discardableResult
    func leadingTop(by view: AppView, offset: CGFloat = 0) -> Self {
        return self.leading(by: view, offset: offset)
            .top(by: view, offset: offset)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func leadingTopSafe(_ value: CGFloat = .offset) -> Self {
        return self.leadingSafe(value)
            .topSafe(value)
    }
    
    /// 【左上边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingTop(_ leading: AutoLayoutCompoundExtraXaxisValue,
                    _ top: AutoLayoutCompoundExtraYaxisValue) -> Self
    {
        return self.leading(leading)
            .top(top)
    }
    
    /// 【左上边距，默认 10 】
    /// 若需要 offset 动态变化，将值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingTop(_ leading: AutoLayoutExtraValue,
                    _ top: AutoLayoutExtraValue) -> Self
    {
        return self.leading(leading)
            .top(top)
    }
    
    /// 【左下边距，默认 10 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingBottom(_ value: CGFloat = .offset) -> Self {
        return self.leading(value)
            .bottom(value)
    }
    
    @discardableResult
    func leadingBottom(by view: AppView, offset: CGFloat = 0) -> Self {
        return self.leading(by: view, offset: offset)
            .bottom(by: view, offset: offset)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func leadingBottomSafe(_ value: CGFloat = .offset) -> Self {
        return self.leadingSafe(value)
            .bottomSafe(value)
    }
    
    /// 【左下边距，默认 10 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingBottom(_ leading: AutoLayoutCompoundExtraXaxisValue,
                       _ bottom: AutoLayoutCompoundExtraYaxisValue) -> Self
    {
        return self.leading(leading)
            .bottom(bottom)
    }
    
    /// 【左下边距，默认 10 】
    /// 若需要 offset 动态变化，将值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func leadingBottom(_ leading: AutoLayoutExtraValue,
                       _ bottom: AutoLayoutExtraValue) -> Self
    {
        return self.leading(leading)
            .bottom(bottom)
    }
}
