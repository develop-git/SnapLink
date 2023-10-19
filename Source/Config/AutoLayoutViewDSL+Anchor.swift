//
//  AutoLayoutViewDSL+Anchor.swift
//  AutoLayout
//
//  Created by jian on 2023/10/18.
//

public extension AutoLayoutViewDSL {
    var width: AppViewSizeAnchor {
        #if canImport(SnapKit)
        return AppViewSizeAnchor(origin: view.snp.width, view: view)
        #else
        return AppViewSizeAnchor(origin: view.widthAnchor, view: view)
        #endif
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var widthSafe: AppViewSizeAnchor {
        #if canImport(SnapKit)
        return AppViewSizeAnchor(origin: view.safeAreaLayoutGuide.snp.width, view: view)
        #else
        return AppViewSizeAnchor(origin: view.safeAreaLayoutGuide.widthAnchor, view: view)
        #endif
    }

    var height: AppViewSizeAnchor {
        #if canImport(SnapKit)
        return AppViewSizeAnchor(origin: view.snp.height, view: view)
        #else
        return AppViewSizeAnchor(origin: view.heightAnchor, view: view)
        #endif
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var heightSafe: AppViewSizeAnchor {
        #if canImport(SnapKit)
        return AppViewSizeAnchor(origin: view.safeAreaLayoutGuide.snp.height, view: view)
        #else
        return AppViewSizeAnchor(origin: view.safeAreaLayoutGuide.heightAnchor, view: view)
        #endif
    }
}

// MARK: - y-axis (top bottom centerY)

public extension AutoLayoutViewDSL {

    var top: AppViewYaxisAnchor {
        #if canImport(SnapKit)
        return AppViewYaxisAnchor(origin: view.snp.top, view: view)
        #else
        return AppViewYaxisAnchor(origin: view.topAnchor, view: view)
        #endif
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var topSafe: AppViewYaxisAnchor {
        #if canImport(SnapKit)
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.top, view: view)
        #else
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.topAnchor, view: view)
        #endif
    }

    var bottom: AppViewYaxisAnchor {
        #if canImport(SnapKit)
        return AppViewYaxisAnchor(origin: view.snp.bottom, view: view)
        #else
        return AppViewYaxisAnchor(origin: view.bottomAnchor, view: view)
        #endif
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var bottomSafe: AppViewYaxisAnchor {
        #if canImport(SnapKit)
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.bottom, view: view)
        #else
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.bottomAnchor, view: view)
        #endif
    }

    var centerY: AppViewYaxisAnchor {
        #if canImport(SnapKit)
        return AppViewYaxisAnchor(origin: view.snp.centerY, view: view)
        #else
        return AppViewYaxisAnchor(origin: view.centerYAnchor, view: view)
        #endif
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var centerSafeY: AppViewYaxisAnchor {
        #if canImport(SnapKit)
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.centerY, view: view)
        #else
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.centerYAnchor, view: view)
        #endif
    }
    
    var firstBaseline: AppViewYaxisAnchor {
        #if canImport(SnapKit)
        return AppViewYaxisAnchor(origin: view.snp.firstBaseline, view: view)
        #else
        return AppViewYaxisAnchor(origin: view.firstBaselineAnchor, view: view)
        #endif
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var firstBaselineSafe: AppViewYaxisAnchor {
        #if canImport(SnapKit)
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.firstBaseline, view: view)
        #else
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.firstBaselineAnchor, view: view)
        #endif
    }
    
    var lastBaseline: AppViewYaxisAnchor {
        #if canImport(SnapKit)
        return AppViewYaxisAnchor(origin: view.snp.lastBaseline, view: view)
        #else
        return AppViewYaxisAnchor(origin: view.lastBaselineAnchor, view: view)
        #endif
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var lastBaselineSafe: AppViewYaxisAnchor {
        #if canImport(SnapKit)
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.lastBaseline, view: view)
        #else
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.owningView?.lastBaselineAnchor, view: view)
        #endif
    }
}

// MARK: - x-axis (leading trailing centerX)

public extension AutoLayoutViewDSL {

    var leading: AppViewXaxisAnchor {
        #if canImport(SnapKit)
        return AppViewXaxisAnchor(origin: view.snp.leading, view: view)
        #else
        return AppViewXaxisAnchor(origin: view.leadingAnchor, view: view)
        #endif
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var leadingSafe: AppViewXaxisAnchor {
        #if canImport(SnapKit)
        return AppViewXaxisAnchor(origin: view.safeAreaLayoutGuide.snp.leading, view: view)
        #else
        return AppViewXaxisAnchor(origin: view.safeAreaLayoutGuide.leadingAnchor, view: view)
        #endif
    }

    var trailing: AppViewXaxisAnchor {
        #if canImport(SnapKit)
        return AppViewXaxisAnchor(origin: view.snp.trailing, view: view)
        #else
        return AppViewXaxisAnchor(origin: view.trailingAnchor, view: view)
        #endif
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var trailingSafe: AppViewXaxisAnchor {
        #if canImport(SnapKit)
        return AppViewXaxisAnchor(origin: view.safeAreaLayoutGuide.snp.trailing, view: view)
        #else
        return AppViewXaxisAnchor(origin: view.safeAreaLayoutGuide.trailingAnchor, view: view)
        #endif
    }

    var centerX: AppViewXaxisAnchor {
        #if canImport(SnapKit)
        return AppViewXaxisAnchor(origin: view.snp.centerX, view: view)
        #else
        return AppViewXaxisAnchor(origin: view.centerXAnchor, view: view)
        #endif
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var centerSafeX: AppViewXaxisAnchor {
        #if canImport(SnapKit)
        return AppViewXaxisAnchor(origin: view.safeAreaLayoutGuide.snp.centerX, view: view)
        #else
        return AppViewXaxisAnchor(origin: view.safeAreaLayoutGuide.centerXAnchor, view: view)
        #endif
    }
}
