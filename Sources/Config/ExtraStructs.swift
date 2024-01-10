//
//  SnapLinkExtraStructs.swift
//  SnapLink
//
//  Created by jian on 2023/9/19.
//

//import Foundation

public extension SnapViewDSL {
    
    struct EdgeInsets {
        
        public var top: Float
        public var left: Float
        public var bottom: Float
        public var right: Float
        
        public init(horz: Float, vert: Float) {
            self.init(top: vert, left: horz, bottom: vert, right: horz)
        }
        
        public init(len: Float = 0.0) {
            self.init(top: len, left: len, bottom: len, right: len)
        }

        public init(top: Float, left: Float, bottom: Float, right: Float) {
            self.top = top
            self.bottom = bottom
            self.left = left
            self.right = right
        }
        
        public init(_ edge: RectEdge, _ len: Float) {
            self.top = edge.contains(.top) ? len : 0.0
            self.bottom = edge.contains(.bottom) ? len : 0.0
            self.left = edge.contains(.left) ? len : 0.0
            self.right = edge.contains(.right) ? len : 0.0
        }
    }

    struct RectEdge : OptionSet {
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
}

public extension SnapViewDSL.RectEdge {
    
    static var untop: SnapViewDSL.RectEdge {
        get { [.left, .bottom, .right] }
    }
    
    static var unleft: SnapViewDSL.RectEdge {
        get { [.top, .bottom, .right] }
    }
    
    static var unbottom: SnapViewDSL.RectEdge {
        get { [.top, .left, .right] }
    }
    
    static var unright: SnapViewDSL.RectEdge {
        get { [.top, .left, .bottom] }
    }
    
    static var horz: SnapViewDSL.RectEdge {
        get { [.left, .right] }
    }
    
    static var vert: SnapViewDSL.RectEdge {
        get { [.top, .bottom] }
    }
}

