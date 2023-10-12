//
//  AutoLayoutExtraStructs.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/9/19.
//

//import Foundation

public struct SnapEdgeInsets {
    
    public init(horz: CGFloat, vert: CGFloat) {
        self.init(top: vert, left: horz, bottom: vert, right: horz)
    }
    
    public init(_ len: CGFloat = 0.0) {
        self.init(top: len, left: len, bottom: len, right: len)
    }

    public init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.top = top
        self.bottom = bottom
        self.left = left
        self.right = right
    }

    public var top: CGFloat

    public var left: CGFloat

    public var bottom: CGFloat

    public var right: CGFloat
}

#if os(iOS) || os(tvOS)
public extension UIEdgeInsets {
    var ui: SnapEdgeInsets {
        return SnapEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}
#endif

public struct SnapRectEdge : OptionSet {
    public var rawValue: UInt

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    public static var top: SnapRectEdge { SnapRectEdge(rawValue: 1 << 0) }

    public static var left: SnapRectEdge { SnapRectEdge(rawValue: 1 << 1) }

    public static var bottom: SnapRectEdge { SnapRectEdge(rawValue: 1 << 2) }

    public static var right: SnapRectEdge { SnapRectEdge(rawValue: 1 << 3) }

    public static var all: SnapRectEdge { SnapRectEdge(rawValue: 15) }
}

public extension SnapRectEdge {
    
    static var untop: SnapRectEdge {
        get { [.left, .bottom, .right] }
    }
    
    static var unleft: SnapRectEdge {
        get { [.top, .bottom, .right] }
    }
    
    static var unbottom: SnapRectEdge {
        get { [.top, .left, .right] }
    }
    
    static var unright: SnapRectEdge {
        get { [.top, .left, .bottom] }
    }
    
    static var horz: SnapRectEdge {
        get { [.left, .right] }
    }
    
    static var vert: SnapRectEdge {
        get { [.top, .bottom] }
    }
}

