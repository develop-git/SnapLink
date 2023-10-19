//
//  SnapKit+Center.swift
//  AutoLayout
//
//  Created by jian on 2023/8/10.
//

// MARK: - ------ Center  -------

public extension AutoLayoutViewDSL {
    /// 【以传入视图的中心点设置当前对象的中心点偏移】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func center(offsetX: AutoLayoutExtraValue = .eq(.zero),
                offsetY: AutoLayoutExtraValue = .eq(.zero)) -> Self
    {
        return self.centerX(offset: offsetX)
            .centerY(offset: offsetY)
    }
    
    /// 【以传入的数值设置当前对象的中心点x偏移】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerX(offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .centerX, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerX, extra: ret.extra)
    }
    
    @discardableResult
    func centerX(offset: CGFloat = 0.0) -> Self {
        guard let ret = verify(at: .centerX, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .centerX, extra: ret.extra)
    }
    
    @discardableResult
    func centerX(_ offset: AutoLayoutCompoundExtraXaxisValue) -> Self {
        guard let ret = verify(at: .centerX, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .centerX, extra: ret.extra)
    }
    
    /// 【以传入的数值设置当前对象的中心点y偏移】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerY(offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .centerY, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerY, extra: ret.extra)
    }
    
    @discardableResult
    func centerY(offset: CGFloat = 0.0) -> Self {
        guard let ret = verify(at: .centerY, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .centerY, extra: ret.extra)
    }
    
    @discardableResult
    func centerY(_ offset: AutoLayoutCompoundExtraYaxisValue) -> Self {
        guard let ret = verify(at: .centerY, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .centerY, extra: ret.extra)
    }
    
    /// 【以传入视图的中心点设置当前对象的中心点】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func center(by view: AppView,
                offsetX: AutoLayoutExtraValue = .eq(.zero),
                offsetY: AutoLayoutExtraValue = .eq(.zero)) -> Self
    {
        return self.centerX(by: view.lyt.centerX, offset: offsetX)
            .centerY(by: view.lyt.centerY, offset: offsetY)
    }
    
    /// 【以传入视图的水平边界设置当前对象的中心点x】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerX(by anchor: AppViewXaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .centerX, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerX, extra: ret.extra)
    }
    
    @discardableResult
    func centerX(by anchor: AppViewXaxisAnchor?, offset: CGFloat = 0.0) -> Self {
        guard let ret = verify(at: .centerX, from: anchor, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .centerX, extra: ret.extra)
    }
    
    /// 【以传入视图的水平边界设置当前对象的中心点x】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerX(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .centerX, from: view.lyt.centerX, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerX, extra: ret.extra)
    }
    
    @discardableResult
    func centerX(by view: AppView, offset: CGFloat = 0.0) -> Self {
        guard let ret = verify(at: .centerX, from: view.lyt.centerX, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .centerX, extra: ret.extra)
    }
    
    /// 【以传入视图的垂直边界设置当前对象的中心点y】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerY(by anchor: AppViewYaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .centerY, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerY, extra: ret.extra)
    }
    
    @discardableResult
    func centerY(by anchor: AppViewYaxisAnchor?, offset: CGFloat = 0.0) -> Self {
        guard let ret = verify(at: .centerY, from: anchor, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .centerY, extra: ret.extra)
    }
    
    /// 【以传入视图的垂直边界设置当前对象的中心点y】
    /// 若需要 offset 动态变化，将 offset 值设置为 .max/.min
    @discardableResult
    func centerY(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .centerY, from: view.lyt.centerY, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .centerY, extra: ret.extra)
    }
    
    @discardableResult
    func centerY(by view: AppView, offset: CGFloat = 0.0) -> Self {
        guard let ret = verify(at: .centerY, from: view.lyt.centerY, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .centerY, extra: ret.extra)
    }
}
