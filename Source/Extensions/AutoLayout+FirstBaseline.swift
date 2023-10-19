//
//  AutoLayout+BaseLine.swift
//  AutoLayout
//
//  Created by jian on 2023/10/19.
//

public extension AutoLayoutViewDSL {
    
    @discardableResult
    func firstBaseline(_ offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .firstBaseline, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func firstBaseline(_ offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .firstBaseline, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func firstBaseline(_ offset: AutoLayoutCompoundExtraYaxisValue) -> Self {
        guard let ret = verify(at: .firstBaseline, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func firstBaselineSafe(_ offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .firstBaseline, extra: .eq(offset), inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func firstBaselineSafe(_ offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .firstBaseline, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func firstBaseline(by anchor: AppViewYaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .firstBaseline, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    @discardableResult
    func firstBaseline(by anchor: AppViewYaxisAnchor?, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .firstBaseline, from: anchor, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func firstBaseline(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .firstBaseline, from: view.lyt.firstBaseline, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    @discardableResult
    func firstBaseline(by view: AppView, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .firstBaseline, from: view.lyt.firstBaseline, extra: .eq(offset)) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func firstBaselineSafe(by anchor: AppViewYaxisAnchor?, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .firstBaseline, from: anchor, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func firstBaselineSafe(by anchor: AppViewYaxisAnchor?, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .firstBaseline, from: anchor, extra: .eq(offset), inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func firstBaselineSafe(by view: AppView, offset: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .firstBaseline, from: view.lyt.firstBaselineSafe, extra: offset, inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
    
    @discardableResult
    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    func firstBaselineSafe(by view: AppView, offset: CGFloat = .zero) -> Self {
        guard let ret = verify(at: .firstBaseline, from: view.lyt.firstBaselineSafe, extra: .eq(offset), inSafe: true) else { return self }
        return offsetBy(ret.anchor, for: .firstBaseline, extra: ret.extra)
    }
}
