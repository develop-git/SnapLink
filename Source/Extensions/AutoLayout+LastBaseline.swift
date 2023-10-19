//
//  AutoLayout+LastBaseline.swift
//  AutoLayout
//
//  Created by jian on 2023/10/19.
//

public extension AutoLayoutViewDSL {
  
    @discardableResult
    func lastBaseline(_ offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .lastBaseline, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func lastBaseline(_ offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .lastBaseline, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func lastBaseline(_ offset: AutoLayoutCompoundExtraYaxisValue) -> Self {
        guard let ret = verify(at: .lastBaseline, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func lastBaselineSafe(_ offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .lastBaseline, extra: .eq(offset), inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func lastBaselineSafe(_ offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .lastBaseline, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func lastBaseline(by anchor: AppViewYaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .lastBaseline, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    @discardableResult
    func lastBaseline(by anchor: AppViewYaxisAnchor?, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .lastBaseline, from: anchor, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func lastBaseline(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .lastBaseline, from: view.lyt.lastBaseline, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    @discardableResult
    func lastBaseline(by view: AppView, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .lastBaseline, from: view.lyt.lastBaseline, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func lastBaselineSafe(by anchor: AppViewYaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .lastBaseline, from: anchor, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    /// 【上安全边距，默认 10 】
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func lastBaselineSafe(by anchor: AppViewYaxisAnchor?, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .lastBaseline, from: anchor, extra: .eq(offset), inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func lastBaselineSafe(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .lastBaseline, from: view.lyt.lastBaselineSafe, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func lastBaselineSafe(by view: AppView, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .lastBaseline, from: view.lyt.lastBaselineSafe, extra: .eq(offset), inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
}
