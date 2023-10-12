//
//  SnapKit+Trailing.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/8/10.
//

#if canImport(SnapKit)

// MARK: trailing

public extension AutoLayoutViewDSL {
    /// 【SnapKit: 右边距，默认 10 】
    @discardableResult
    func trailing(_ offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .trailing, extra: .equal(-offset)) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func trailing(_ offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .trailing, extra: offset.invertVal) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailing(_ offset: AutoLayoutCompoundExtraXaxisValue) -> Self {
        guard let ret = verify(at: .trailing, from: offset.raw.item, extra: offset.raw.offset.invertVal, inSafe: offset == .bySuperSafe) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingSafe(_ offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .trailing, extra: .equal(-offset), inSafe: true) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右安全边距，默认 10 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingSafe(_ offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .trailing, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右边距，默认 10 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func trailing(by anchor: AppViewXaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .trailing, from: anchor, extra: offset.invertVal) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右边距，默认 10 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func trailing(by anchor: AppViewXaxisAnchor?, offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .trailing, from: anchor, extra: .equal(-offset)) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右边距】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func trailing(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .trailing, from: view.lyt.trailing, extra: offset.invertVal) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右边距，默认 0 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func trailing(by view: AppView, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .trailing, from: view.lyt.trailing, extra: .equal(-offset)) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右安全边距 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingSafe(by anchor: AppViewXaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .trailing, from: anchor, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右安全边距，默认 10 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingSafe(by anchor: AppViewXaxisAnchor?, offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .trailing, from: anchor, extra: .equal(-offset), inSafe: true) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingSafe(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .trailing, from: view.lyt.trailingSafe, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右安全边距，默认 0 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingSafe(by view: AppView, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .trailing, from: view.lyt.trailingSafe, extra: .equal(-offset), inSafe: true) else { return self }
        return offsetBy(ret.item, for: .trailing, extra: ret.extra)
    }
    
    /// 【SnapKit: 右中边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
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
    
    /// 【SnapKit: 右中边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingCenterY(by trailing: AppView, offset: AutoLayoutExtraValue = .zero) -> Self {
        return self.trailing(by: trailing, offset: offset)
            .centerY(by: trailing)
    }
}

// MARK: 右上 右下(done)

public extension AutoLayoutViewDSL {
    /// 【SnapKit: 右上边距，默认 10 】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingTop(_ value: CGFloat = .offset) -> Self {
        return self.trailing(value)
            .top(value)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingTopSafe(_ value: CGFloat = .offset) -> Self {
        return self.trailingSafe(value)
            .topSafe(value)
    }
    
    /// 【SnapKit: 右上边距，默认 10 】
    /// 若需要 offset 动态变化，将值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingTop(_ trailing: AutoLayoutExtraValue,
                     _ top: AutoLayoutExtraValue = .global) -> Self
    {
        return self.trailing(trailing)
            .top(top)
    }
    
    /// 【SnapKit: 右上边距，默认 10 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingTop(_ trailing: AutoLayoutCompoundExtraXaxisValue,
                     _ top: AutoLayoutCompoundExtraYaxisValue = .bySuperOffset(.global)) -> Self
    {
        return self.trailing(trailing)
            .top(top)
    }
    
    /// 【SnapKit: 右下边距，默认 10 】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingBottom(_ value: CGFloat = .offset) -> Self {
        return self.trailing(value)
            .bottom(value)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingBottomSafe(_ value: CGFloat = .offset) -> Self {
        return self.trailingSafe(value)
            .bottomSafe(value)
    }
    
    /// 【SnapKit: 右下边距，默认 10 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func trailingBottom(_ trailing: AutoLayoutExtraValue,
                        _ bottom: AutoLayoutExtraValue = .global) -> Self
    {
        return self.trailing(trailing)
            .bottom(bottom)
    }
    
    /// 【SnapKit: 右下边距，默认 10 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func trailingBottom(_ trailing: AutoLayoutCompoundExtraXaxisValue,
                        _ bottom: AutoLayoutCompoundExtraYaxisValue = .bySuperOffset(.global)) -> Self
    {
        return self.trailing(trailing)
            .bottom(bottom)
    }
}

#endif
