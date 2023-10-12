//
//  AppViewConstraintAnchor.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/8/11.
//

#if canImport(SnapKit)
import SnapKit

public class AppViewConstraintAnchor : Equatable {

    public var origin: ConstraintItem
    public var view: AppView
    internal var viewController: Controller?
    
    public required init(origin: ConstraintItem, view: AppView) {
        self.origin = origin
        self.view = view
        self.viewController = view.viewController
    }
    
    public static func == (lhs: AppViewConstraintAnchor, rhs: AppViewConstraintAnchor) -> Bool {
        lhs.origin == rhs.origin && lhs.view == rhs.view
    }
}

public final class AppViewXaxisAnchor: AppViewConstraintAnchor {}

public final class AppViewYaxisAnchor: AppViewConstraintAnchor {}

public final class AppViewSizeAnchor: AppViewConstraintAnchor {}

#endif
