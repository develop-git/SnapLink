//
//  AutoLayoutExtraEnums.swift
//  AutoLayout
//
//  Created by jian on 2023/8/9.
//

public enum AutoLayoutGridExtraLayout: Int {
    case equal, square, flex
}

public enum AutoLayoutGridExtraValue {
    
    case one    // spaces = 1.0

    case vals(_ value: CGFloat) // spaces = value
    case row(_ value: CGFloat)  // rowSpace = value, colSpace = 0.0
    case col(_ value: CGFloat)  // rowSpace = 0.0, colSpace = value
    case diff(_ row: CGFloat, _ col: CGFloat) // rowSpace = row, colSpace = col
    
    var raw: (row: CGFloat, col: CGFloat) {
        let zero: CGFloat = 0.0, one: CGFloat = 1.0
        switch self {
        case .diff(let row, let col):
            return (row, col)
        case .one:
            return (one, one)
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
    case halfone   // = 0.5
    case one    // = 1.0
    
    case eq(_ value: CGFloat) // = value
    
    case minzero    // >= 0.0
    case min(_ value: CGFloat) // >= value
    
    case maxzero    // <= 0.0
    case max(_ value: CGFloat) // <= value
    
    case comb(AutoLayoutConstraints, CGFloat)
    
    typealias Relation = AutoLayoutConstraints.Relation
    var raw: (val: CGFloat, restrict: AutoLayoutConstraints) {
        let zero: CGFloat = 0.0, one: CGFloat = 1.0, halfone: CGFloat = 0.5
        switch self {
        case .halfone:
            return (halfone, Relation.equal.constraints)
        case .one:
            return (one, Relation.equal.constraints)
        case .eq(let val):
            return (val, Relation.equal.constraints)
            
        /// Min
        case .minzero:
            return (zero, Relation.min.constraints)
        case .min(let val):
            return (val, Relation.min.constraints)
            
        /// Max
        case .maxzero:
            return (zero, Relation.max.constraints)
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
    
    case offset(_ offset: AutoLayoutExtraValue)
    
    case by(_ item: T?, offset: AutoLayoutExtraValue = .eq(.offset))
    
    var raw: (item: T?, offset: AutoLayoutExtraValue) {
        switch self {
        case .by(let item, let offset):
            return (item, offset)
        case .offset(let offset):
            return (nil, offset)
        default:
            return (nil, .eq(.zero))
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
