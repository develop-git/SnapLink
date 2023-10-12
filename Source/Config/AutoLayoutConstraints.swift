//
//  AutoLayoutConstraints.swift
//  AutoLayout-SnapKit
//
//  Created by by 承轩 on 2023/4/28.
//

public enum AutoLayoutConstraints: Equatable {
    case comb(Maker, Relation)
    public enum Maker : Int {
        case make, update
    }

    public enum Relation : Int{
        case equal, min, max
        var constraints: AutoLayoutConstraints {
            return .comb(.make, self)
        }
    }

    public enum Attribute : Int {
        case leading, trailing, centerX
        case top, bottom, centerY
        case width, height
    }

    var raw: (maker: Maker, relation: Relation) {
        switch self {
        case .comb(let maker, let relation):
            return (maker, relation)
        }
    }

    public static func == (lhs: AutoLayoutConstraints, rhs: AutoLayoutConstraints) -> Bool {
        lhs.raw.maker == rhs.raw.maker && lhs.raw.relation == rhs.raw.relation
    }
}
