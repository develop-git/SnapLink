//
//  AutoLayoutViewDSL.swift
//  AutoLayout
//
//  Created by jian on 2023/8/10.
//

public struct AutoLayoutViewDSL {
    internal let view: AppView
    internal let constraint: AppViewConstraint
    internal init(view: AppView) {
        self.view = view
        self.constraint = AppViewConstraint()
    }
}

public struct AppViewsArrayDSL {
    internal let array: [AppView]
    internal init(array: [AppView]) {
        self.array = array
    }
}


internal extension AutoLayoutViewDSL {
    
    /// 检验布局是否通过
    /// - Parameters:
    ///   - index: 布局方向
    ///   - item: 布局目标
    ///   - extra: 额外参数（偏移offset，倍数mult）
    ///   - inSafe: 是否叠加安全区域
    /// - Returns: 返回布局目标及额外参数
    func verify(at index: AutoLayoutConstraints.Attribute,
                from anchor: AppViewConstraintAnchor? = nil,
                extra: AutoLayoutExtraValue,
                inSafe: Bool = false) -> (anchor: AppViewConstraintAnchor, extra: AutoLayoutExtraValue)?
    {
        
        guard let anchor = anchor ?? superAnchor(at: index, inSafe: inSafe) else { return nil }
        
        // 未添加到父视图
        guard let superView = view.superview else { return nil }
        
        let isSuper = superView == anchor.view
        
        // 非同级视图
        if !isSuper, anchor.view.superview == nil {
            return nil
        }
        
        // 更新视图储存的约束值
        guard let res = constraint.update(at: index, anchor: anchor, extra: extra, isSuper: isSuper) else {
            return nil
        }
        // 返回布局信息
        return (res.anchor, .comb(res.restrict, extra.raw.val))
    }

    @discardableResult
    func multipliedBy<T>(_ target: T,
                      for index: AutoLayoutConstraints.Attribute,
                      extra: AutoLayoutExtraValue) -> Self
    {
        if let anchor = target as? AppViewConstraintAnchor {
            return constraintsMaker(target: anchor.origin, extra.raw.restrict, for: index) { last in
                last.multipliedBy(extra.raw.val)
            }
        }
        
        if let val = target as? ConstraintRelatableTarget {
            return constraintsMaker(target: val, extra.raw.restrict, for: index) { last in
                last.multipliedBy(extra.raw.val)
            }
        }
        return self
    }

    @discardableResult
    func offsetBy<T>(_ target: T,
                  for index: AutoLayoutConstraints.Attribute,
                  extra: AutoLayoutExtraValue) -> Self
    {
        if let anchor = target as? AppViewConstraintAnchor {
            return constraintsMaker(target: anchor.origin, extra.raw.restrict, for: index) { last in
                last.offset(extra.raw.val)
            }
        }
        if let val = target as? ConstraintRelatableTarget {
            return constraintsMaker(target: val, extra.raw.restrict, for: index) { last in
                last.offset(extra.raw.val)
            }
        }
        return self
    }
}


import SnapKit

private extension AutoLayoutViewDSL {
    
    typealias Attribute = AutoLayoutConstraints.Attribute
    
    func constraintsMaker(target: ConstraintRelatableTarget,
                          _ constraint: AutoLayoutConstraints,
                          for index: Attribute,
                          last: (ConstraintMakerEditable) -> Void) -> Self
    {
        switch constraint.raw.maker {
        case .make:
            view.snp.makeConstraints {
                last(contraintsRelation(target, constraint.raw.relation, maker: layoutAnchor(at: index, maker: $0)))
            }
        case .update:
            view.snp.updateConstraints {
                last(contraintsRelation(target, constraint.raw.relation, maker: layoutAnchor(at: index, maker: $0)))
            }
        }
        return self
    }

    @discardableResult
    func contraintsRelation(_ target: ConstraintRelatableTarget,
                            _ relation: AutoLayoutConstraints.Relation,
                            maker: ConstraintMakerExtendable) -> ConstraintMakerEditable
    {
        switch relation {
        case .equal:
            return maker.equalTo(target)
        case .min:
            return maker.greaterThanOrEqualTo(target)
        case .max:
            return maker.lessThanOrEqualTo(target)
        }
    }

    func layoutAnchor(at index: Attribute, maker: ConstraintMaker) -> ConstraintMakerExtendable {
        switch index {
        case .leading:
            return maker.leading
        case .trailing:
            return maker.trailing
        case .centerX:
            return maker.centerX
        case .top:
            return maker.top
        case .bottom:
            return maker.bottom
        case .centerY:
            return maker.centerY
        case .width:
            return maker.width
        case .height:
            return maker.height
        case .firstBaseline:
            return maker.firstBaseline
        case .lastBaseline:
            return maker.lastBaseline
        }
    }
    
    func superAnchor(at index: Attribute, inSafe: Bool) -> AppViewConstraintAnchor? {
        switch index {
        case .leading:
            if inSafe, #available(iOS 11.0, macOS 11.0, tvOS 11.0, *) {
                return view.superview?.lyt.leadingSafe
            } else {
                return view.superview?.lyt.leading
            }
        case .trailing:
            if inSafe, #available(iOS 11.0, macOS 11.0, tvOS 11.0, *) {
                return view.superview?.lyt.trailingSafe
            } else {
                return view.superview?.lyt.trailing
            }
        case .centerX:
            if inSafe, #available(iOS 11.0, macOS 11.0, tvOS 11.0, *) {
                return view.superview?.lyt.centerSafeX
            } else {
                return view.superview?.lyt.centerX
            }
        case .top:
            if inSafe, #available(iOS 11.0, macOS 11.0, tvOS 11.0, *) {
                return view.superview?.lyt.topSafe
            } else {
                return view.superview?.lyt.top
            }
        case .bottom:
            if inSafe, #available(iOS 11.0, macOS 11.0, tvOS 11.0, *) {
                return view.superview?.lyt.bottomSafe
            } else {
                return view.superview?.lyt.bottom
            }
        case .centerY:
            if inSafe, #available(iOS 11.0, macOS 11.0, tvOS 11.0, *) {
                return view.superview?.lyt.centerSafeY
            } else {
                return view.superview?.lyt.centerY
            }
        case .width:
            if inSafe, #available(iOS 11.0, macOS 11.0, tvOS 11.0, *) {
                return view.superview?.lyt.widthSafe
            } else {
                return view.superview?.lyt.width
            }
        case .height:
            if inSafe, #available(iOS 11.0, macOS 11.0, tvOS 11.0, *) {
                return view.superview?.lyt.heightSafe
            } else {
                return view.superview?.lyt.height
            }
        case .firstBaseline:
            if inSafe, #available(iOS 11.0, macOS 11.0, tvOS 11.0, *) {
                return view.superview?.lyt.firstBaseline
            } else {
                return view.superview?.lyt.firstBaseline
            }
        case .lastBaseline:
            if inSafe, #available(iOS 11.0, macOS 11.0, tvOS 11.0, *) {
                return view.superview?.lyt.lastBaseline
            } else {
                return view.superview?.lyt.lastBaseline
            }
        }
    }
}

// MARK: Associated
internal extension AppView {
    private struct OBJCKEY {
        static var DSL: Void?
    }
    var layoutDSL: AutoLayoutViewDSL? {
        get {
            guard let dsl = objc_getAssociatedObject(self, &OBJCKEY.DSL) as? AutoLayoutViewDSL else {
                let res = AutoLayoutViewDSL(view: self)
                objc_setAssociatedObject(self, &OBJCKEY.DSL, res, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return res
            }
            return dsl
        }
        set {
            objc_setAssociatedObject(self, &OBJCKEY.DSL, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
