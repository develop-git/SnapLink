//
//  DefaultValues.swift
//  AutoLayout
//
//  Created by jian on 2023/8/11.
//

public extension CGFloat {
    static var offset: CGFloat {
        return 10.0
    }
}


#if os(iOS) || os(tvOS)
internal typealias Controller = UIViewController
#else // macOS
internal typealias Controller = NSViewController
#endif

internal extension AppView {
#if os(iOS) || os(tvOS)
    var viewController: Controller? {
        var temp = self.next
        while temp != nil {
            if let vc = temp as? Controller {
                return vc
            }
            temp = temp?.next
        }
        return nil
    }
#else // macOS
    var viewController: Controller? {
        var temp = self.nextResponder
        while temp != nil {
            if let vc = temp as? Controller {
                return vc
            }
            temp = temp?.nextResponder
        }
        return nil
    }
#endif
}
