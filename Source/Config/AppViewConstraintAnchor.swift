//
//  AppViewConstraintAnchor.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/8/11.
//

#if canImport(SnapKit)
import SnapKit

public class AppViewConstraintAnchor {

    internal var origin: ConstraintItem
    internal var view: AppView
    
    internal required init(origin: ConstraintItem, view: AppView) {
        self.origin = origin
        self.view = view
    }
}

/// leading、trailing、centerX
public final class AppViewXaxisAnchor: AppViewConstraintAnchor {}

/// top、bottom、centerY
public final class AppViewYaxisAnchor: AppViewConstraintAnchor {}

/// width、height
public final class AppViewSizeAnchor: AppViewConstraintAnchor {}

#endif
