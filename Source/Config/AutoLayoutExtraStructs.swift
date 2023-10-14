//
//  AutoLayoutExtraStructs.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/9/19.
//

//import Foundation

public struct SnapEdgeInsets {
    
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
    
    public init(_ edge: SnapRectEdge, _ len: CGFloat) {
        self.top = edge.contains(.top) ? len : 0.0
        self.bottom = edge.contains(.bottom) ? len : 0.0
        self.left = edge.contains(.left) ? len : 0.0
        self.right = edge.contains(.right) ? len : 0.0
    }

    public static func insets(horz: CGFloat, vert: CGFloat) -> SnapEdgeInsets {
        return .init(top: vert, left: horz, bottom: vert, right: horz)
    }
    
    public static func insets(_ len: CGFloat = 0.0) -> SnapEdgeInsets {
        return .init(top: len, left: len, bottom: len, right: len)
    }

    public static func insets(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) -> SnapEdgeInsets {
        return .init(top: top, left: left, bottom: bottom, right: right)
    }
    
    public static func insets(_ edge: SnapRectEdge, _ len: CGFloat) -> SnapEdgeInsets {
        return .init(edge, len)
    }
}

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

