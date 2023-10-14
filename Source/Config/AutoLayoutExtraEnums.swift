//
//  AutoLayoutExtraEnums.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/8/9.
//

public enum AutoLayoutGridExtraLayout: Int {
    case equal, square, flex
}

public enum AutoLayoutGridExtraValue {
    case non   // spaces = 0.0
    case one    // spaces = 1.0
    case global // spaces = 10.0
    case vals(_ value: CGFloat) // spaces = value
    case row(_ value: CGFloat)  // rowSpace = value, colSpace = 0.0
    case col(_ value: CGFloat)  // rowSpace = 0.0, colSpace = value
    case diff(_ row: CGFloat, _ col: CGFloat) // rowSpace = row, colSpace = col
    
    var raw: (row: CGFloat, col: CGFloat) {
        let global: CGFloat = 10.0, zero: CGFloat = 0.0, one: CGFloat = 1.0
        switch self {
        case .diff(let row, let col):
            return (row, col)
        case .non:
            return (zero, zero)
        case .one:
            return (one, one)
        case .global:
            return (global, global)
        case .vals(let val):
            return (val, val)
        case .row(let row):
            return (row, zero)
        case .col(let col):
            return (zero, col)
        }
    }
}

public enum AutoLayoutExtraValue {
    //(offset\mult\width\height)
    
    /// Equal
    case global // = 10.0
    case non    // = 0.0
    case halfone   // = 0.5
    case one    // = 1.0
    
    case equal(_ value: CGFloat) // = value
    
    case minGlobal  // >= 10.0
    case minHalfone    // >= 0.5
    case minZero    // >= 0.0
    case min(_ value: CGFloat) // >= value
    
    case maxGlobal  // <= 10.0
    case maxHalfone    // <= 0.5
    case maxZero    // <= 0.0
    case max(_ value: CGFloat) // <= value
    
    case comb(AutoLayoutConstraints, CGFloat)
    
    typealias Relation = AutoLayoutConstraints.Relation
    var raw: (val: CGFloat, restrict: AutoLayoutConstraints) {
        let global: CGFloat = 10.0, zero: CGFloat = 0.0, one: CGFloat = 1.0, halfone: CGFloat = 0.5
        switch self {
        /// Equal
        case .global:
            return (global, Relation.equal.constraints)
        case .non:
            return (zero, Relation.equal.constraints)
        case .halfone:
            return (halfone, Relation.equal.constraints)
        case .one:
            return (one, Relation.equal.constraints)
        case .equal(let val):
            return (val, Relation.equal.constraints)
            
        /// Min
        case .minGlobal:
            return (global, Relation.min.constraints)
        case .minZero:
            return (zero, Relation.min.constraints)
        case .minHalfone:
            return (halfone, Relation.min.constraints)
        case .min(let val):
            return (val, Relation.min.constraints)
            
        /// Max
        case .maxGlobal:
            return (global, Relation.max.constraints)
        case .maxZero:
            return (zero, Relation.max.constraints)
        case .maxHalfone:
            return (halfone, Relation.max.constraints)
        case .max(let val):
            return (val, Relation.max.constraints)
            
        case .comb(let restrict, let val):
            return (val, restrict)
        }
    }
    
    internal var invertVal: AutoLayoutExtraValue {
        return .comb(self.raw.restrict, -self.raw.val)
    }
}
            
public enum AutoLayoutCompoundOffsetValue<T> {
    
    case bySuper        // offset = 0.0
    
    case byOffset(_ offset: AutoLayoutExtraValue)
    
    case by(_ item: T?, offset: AutoLayoutExtraValue = .global)
    
    var raw: (item: T?, offset: AutoLayoutExtraValue) {
        switch self {
        case .by(let item, let offset):
            return (item, offset)
        case .byOffset(let offset):
            return (nil, offset)
        default:
            return (nil, .non)
        }
    }
}

public typealias AutoLayoutCompoundExtraXaxisValue = AutoLayoutCompoundOffsetValue<AppViewXaxisAnchor>
public typealias AutoLayoutCompoundExtraYaxisValue = AutoLayoutCompoundOffsetValue<AppViewYaxisAnchor>


public enum AutoLayoutCompoundMultiplierValue {
    
    case bySuper        // multiplier = 1.0
    
    case byMult(_ mult: AutoLayoutExtraValue)
    
    case by(_ item: AppViewSizeAnchor?, mult: AutoLayoutExtraValue = .one)
    
    var raw: (item: AppViewSizeAnchor?, mult: AutoLayoutExtraValue) {
        switch self {
        case .by(let item, let mult):
            return (item, mult)
        case .byMult(let mult):
            return (nil, mult)
        default:
            return (nil, .one)
        }
    }
}

/// 压缩策略
public enum AppViewCompressPriority {
#if os(iOS) || os(tvOS)
    internal typealias Axis = NSLayoutConstraint.Axis
    public typealias Priority = UILayoutPriority
#else
    internal typealias Axis = NSLayoutConstraint.Orientation
    public typealias Priority = NSLayoutConstraint.Priority
#endif
    /// 压缩方向
    public enum CompressAxis : Int {
        case horz = 0, vert = 1
    }
    /// 是否在水平/垂直方向上进行压缩
    case compress(_ compress: Bool, for: CompressAxis = .horz)
    
    /// 水平方向 显示策略（压缩/正常。。。）
    case horz(_ priority: Priority)
    
    /// 垂直方向 显示策略（压缩/正常。。。）
    case vert(_ priority: Priority)
    
    var raw: (axis: Axis, priority: Priority) {
        switch self {
        case .horz(let pr):
            return (Axis(rawValue: 0)!, pr)
        case .vert(let pr):
            return (Axis(rawValue: 1)!, pr)
        case .compress(let res, let ori):
            if res {
                return (Axis(rawValue: ori.rawValue)!, .defaultHigh)
            }
            return (Axis(rawValue: ori.rawValue)!, .defaultLow)
        }
    }
}
