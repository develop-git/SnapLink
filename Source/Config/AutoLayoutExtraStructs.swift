//
//  AutoLayoutExtraStructs.swift
//  AutoLayout
//
//  Created by jian on 2023/9/19.
//

//import Foundation

public struct EdgeInsets {
    
    public var top: CGFloat
    public var left: CGFloat
    public var bottom: CGFloat
    public var right: CGFloat
    
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
    
    public init(_ edge: RectEdge, _ len: CGFloat) {
        self.top = edge.contains(.top) ? len : 0.0
        self.bottom = edge.contains(.bottom) ? len : 0.0
        self.left = edge.contains(.left) ? len : 0.0
        self.right = edge.contains(.right) ? len : 0.0
    }

    public static func insets(horz: CGFloat, vert: CGFloat) -> EdgeInsets {
        return .init(top: vert, left: horz, bottom: vert, right: horz)
    }
    
    public static func insets(_ len: CGFloat = 0.0) -> EdgeInsets {
        return .init(top: len, left: len, bottom: len, right: len)
    }

    public static func insets(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> EdgeInsets {
        return .init(top: top, left: left, bottom: bottom, right: right)
    }
    
    public static func insets(_ edge: RectEdge, _ len: CGFloat) -> EdgeInsets {
        return .init(edge, len)
    }
}

public struct RectEdge : OptionSet {
    public var rawValue: UInt

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    public static var top: RectEdge { RectEdge(rawValue: 1 << 0) }

    public static var left: RectEdge { RectEdge(rawValue: 1 << 1) }

    public static var bottom: RectEdge { RectEdge(rawValue: 1 << 2) }

    public static var right: RectEdge { RectEdge(rawValue: 1 << 3) }

    public static var all: RectEdge { RectEdge(rawValue: 15) }
}

public extension RectEdge {
    
    static var untop: RectEdge {
        get { [.left, .bottom, .right] }
    }
    
    static var unleft: RectEdge {
        get { [.top, .bottom, .right] }
    }
    
    static var unbottom: RectEdge {
        get { [.top, .left, .right] }
    }
    
    static var unright: RectEdge {
        get { [.top, .left, .bottom] }
    }
    
    static var horz: RectEdge {
        get { [.left, .right] }
    }
    
    static var vert: RectEdge {
        get { [.top, .bottom] }
    }
}

