//
//  AutoLayoutViewDSL.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/8/10.
//

#if canImport(SnapKit)
import SnapKit

public struct AutoLayoutViewDSL {
    internal let view: AppView
    internal let responder: Controller?
    internal init(view: AppView) {
        self.view = view
        self.responder = view.viewController
    }
}

public struct AppViewsArrayDSL {
    internal let array: [AppView]
    internal init(array: [AppView]) {
        self.array = array
    }
}

public extension AutoLayoutViewDSL {
    var width: AppViewSizeAnchor {
        return AppViewSizeAnchor(origin: view.snp.width, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var widthSafe: AppViewSizeAnchor {
        return AppViewSizeAnchor(origin: view.safeAreaLayoutGuide.snp.width, view: view)
    }

    var height: AppViewSizeAnchor {
        return AppViewSizeAnchor(origin: view.snp.height, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var heightSafe: AppViewSizeAnchor {
        return AppViewSizeAnchor(origin: view.safeAreaLayoutGuide.snp.height, view: view)
    }
}

public extension AutoLayoutViewDSL {
    // MARK: - y-axis (top bottom centerY)

    var top: AppViewYaxisAnchor {
        return AppViewYaxisAnchor(origin: view.snp.top, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var topSafe: AppViewYaxisAnchor {
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.top, view: view)
    }

    var bottom: AppViewYaxisAnchor {
        return AppViewYaxisAnchor(origin: view.snp.bottom, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var bottomSafe: AppViewYaxisAnchor {
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.bottom, view: view)
    }

    var centerY: AppViewYaxisAnchor {
        return AppViewYaxisAnchor(origin: view.snp.centerY, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var centerSafeY: AppViewYaxisAnchor {
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.centerY, view: view)
    }

    // MARK: - x-axis (leading trailing centerX)

    var leading: AppViewXaxisAnchor {
        return AppViewXaxisAnchor(origin: view.snp.leading, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var leadingSafe: AppViewXaxisAnchor {
        return AppViewXaxisAnchor(origin: view.safeAreaLayoutGuide.snp.leading, view: view)
    }

    var trailing: AppViewXaxisAnchor {
        return AppViewXaxisAnchor(origin: view.snp.trailing, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var trailingSafe: AppViewXaxisAnchor {
        return AppViewXaxisAnchor(origin: view.safeAreaLayoutGuide.snp.trailing, view: view)
    }

    var centerX: AppViewXaxisAnchor {
        return AppViewXaxisAnchor(origin: view.snp.centerX, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var centerSafeX: AppViewXaxisAnchor {
        return AppViewXaxisAnchor(origin: view.safeAreaLayoutGuide.snp.centerX, view: view)
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
                inSafe: Bool = false) -> (item: ConstraintItem, extra: AutoLayoutExtraValue)?
    {
        
        guard let anchor = anchor ?? superAnchor(at: index, inSafe: inSafe) else { return nil }
        
        // 布局视图未添加到父视图，不进行布局
        // 目标视图未添加到父视图，或目标视图非布局视图的父视图，不进行布局
        // 布局视图和目标视图不在同一控制器上
        if self.responder == nil || anchor.view.lyt.responder == nil || self.responder != anchor.view.lyt.responder {
            return nil
        }
        
        // 视图未添加任何约束
        if view.constraint == nil {
            view.constraint = AppViewConstraint()
        }
        
        // 更新视图储存的约束值
        guard let res = view.constraint!.update(at: index, anchor: anchor, extra: extra, isSuper: view.superview == anchor.view) else {
            // 无需进行布局
            return nil
        }
        
        // 返回布局信息
        return (res.item, .comb(res.restrict, extra.raw.val))
    }

    @discardableResult
    func multipliedBy(_ target: ConstraintRelatableTarget,
                      for index: AutoLayoutConstraints.Attribute,
                      extra: AutoLayoutExtraValue) -> Self
    {
        return constraintsMaker(target: target, extra.raw.restrict, for: index) { last in
            last.multipliedBy(extra.raw.val)
        }
    }

    @discardableResult
    func offsetBy(_ target: ConstraintRelatableTarget,
                  for index: AutoLayoutConstraints.Attribute,
                  extra: AutoLayoutExtraValue) -> Self
    {
        return constraintsMaker(target: target, extra.raw.restrict, for: index) { last in
            last.offset(extra.raw.val)
        }
    }
}



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
                last(contraintsRelation(target, constraint, maker: layoutAnchor(at: index, maker: $0)))
            }
        case .update:
            view.snp.updateConstraints {
                last(contraintsRelation(target, constraint, maker: layoutAnchor(at: index, maker: $0)))
            }
        }
        return self
    }

    @discardableResult
    func contraintsRelation(_ target: ConstraintRelatableTarget,
                            _ constraint: AutoLayoutConstraints,
                            maker: ConstraintMakerExtendable) -> ConstraintMakerEditable
    {
        switch constraint.raw.relation {
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
        }
    }
    
    func superAnchor(at index: Attribute, inSafe: Bool) -> AppViewConstraintAnchor? {
        switch index {
        case .leading:
            if #available(iOS 11.0, macOS 11.0, tvOS 11.0, *), inSafe {
                return view.superview?.lyt.leadingSafe
            } else {
                return view.superview?.lyt.leading
            }
        case .trailing:
            if #available(iOS 11.0, macOS 11.0, tvOS 11.0, *), inSafe {
                return view.superview?.lyt.trailingSafe
            } else {
                return view.superview?.lyt.trailing
            }
        case .centerX:
            if #available(iOS 11.0, macOS 11.0, tvOS 11.0, *), inSafe {
                return view.superview?.lyt.centerSafeX
            } else {
                return view.superview?.lyt.centerX
            }
        case .top:
            if #available(iOS 11.0, macOS 11.0, tvOS 11.0, *), inSafe {
                return view.superview?.lyt.topSafe
            } else {
                return view.superview?.lyt.top
            }
        case .bottom:
            if #available(iOS 11.0, macOS 11.0, tvOS 11.0, *), inSafe {
                return view.superview?.lyt.bottomSafe
            } else {
                return view.superview?.lyt.bottom
            }
        case .centerY:
            if #available(iOS 11.0, macOS 11.0, tvOS 11.0, *), inSafe {
                return view.superview?.lyt.centerSafeY
            } else {
                return view.superview?.lyt.centerY
            }
        case .width:
            if #available(iOS 11.0, macOS 11.0, tvOS 11.0, *), inSafe {
                return view.superview?.lyt.widthSafe
            } else {
                return view.superview?.lyt.width
            }
        case .height:
            if #available(iOS 11.0, macOS 11.0, tvOS 11.0, *), inSafe {
                return view.superview?.lyt.heightSafe
            } else {
                return view.superview?.lyt.height
            }
        }
    }
}

// MARK: Associated
internal extension AppView {
    private struct OBJCKEY {
        static var CONSTRAINT: Void?
        static var DSL: Void?
    }
    var constraint: AppViewConstraint? {
        get {
            objc_getAssociatedObject(self, &OBJCKEY.CONSTRAINT) as? AppViewConstraint
        }
        set {
            objc_setAssociatedObject(self, &OBJCKEY.CONSTRAINT, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var layoutDSL: AutoLayoutViewDSL {
        guard let dsl = objc_getAssociatedObject(self, &OBJCKEY.DSL) as? AutoLayoutViewDSL else {
            let res = AutoLayoutViewDSL(view: self)
            objc_setAssociatedObject(self, &OBJCKEY.DSL, res, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return res
        }
        return dsl
    }
}

#endif
