//
//  SnapKit+Size.swift
//  AutoLayout-SnapKit
//
//  Created by 承轩 on 2023/8/10.
//

#if canImport(SnapKit)

// MARK: - ------ size -------

public extension AutoLayoutViewDSL {
    /// 【SnapKit：将传入的数值赋值给当前对象的 width & height】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func size(_ value: CGFloat) -> Self {
        return self.width(value)
            .height(value)
    }
    
    @discardableResult
    func size(by anchor: AppViewSizeAnchor) -> Self {
        return self.width(by: anchor)
            .height(by: anchor)
    }
    
    /// 【SnapKit: 将传入的width & height 数值赋值给当前对象的 width & height】
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func size(width: CGFloat, height: CGFloat) -> Self {
        return self.width(width)
            .height(height)
    }
    
    /// 【SnapKit: 将传入的width & height 数值赋值给当前对象的 width & height】
    /// 若需要 width\ height 动态变化，可设置为 .max\.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func size(width: AutoLayoutExtraValue,
              height: AutoLayoutExtraValue) -> Self
    {
        return self.width(width)
            .height(height)
    }
    
    /// 【SnapKit: 将传入的width & height 数值赋值给当前对象的 width & height】
    /// 若需要 width\ height 动态变化，可设置为 .max\.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func size(width: AutoLayoutCompoundMultiplierValue,
              height: AutoLayoutCompoundMultiplierValue) -> Self
    {
        return self.width(width)
            .height(height)
    }
    
    @discardableResult
    func size(_ size: AutoLayoutCompoundMultiplierValue = .bySuper) -> Self
    {
        return self.width(size)
            .height(size)
    }
    
    /// 【SnapKit: 将传入视图的size赋值给当前对象的size】
    /// 若需要 width\ height 动态变化，可设置为 .max\.min
    /// 若需要设置视图是否可以压缩显示，可以调用 priority() / compress()方法进行设置
    @discardableResult
    func size(by view: AppView,
              width widthMult: AutoLayoutExtraValue = .one,
              height heightMult: AutoLayoutExtraValue = .one) -> Self
    {
        return self.width(by: view, mult: widthMult)
            .height(by: view, mult: heightMult)
    }
}

// MARK: - ------ width,height -------

// MARK: width

public extension AutoLayoutViewDSL {
    /// 【SnapKit:  width】
    @discardableResult
    func width(_ width: CGFloat) -> Self {
        guard let ret = verify(at: .width, extra: .one) else { return self }
        return multipliedBy(width, for: .width, extra: ret.extra)
    }
    
    /// 【SnapKit:  width】
    /// 若需要 width 动态变化，可设置为 .max\.min
    @discardableResult
    func width(_ width: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .width, extra: .comb(width.raw.restrict, 1.0)) else { return self }
        return multipliedBy(width.raw.val, for: .width, extra: ret.extra)
    }
    
    /// 【SnapKit:  width】
    /// 若需要 width 动态变化，可设置为 .max\.min
    @discardableResult
    func width(_ width: AutoLayoutCompoundMultiplierValue = .bySuper) -> Self {
        guard let ret = verify(at: .width, from: width.raw.item, extra: width.raw.mult, inSafe: false) else { return self }
        return multipliedBy(ret.item, for: .width, extra: ret.extra)
    }
    
    /// 【SnapKit: 将传入视图的width/height赋值给当前对象的 width】
    /// 若需要 width动态变化，可设置 mult (multiplier)为 .max\.min
    @discardableResult
    func width(by anchor: AppViewSizeAnchor?, mult: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .width, from: anchor, extra: mult) else { return self }
        return multipliedBy(ret.item, for: .width, extra: ret.extra)
    }
    
    @discardableResult
    func width(by anchor: AppViewSizeAnchor?, mult: CGFloat = 1.0) -> Self {
        guard let ret = verify(at: .width, from: anchor, extra: .equal(mult)) else { return self }
        return multipliedBy(ret.item, for: .width, extra: ret.extra)
    }
    
    /// 【SnapKit: 将传入视图的width赋值给当前对象的 width】
    /// 若需要 width 动态变化，可设置 mult (multiplier)为 .max\.min
    @discardableResult
    func width(by view: AppView, mult: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .width, from: view.lyt.width, extra: mult) else { return self }
        return multipliedBy(ret.item, for: .width, extra: ret.extra)
    }
    
    @discardableResult
    func width(by view: AppView, mult: CGFloat = 1.0) -> Self {
        guard let ret = verify(at: .width, from: view.lyt.width, extra: .equal(mult)) else { return self }
        return multipliedBy(ret.item, for: .width, extra: ret.extra)
    }
}

// MARK: height

public extension AutoLayoutViewDSL {
    /// 【SnapKit: height】
    @discardableResult
    func height(_ height: CGFloat) -> Self {
        guard let ret = verify(at: .height, extra: .one) else { return self }
        return multipliedBy(height, for: .height, extra: ret.extra)
    }
    
    /// 【SnapKit: height】
    /// 若需要 height 动态变化，可设置为 .max\.min
    @discardableResult
    func height(_ height: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .height, extra: .comb(height.raw.restrict, 1.0)) else { return self }
        return multipliedBy(height.raw.val, for: .height, extra: ret.extra)
    }
    
    /// 【SnapKit: height】
    /// 若需要 height 动态变化，可设置为 .max\.min
    @discardableResult
    func height(_ height: AutoLayoutCompoundMultiplierValue = .bySuper) -> Self {
        guard let ret = verify(at: .height, from: height.raw.item, extra: height.raw.mult, inSafe: false) else { return self }
        return multipliedBy(ret.item, for: .height, extra: ret.extra)
    }
    
    /// 【SnapKit: 将传入视图的width/height赋值给当前对象的 height】
    /// 若需要 height 动态变化，可设置 mult (multiplier)为 .max\.min
    @discardableResult
    func height(by anchor: AppViewSizeAnchor?, mult: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .height, from: anchor, extra: mult) else { return self }
        return multipliedBy(ret.item, for: .height, extra: ret.extra)
    }
    
    @discardableResult
    func height(by anchor: AppViewSizeAnchor?, mult: CGFloat = 1.0) -> Self {
        guard let ret = verify(at: .height, from: anchor, extra: .equal(mult)) else { return self }
        return multipliedBy(ret.item, for: .height, extra: ret.extra)
    }
    
    /// 【SnapKit: 将传入视图的height赋值给当前对象的 height】
    /// 若需要 height 动态变化，可设置 mult (multiplier)为 .max\.min
    @discardableResult
    func height(by view: AppView, mult: AutoLayoutExtraValue) -> Self {
        guard let ret = verify(at: .height, from: view.lyt.height, extra: mult) else { return self }
        return multipliedBy(ret.item, for: .height, extra: ret.extra)
    }
    
    @discardableResult
    func height(by view: AppView, mult: CGFloat = 1.0) -> Self {
        guard let ret = verify(at: .height, from: view.lyt.height, extra: .equal(mult)) else { return self }
        return multipliedBy(ret.item, for: .height, extra: ret.extra)
    }
}

#endif
