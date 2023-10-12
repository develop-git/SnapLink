//
//  AppView+Snapkit.swift
//  AutoLayout-SnapKit
//
//  Created by by 承轩 on 2023/4/13.
//

#if canImport(SnapKit)

#if os(iOS) || os(tvOS)
import UIKit
public typealias AppView = UIView
#else
import AppKit
public typealias AppView = NSView
#endif

public extension AppView {
    var lyt: AutoLayoutViewDSL {
        return AutoLayoutViewDSL(view: self)
    }
}

public extension Array where Element: AppView {
    var lyt: AppViewsArrayDSL {
        return AppViewsArrayDSL(array: self)
    }
}

public extension AppView {
    @discardableResult
    func layout(_ view: AppView) -> AutoLayoutViewDSL {
        self.addSubview(view)
        return view.lyt
    }
    
    @discardableResult
    func layout(_ views: Array<AppView>) -> AppViewsArrayDSL {
        views.forEach { [weak self] view in
            self?.addSubview(view)
        }
        return views.lyt
    }
}

public extension AutoLayoutViewDSL {
    
    /// 移除自动布局所有约束，先前设置的约束将不再生效
    @discardableResult
    func removeConstraints() -> Self {
        view.snp.removeConstraints()
        view.constraint?.remove()
        return self
    }

    /// 是否在对应方向上进行压缩
    @discardableResult
    func compress(_ compress: Bool, for axis: AppViewCompressPriority.Axis = .horizontal) -> Self {
        let priority: AppViewCompressPriority.Priority = compress ? .defaultLow : .defaultHigh
        view.setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
    
    /// 压缩策略，优先展示优先级高的视图
    @discardableResult
    func priority(_ priority: AppViewCompressPriority) -> Self {
        view.setContentCompressionResistancePriority(priority.raw.priority, for: priority.raw.axis)
        return self
    }
}

public extension AppViewsArrayDSL {
    /// 清除约束
    @discardableResult
    func removeConstraints() -> Self {
        array.forEach { $0.lyt.removeConstraints() }
        return self
    }
}

#endif
