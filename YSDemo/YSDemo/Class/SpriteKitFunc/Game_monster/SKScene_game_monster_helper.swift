//
//  SKScene_game_monster_helper.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/26.
//

// MARK: - CGPoint运算

/// (lx + rx, ly + ry)
func +(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

/// (lx - rx, ly - ry)
func -(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

/// (x * scalar, y * scalar)
func *(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

/// (x / scalar, y / scalar)
func /(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

// MARK: - CGPoint扩展

extension CGPoint {
    
    /// point与原点之间的距离长度，即斜边长
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    /// xy都除以斜边长后得到的point
    func normalized() -> CGPoint {
        return self / length()
    }
}

// MARK: - 开平方，求平方根

#if !(arch(x86_64) || arch(arm64))

/// 对a开平方，求平方根
func sqrt(a: Float) -> CGFloat {
    return CGFloat(sqrtf(a))
}

/// 对a开平方，求平方根
func sqrt(a: CGFloat) -> CGFloat {
    return CGFloat(sqrtf(Float(a)))
}

/// 对a开平方，求平方根
func sqrt(a: Double) -> CGFloat {
    return CGFloat(sqrtf(Float(a)))
}

/// 对a开平方，求平方根
func sqrt(a: Int) -> CGFloat {
    return CGFloat(sqrtf(Float(a)))
}

#endif
