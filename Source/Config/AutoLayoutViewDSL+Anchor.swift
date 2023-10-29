//
//  AutoLayoutViewDSL+Anchor.swift
//  AutoLayout
//
//  Created by jian on 2023/10/18.
//

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

// MARK: - y-axis (top bottom centerY)

public extension AutoLayoutViewDSL {

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
    
    var firstBaseline: AppViewYaxisAnchor {
        return AppViewYaxisAnchor(origin: view.snp.firstBaseline, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var firstBaselineSafe: AppViewYaxisAnchor {
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.firstBaseline, view: view)
    }
    
    var lastBaseline: AppViewYaxisAnchor {
        return AppViewYaxisAnchor(origin: view.snp.lastBaseline, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var lastBaselineSafe: AppViewYaxisAnchor {
        return AppViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.lastBaseline, view: view)
    }
}

// MARK: - x-axis (leading trailing centerX)

public extension AutoLayoutViewDSL {

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
