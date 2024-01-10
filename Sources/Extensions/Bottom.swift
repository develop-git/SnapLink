//
//  SnapKit+Bottom.swift
//  SnapLink
//
//  Created by jian on 2023/8/10.
//

// MARK: bottom
public extension SnapViewDSL {
    
    /// 【下边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func bottom(_ offset: ExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .bottom, extra: offset.invertVal) else { return self }
        return offsetBy(ret.anchor, for: .bottom, extra: ret.extra)
    }
    
    /// 【下边距 】
    @discardableResult
    func bottom(_ offset: YaxisOffset) -> Self {
        guard let ret = verify(at: .bottom, from: offset.raw.item, extra: offset.raw.offset.invertVal, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .bottom, extra: ret.extra)
    }
    
    /// 【下安全边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeBottom(_ offset: ExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .bottom, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .bottom, extra: ret.extra)
    }
    
    /// 【下边距 】
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func bottom(by anchor: ViewYaxisAnchor?, offset: ExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .bottom, from: anchor, extra: offset.invertVal) else { return self }
        return offsetBy(ret.anchor, for: .bottom, extra: ret.extra)
    }
    
    /// 【下边距 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    func bottom(by view: AppView, offset: ExtraValue = nil) -> Self {
        guard let ret = verify(at: .bottom, from: view.lyt.bottom, extra: offset.invertVal) else { return self }
        return offsetBy(ret.anchor, for: .bottom, extra: ret.extra)
    }
    
    /// 【下安全边距 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeBottom(by anchor: ViewYaxisAnchor?, offset: ExtraValue = .eq(.offset)) -> Self {
        guard let ret = verify(at: .bottom, from: anchor, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .bottom, extra: ret.extra)
    }
    
    /// 【下安全边距 】
    /// 若需要动态修改，将offset值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func safeBottom(by view: AppView, offset: ExtraValue = nil) -> Self {
        guard let ret = verify(at: .bottom, from: view.lyt.safeBottom, extra: offset.invertVal, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .bottom, extra: ret.extra)
    }
    
    /// 【下中边距】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func bottomCenterX(_ bottom: YaxisOffset,
                       _ centerX: XaxisOffset? = nil) -> Self
    {
        guard let centerX = centerX else {
            return self.bottom(bottom)
                .centerX(by: bottom.raw.item?.view.lyt.centerX)
        }
        return self.bottom(bottom)
            .centerX(centerX)
    }
    
    /// 【下中边距 】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func bottomCenterX(by bottom: AppView, offset: ExtraValue = nil) -> Self {
        return self.bottom(by: bottom, offset: offset).centerX(by: bottom)
    }
}
