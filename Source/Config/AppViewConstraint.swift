//
//  AppViewConstraint.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/8/9.
//

#if canImport(SnapKit)
import SnapKit

internal final class AppViewConstraint {
    typealias Attribute = AutoLayoutConstraints.Attribute
    typealias Relation = AutoLayoutConstraints.Relation
    
    private var snps: [Attribute: LayoutItem] = [:]
    
    /// 更新本地存储约束信息
    /// - Parameters:
    ///   - index: 布局方向
    ///   - anchor: 布局目标
    ///   - extra: 额外布局参数
    ///   - isSuper: 是否相对视图父视进行布局
    /// - Returns: 更新布局信息
    func update(at index: Attribute, anchor: AppViewConstraintAnchor, extra: AutoLayoutExtraValue, isSuper: Bool) -> (restrict: AutoLayoutConstraints, item: ConstraintItem)? {
        
        // 未通过检测，约束冲突
        if !verify(at: index, isSuper: isSuper) {
            return nil
        }
        
        var relation = extra.raw.restrict.raw.relation
        // 约束信息不存在
        guard let snp = snps[index] else {
            // 存储约束信息
            snps[index] = LayoutItem(index: index, anchor: anchor, extra: extra)
            return (.comb(.make, relation), anchor.origin)
        }
        
        let value = extra.raw.val
        
        // 约束值未改变
        if snp.value == value {
            return nil
        }
        
        // 更新约束信息
        snp.value = value
        snps[index] = snp
        
        // 当约束关系改变时，需要沿用旧的约束关系
        if snp.relation != relation {
            relation = snp.relation
        }
        // 返回布局配置
        return (.comb(.update, relation), snp.item)
    }
    
    func remove() {
        snps.removeAll()
    }
}

private extension AppViewConstraint {
    
    /// 验证是否有约束冲突
    /// - Parameters:
    ///   - index: 布局约束位置
    ///   - isSuper: 是否相对父视图进行布局
    /// - Returns: 验证结果
    func verify(at index: AutoLayoutConstraints.Attribute, isSuper: Bool) -> Bool {
        // 宽度冲突
        if !horzVerify(at: index, isSuper: isSuper) { return false }
        // 高度冲突
        if !vertVerify(at: index, isSuper: isSuper) { return false }
        // 通过验证
        return true
    }
    
    /// 水平方向约束检验
    /// - Parameters:
    ///   - index: 布局约束位置
    ///   - isSuper: 是否相对父视图进行布局
    /// - Returns: 验证结果
    func horzVerify(at index: AutoLayoutConstraints.Attribute, isSuper: Bool) -> Bool {
        guard let width = snps[.width] else {
            return true
        }
        let hasLeading = snps.has(key: .leading)
        let hasTrailing = snps.has(key: .trailing)
        let hasCenterX = snps.has(key: .centerX)
        let isEqual = width.relation == .equal
        
        let horzWidth = isEqual && (hasLeading && index == .trailing || hasTrailing && index == .leading) && isSuper
        if horzWidth {
            #if DEBUG
            debugPrint("""
                 约束冲突：视图已经设置width，不能再同时设置leading和trailing。
                 解决方法列表:
                 1.使用.min()/.max()设置动态宽度;
                 2.移除.leading/.trailing其中之一。
                 """)
            #endif
            return false
        }
        
        let horzCenter1 = hasCenterX && (index == .leading || index == .trailing)
        let horzCenter2 = (hasLeading || hasTrailing) && (index == .centerX)

        if isEqual && (horzCenter1 || horzCenter2) {
            #if DEBUG
            debugPrint("""
                约束冲突：视图已经设置width与centerX, 不能再设置leading或trailing。
                解决方法列表:
                1.使用.min()/.max()设置动态宽度;
                2.移除.centerX或.leading/.trailing。
                """)
            #endif
            return false
        }
        return true
    }
    
    /// 垂直方向约束检验
    /// - Parameters:
    ///   - index: 布局约束位置
    ///   - isSuper: 是否相对父视图进行布局
    /// - Returns: 验证结果
    func vertVerify(at index: AutoLayoutConstraints.Attribute, isSuper: Bool) -> Bool {
        guard let height = snps[.height] else {
            return true
        }
        let hasTop = snps.has(key: .top)
        let hasBottom = snps.has(key: .bottom)
        let hasCenterY = snps.has(key: .centerY)
        let isEqual = height.relation == .equal
        
        let vertHeight = isEqual && (hasTop && index == .bottom || hasBottom && index == .top) && isSuper
        if vertHeight {
        #if DEBUG
            debugPrint("""
                约束冲突：视图已经设置height, 不能再同时设置top和bottom。
                解决方法列表:
                1.使用.min()/.max()设置动态高度;
                2.移除.top/.bottom其中之一。
                """)
            #endif
            return false
        }
        let vertCenter1 = hasCenterY && (index == .top || index == .bottom)
        let vertCenter2 = (hasTop || hasBottom) && (index == .centerY)

        if isEqual && (vertCenter1 || vertCenter2) {
            #if DEBUG
            debugPrint("""
                约束冲突：视图已经设置height与centerY, 不能再设置top或bottom。
                解决方法列表:
                1.使用.min()/.max()设置动态高度;
                2.移除.centerY或.top/.bottom。
                """)
            #endif
            return false
        }
        return true
    }
}

private final class LayoutItem: Equatable {
    var relation: AutoLayoutConstraints.Relation
    var index: AutoLayoutConstraints.Attribute
    var item: ConstraintItem
    var value: CGFloat
    
    init(index: AutoLayoutConstraints.Attribute, anchor: AppViewConstraintAnchor, extra: AutoLayoutExtraValue) {
        self.relation = extra.raw.restrict.raw.relation
        self.index = index
        self.item = anchor.origin
        self.value = extra.raw.val
    }
    
    static func == (lhs: LayoutItem, rhs: LayoutItem) -> Bool {
        lhs.relation == rhs.relation && lhs.index == rhs.index && lhs.item == rhs.item
    }
}

private extension Dictionary {
    
    func has(key: Key) -> Bool {
        return index(forKey: key) != nil
    }
}

#endif
