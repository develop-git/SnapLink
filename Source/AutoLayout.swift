//
//  AppView+Snapkit.swift
//  AutoLayout
//
//  Created by by jian on 2023/4/13.
//

#if os(iOS) || os(tvOS)
import UIKit
public typealias AppView = UIView
#else
import AppKit
public typealias AppView = NSView
#endif

public extension AppView {
    var lyt: AutoLayoutViewDSL {
        return layoutDSL!
    }
}

public extension Array where Element: AppView {
    var lyt: AppViewsArrayDSL {
        return AppViewsArrayDSL(array: self)
    }
}

public extension AppView {
    /// 添加视图，并返回布局对象
    @discardableResult
    func layoutAv(_ view: AppView) -> AutoLayoutViewDSL {
        if self != view { // 避免 lab.addSubview(lab) 情形
            self.addSubview(view)
        }
        return view.lyt
    }

    /// 添加视图，并返回布局对象
    @discardableResult
    func layoutAv(_ views: [AppView]) -> AppViewsArrayDSL {
        views.forEach { [weak self] view in
            // 避免 lab.addSubview(lab) 情形
            guard let self = self, self != view else { return }
            self.addSubview(view)
        }
        return views.lyt
    }
    
    /// 移除自动布局所有约束，先前设置的约束将不再生效
    @discardableResult
    func removeConstraints() -> Self {
        #if canImport(SnapKit)
        self.snp.removeConstraints()
        #endif
        self.layoutDSL = nil
        return self
    }
}

public extension AutoLayoutViewDSL {
    
    /// 是否在对应方向上进行压缩
    @discardableResult
    func compress(_ compress: Bool, for axis: AppViewCompressPriority.CompressAxis = .horz) -> Self {
        let priority: AppViewCompressPriority.Priority = compress ? .defaultLow : .defaultHigh
        view.setContentCompressionResistancePriority(priority, for: AppViewCompressPriority.Axis(rawValue: axis.rawValue)!)
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
        array.forEach { $0.removeConstraints() }
        return self
    }
}
