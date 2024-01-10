//
//  SnapLink+LastBaseline.swift
//  SnapLink
//
//  Created by jian on 2023/10/19.
//

public extension SnapViewDSL {
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func lastBaseline(_ offset: ExtraValue = nil) -> Self {
        guard let ret = verify(at: .lastBaseline, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func lastBaseline(_ offset: YaxisOffset) -> Self {
        guard let ret = verify(at: .lastBaseline, from: offset.raw.item, extra: offset.raw.offset, inSafe: false) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func lastBaseline(by anchor: ViewYaxisAnchor?, offset: ExtraValue = nil) -> Self {
        guard let ret = verify(at: .lastBaseline, from: anchor, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
    
    /// 若需要动态修改，将 offset 值设置为 .max/.min
    @discardableResult
    func lastBaseline(by view: AppView, offset: ExtraValue = nil) -> Self {
        guard let ret = verify(at: .lastBaseline, from: view.lyt.lastBaseline, extra: offset) else { return self }
        return offsetBy(ret.anchor, for: .lastBaseline, extra: ret.extra)
    }
}
