//
//  AutoLayoutConstraints.swift
//  AutoLayout
//
//  Created by by jian on 2023/4/28.
//

public enum AutoLayoutConstraints {
    case comb(Maker, Relation)
    
    public enum Maker: Int {
        case make
        case update
    }

    public enum Relation: Int {
        case equal
        case min
        case max
    }

    public enum Attribute: Int {
        /// x-axis
        case leading, trailing, centerX
        /// y-axis
        case top, bottom, centerY
        /// baseline
        case firstBaseline, lastBaseline
        /// size
        case width, height
    }
}

internal extension AutoLayoutConstraints {
    var raw: (maker: Maker, relation: Relation) {
        switch self {
        case .comb(let maker, let relation):
            return (maker, relation)
        }
    }
}

internal extension AutoLayoutConstraints.Relation {
    var constraints: AutoLayoutConstraints {
        return .comb(.make, self)
    }
}
