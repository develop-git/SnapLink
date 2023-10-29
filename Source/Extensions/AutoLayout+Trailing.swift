//
//  SnapKit+Trailing.swift
//  AutoLayout
//
//  Created by jian on 2023/8/10.
//


// MARK: trailing

public extension AutoLayoutViewDSL {
    
    /// 【右边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func trailing(_ offset: AutoLayoutExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .trailing, extra: offset.invertVal) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    @discardableResult
    func trailing(_ offset: AutoLayoutCompoundExtraXaxisValue) -> Self {
        guard let ret = verify(at: .trailing, from: offset.raw.item, extra: offset.raw.offset.invertVal, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右安全边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingSafe(_ offset: AutoLayoutExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .trailing, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右边距，默认 10 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func trailing(by anchor: AppViewXaxisAnchor?, offset: AutoLayoutExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .trailing, from: anchor, extra: offset.invertVal) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右边距】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func trailing(by view: AppView, offset: AutoLayoutExtraValue = nil) -> Self {
        guard let ret = verify(at: .trailing, from: view.lyt.trailing, extra: offset.invertVal) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右安全边距 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingSafe(by anchor: AppViewXaxisAnchor?, offset: AutoLayoutExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .trailing, from: anchor, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingSafe(by view: AppView, offset: AutoLayoutExtraValue = nil) -> Self {
        guard let ret = verify(at: .trailing, from: view.lyt.trailingSafe, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .trailing, extra: ret.extra)
    }
    
    /// 【右中边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingCenterY(_ trailing: AutoLayoutCompoundExtraXaxisValue,
                         _ centerY: AutoLayoutCompoundExtraYaxisValue? = nil) -> Self
    {
        guard let centerY = centerY else {
            return self.trailing(trailing)
                .centerY(by: trailing.raw.item?.view.lyt.centerY)
        }
        return self.trailing(trailing)
            .centerY(centerY)
    }
    
    /// 【右中边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingCenterY(by trailing: AppView, offset: AutoLayoutExtraValue = nil) -> Self {
        return self.trailing(by: trailing, offset: offset)
            .centerY(by: trailing)
    }
}

// MARK: 右上 右下(done)

public extension AutoLayoutViewDSL {
    /// 【右上边距，默认 10 】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingTop(_ value: AutoLayoutExtraValue = .eq(.offset)) -> Self {
        return self.trailing(value)
            .top(value)
    }
    
    @discardableResult
    func trailingTop(by view: AppView, offset: AutoLayoutExtraValue = nil) -> Self {
        return self.trailing(by: view, offset: offset)
            .top(by: view, offset: offset)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingTopSafe(_ value: AutoLayoutExtraValue = .eq(.offset)) -> Self {
        return self.trailingSafe(value)
            .topSafe(value)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingTopSafe(by view: AppView, offset: AutoLayoutExtraValue = nil) -> Self {
        return self.trailingSafe(by: view, offset: offset)
            .topSafe(by: view, offset: offset)
    }
    
    /// 【右上边距 】
    /// 若需要 offset 动态变化，将值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingTop(_ trailing: AutoLayoutExtraValue,
                     _ top: AutoLayoutExtraValue) -> Self
    {
        return self.trailing(trailing)
            .top(top)
    }
    
    /// 【右上边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingTop(_ trailing: AutoLayoutCompoundExtraXaxisValue,
                     _ top: AutoLayoutCompoundExtraYaxisValue) -> Self
    {
        return self.trailing(trailing)
            .top(top)
    }
    
    /// 【右下边距，默认 10 】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingBottom(_ value: AutoLayoutExtraValue = .eq(.offset)) -> Self {
        return self.trailing(value)
            .bottom(value)
    }
    
    @discardableResult
    func trailingBottom(by view: AppView, offset: AutoLayoutExtraValue = nil) -> Self {
        return self.trailing(by: view, offset: offset)
            .bottom(by: view, offset: offset)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingBottomSafe(_ value: AutoLayoutExtraValue = .eq(.offset)) -> Self {
        return self.trailingSafe(value)
            .bottomSafe(value)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingBottomSafe(by view: AppView, offset: AutoLayoutExtraValue = nil) -> Self {
        return self.trailingSafe(by: view, offset: offset)
            .bottomSafe(by: view, offset: offset)
    }
    
    /// 【右下边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingBottom(_ trailing: AutoLayoutExtraValue,
                        _ bottom: AutoLayoutExtraValue) -> Self
    {
        return self.trailing(trailing)
            .bottom(bottom)
    }
    
    /// 【右下边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingBottom(_ trailing: AutoLayoutCompoundExtraXaxisValue,
                        _ bottom: AutoLayoutCompoundExtraYaxisValue) -> Self
    {
        return self.trailing(trailing)
            .bottom(bottom)
    }
}
