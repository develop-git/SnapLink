//
//  SnapViewDSL+Anchor.swift
//  SnapLink
//
//  Created by jian on 2023/10/18.
//

public extension SnapViewDSL {
    var width: ViewSizeAnchor {
        return ViewSizeAnchor(origin: view.snp.width, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var widthSafe: ViewSizeAnchor {
        return ViewSizeAnchor(origin: view.safeAreaLayoutGuide.snp.width, view: view)
    }

    var height: ViewSizeAnchor {
        return ViewSizeAnchor(origin: view.snp.height, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var heightSafe: ViewSizeAnchor {
        return ViewSizeAnchor(origin: view.safeAreaLayoutGuide.snp.height, view: view)
    }
}

// MARK: - y-axis (top bottom centerY)

public extension SnapViewDSL {

    var top: ViewYaxisAnchor {
        return ViewYaxisAnchor(origin: view.snp.top, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var safeTop: ViewYaxisAnchor {
        return ViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.top, view: view)
    }

    var bottom: ViewYaxisAnchor {
        return ViewYaxisAnchor(origin: view.snp.bottom, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var safeBottom: ViewYaxisAnchor {
        return ViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.bottom, view: view)
    }

    var centerY: ViewYaxisAnchor {
        return ViewYaxisAnchor(origin: view.snp.centerY, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var safeCenterY: ViewYaxisAnchor {
        return ViewYaxisAnchor(origin: view.safeAreaLayoutGuide.snp.centerY, view: view)
    }
    
    var firstBaseline: ViewYaxisAnchor {
        return ViewYaxisAnchor(origin: view.snp.firstBaseline, view: view)
    }
    
    var lastBaseline: ViewYaxisAnchor {
        return ViewYaxisAnchor(origin: view.snp.lastBaseline, view: view)
    }
}

// MARK: - x-axis (leading trailing centerX)

public extension SnapViewDSL {

    var leading: ViewXaxisAnchor {
        return ViewXaxisAnchor(origin: view.snp.leading, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var safeLeading: ViewXaxisAnchor {
        return ViewXaxisAnchor(origin: view.safeAreaLayoutGuide.snp.leading, view: view)
    }

    var trailing: ViewXaxisAnchor {
        return ViewXaxisAnchor(origin: view.snp.trailing, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var safeTrailing: ViewXaxisAnchor {
        return ViewXaxisAnchor(origin: view.safeAreaLayoutGuide.snp.trailing, view: view)
    }

    var centerX: ViewXaxisAnchor {
        return ViewXaxisAnchor(origin: view.snp.centerX, view: view)
    }

    @available(iOS 11.0, macOS 11.0, tvOS 11.0, *)
    var safeCenterX: ViewXaxisAnchor {
        return ViewXaxisAnchor(origin: view.safeAreaLayoutGuide.snp.centerX, view: view)
    }
}
