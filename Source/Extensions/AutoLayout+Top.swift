//
//  SnapKit+Top.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/8/10.
//

#if canImport(SnapKit)

// MARK: top

public extension AutoLayoutViewDSL {
    /// 【SnapKit: 上边距，默认 10 】
    @discardableResult
    func top(_ offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .top, extra: .equal(offset)) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 上边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func top(_ offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .top, extra: offset) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 上边距】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func top(_ offset: AutoLayoutCompoundExtraYaxisValue) -> Self {
        guard let ret = verify(at: .top, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 上安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func topSafe(_ offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .top, extra: .equal(offset), inSafe: true) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 上安全边距】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func topSafe(_ offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .top, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 上边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func top(by anchor: AppViewYaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .top, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 上边距，默认 10 】
    @discardableResult
    func top(by anchor: AppViewYaxisAnchor?, offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .top, from: anchor, extra: .equal(offset)) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 以传入视图的视图顶部为起始点设置当前对象的边距值 上边距】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func top(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .top, from: view.lyt.top, extra: offset) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 以传入视图的视图顶部为起始点设置当前对象的边距值 上边距，默认 0 】
    @discardableResult
    func top(by view: AppView, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .top, from: view.lyt.top, extra: .equal(offset)) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 上安全边距】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func topSafe(by anchor: AppViewYaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .top, from: anchor, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 上安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func topSafe(by anchor: AppViewYaxisAnchor?, offset: CGFloat = .offset) -> Self {
        guard let ret = verify(at: .top, from: anchor, extra: .equal(offset), inSafe: true) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 上安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func topSafe(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .top, from: view.lyt.topSafe, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 上安全边距，默认 0 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func topSafe(by view: AppView, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .top, from: view.lyt.topSafe, extra: .equal(offset), inSafe: true) else { return self }
        return offsetBy(ret.item, for: .top, extra: ret.extra)
    }
    
    /// 【SnapKit: 上中边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func topCenterX(_ top: AutoLayoutCompoundExtraYaxisValue,
                    _ centerX: AutoLayoutCompoundExtraXaxisValue? = nil) -> Self
    {
        guard let centerX = centerX else {
            return self.top(top)
                .centerX(by: top.raw.item?.view.lyt.centerX)
        }
        return self.top(top)
            .centerX(centerX)
    }
    
    /// 【SnapKit: 上中边距，默认 0 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func topCenterX(by top: AppView, offset: AutoLayoutExtraValue = .non) -> Self {
        return self.top(by: top, offset: offset)
            .centerX(by: top)
    }
}

#endif
