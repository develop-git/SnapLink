//
//  DefaultValues.swift
//  AutoLayout
//
//  Created by jian on 2023/8/11.
//

public extension Int {
    static var offset: Int {
        return 10
    }
}

public extension Float {
    static var offset: Float {
        return 10.0
    }
    
    internal var alv: AutoLayoutExtraValue {
        return AutoLayoutExtraValue(floatLiteral: self)
    }
}
