//
//  SnapLinkExtraEnums.swift
//  SnapLink
//
//  Created by jian on 2023/8/9.
//

// MARK: 网格布局类型
public enum GridItemLayout: Int {
    case equal, square, flex
}

// MARK: 网格布局间距
public enum GridItemsSpaces {
    
    case one    // spaces = 1.0
    case vals(_ value: ExtraValue) // spaces = value
    case row(_ value: ExtraValue)  // rowSpace = value, colSpace = 0.0
    case col(_ value: ExtraValue)  // rowSpace = 0.0, colSpace = value
    case diff(_ row: ExtraValue, _ col: ExtraValue) // rowSpace = row, colSpace = col
}

// MARK: offset\mult\width\height 扩展值
// 数值设置：eg: 1, 1.0, .one, .eq(1.0), .min(1.0), .max(1.0).....
public enum ExtraValue: ExpressibleByNilLiteral, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    
    public init(floatLiteral value: Float) {
        self = ExtraValue.eq(value)
    }
   
    public init(integerLiteral value: Int) {
        self = ExtraValue.eq(Float(value))
    }
    
    public init(nilLiteral: ()) {
        self = ExtraValue.eq(Float(0))
    }
    
    /// Equal
    case halfone   // = 0.5
    case one    // = 1.0
    case eq(_ value: Float) // = value
    
    case minzero    // >= 0.0
    case min(_ value: Float) // >= value
    
    case maxzero    // <= 0.0
    case max(_ value: Float) // <= value
    
    case comb(Constraints, Float)
}
    
// MARK: 布局偏移扩展值
public enum CompoundOffsetValue<T> {
    
    case bySuper        // offset = 0.0
    case offset(_ offset: ExtraValue)
    case by(_ item: T?, offset: ExtraValue = .eq(.offset))
}

public typealias XaxisOffset = CompoundOffsetValue<ViewXaxisAnchor>
public typealias YaxisOffset = CompoundOffsetValue<ViewYaxisAnchor>

// MARK: 布局尺寸扩展值
public enum SizeMultiplier {
    
    case fill        // multiplier = 1.0
    case wrap        // >= 0.0
    case byMult(_ mult: ExtraValue)
    case by(_ item: ViewSizeAnchor?, mult: ExtraValue = .one)
}

/// 压缩策略
public enum ViewCompressPriority {

    /// 压缩方向
    public enum CompressAxis : Int {
        case horz = 0, vert = 1
    }
    public enum Priority {
        case required, high, medium, low
    }
    /// 是否在水平/垂直方向上进行压缩
    case compress(_ compress: Bool, for: CompressAxis = .horz)
    
    /// 水平方向 显示策略（压缩/正常。。。）
    case horz(_ priority: Priority)
    
    /// 垂直方向 显示策略（压缩/正常。。。）
    case vert(_ priority: Priority)
}

// MARK: Internal extensions
internal extension GridItemsSpaces {
    
    var raw: (row: ExtraValue, col: ExtraValue) {
        switch self {
        case .diff(let row, let col):
            return (row, col)
        case .one:
            return (1, 1)
        case .vals(let val):
            return (val, val)
        case .row(let row):
            return (row, 0)
        case .col(let col):
            return (0, col)
        }
    }
}

internal extension ExtraValue {
    
    typealias Relation = Constraints.Relation
    
    var raw: (val: Float, restrict: Constraints) {
        switch self {
        case .halfone:
            return (0.5, Relation.equal.constraints)
        case .one:
            return (1, Relation.equal.constraints)
        case .eq(let val):
            return (val, Relation.equal.constraints)
            
        /// Min
        case .minzero:
            return (0, Relation.min.constraints)
        case .min(let val):
            return (val, Relation.min.constraints)
            
        /// Max
        case .maxzero:
            return (0, Relation.max.constraints)
        case .max(let val):
            return (val, Relation.max.constraints)
            
        case .comb(let restrict, let val):
            return (val, restrict)
        }
    }
    
    var invertVal: ExtraValue {
        return .comb(self.raw.restrict, -self.raw.val)
    }
}

internal extension CompoundOffsetValue {
    var raw: (item: T?, offset: ExtraValue) {
        switch self {
        case .by(let item, let offset):
            return (item, offset)
        case .offset(let offset):
            return (nil, offset)
        default:
            return (nil, nil)
        }
    }
}

internal extension SizeMultiplier {
    
    var raw: (item: ViewSizeAnchor?, mult: ExtraValue) {
        switch self {
        case .by(let item, let mult):
            return (item, mult)
        case .byMult(let mult):
            return (nil, mult)
        case .wrap:
            return (nil, .minzero)
        default:
            return (nil, .one)
        }
    }
}

internal extension ViewCompressPriority {
#if os(iOS) || os(tvOS)
    typealias Axis = NSLayoutConstraint.Axis
    typealias PriorityType = UILayoutPriority
#else
    typealias Axis = NSLayoutConstraint.Orientation
    typealias PriorityType = NSLayoutConstraint.Priority
#endif
    
    var raw: (axis: Axis, priority: PriorityType) {
        switch self {
        case .horz(let pr):
            return (Axis(rawValue: 0)!, pr.raw)
        case .vert(let pr):
            return (Axis(rawValue: 1)!, pr.raw)
        case .compress(let res, let ori):
            return (ori.raw, res ? .defaultLow : .defaultHigh)
        }
    }
}

internal extension ViewCompressPriority.CompressAxis {
    var raw: ViewCompressPriority.Axis {
        return ViewCompressPriority.Axis(rawValue: self.rawValue)!
    }
}

internal extension ViewCompressPriority.Priority {
    typealias PriorityType = ViewCompressPriority.PriorityType
    var raw: PriorityType {
        switch self {
        case .required:
            return PriorityType(rawValue: 1000.0)
        case .high:
            return PriorityType(rawValue: 750.0)
        case .medium:
        #if os(iOS) || os(tvOS)
            return PriorityType(rawValue: 500.0)
        #else // macOS
            return PriorityType(rawValue: 501.0)
        #endif
        case .low:
            return PriorityType(rawValue: 250.0)
        }
    }
}
