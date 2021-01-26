~~~ swift
SpriteKit支持两种类型的物理体：基于“体积”的物理体和基于“边界或形状”的物理体。
1、基于边界或形状的物理体：没有质量和体积，也不受力的影响。基于边界或形状的物理体被用于模拟单纯的形状。（常用于游戏地图）
2、基于体积的物理体：有质量和体积，默认情况下，受重力，摩擦和碰撞的影响。力也可以直接作用在这个物理体上。它的dynamic属性允许你覆盖它的行为。（常用于精灵）
3、一个基于形状(边界)的物理体没有体积和质量，dynamic属性值默认为NO，基于形状的物理体只能与基于体积的物理体发生碰撞。
~~~

~~~ swift
// SKPhysicsBody构造方法
open class SKPhysicsBody : NSObject, NSCopying, NSSecureCoding {

// 圆形：以node的原点为中心
public /*not inherited*/ init(circleOfRadius r: CGFloat)

// 圆形：指定中心和半径
public /*not inherited*/ init(circleOfRadius r: CGFloat, center: CGPoint)

// 矩形：以node的原点为中心
public /*not inherited*/ init(rectangleOf s: CGSize)

// 矩形：指定中心和半径
public /*not inherited*/ init(rectangleOf s: CGSize, center: CGPoint)

// 多边形：以node的原点为中心，一个逆时针没有相交的凸多边形路径
public /*not inherited*/ init(polygonFrom path: CGPath)

-----------上面是体积，下面是边界-----------

// 在两点之间创建一个边界
public /*not inherited*/ init(edgeFrom p1: CGPoint, to p2: CGPoint)

// 根据路径创建一个边界链
public /*not inherited*/ init(edgeChainFrom path: CGPath)

// 根据路径创建一个边界回路
public /*not inherited*/ init(edgeLoopFrom path: CGPath)

// 创建一个基于形状的物理体
public /*not inherited*/ init(edgeLoopFrom rect: CGRect)

public /*not inherited*/ init(texture: SKTexture, size: CGSize)

public /*not inherited*/ init(texture: SKTexture, alphaThreshold: Float, size: CGSize)

public /*not inherited*/ init(bodies: [SKPhysicsBody])
}
~~~

~~~ swift
// 属性与方法

// 默认值为YES，如果为NO，物理体忽略施加在它身上的所有力。(只对"体积物理体"生效)
open var isDynamic: Bool

// 是否受重力影响，只对"体积物理体"生效
open var affectedByGravity: Bool

// 是否受旋转力影响，只对"体积物理体"生效
open var allowsRotation: Bool

// 质量，受密度、体积影响
open var mass: CGFloat

// 密度，受质量、体积影响
open var density: CGFloat

// 物体覆盖区域(体积)
open var area: CGFloat { get }

// 表面粗糙程度，用于控制摩擦力，取值(0.0-1.0)，默认0.2
open var friction: CGFloat

// 反弹力，决定物体反弹时的动量，取值(0.0-1.0)，默认0.2
open var restitution: CGFloat

// 线性阻尼，模拟水流或者空气的阻力，取值(0.0-1.0)，默认0.1；如果为0.0，物理体将没有线性阻尼
open var linearDamping: CGFloat

// 角速度阻尼，模拟水流或者空气的阻力，取值(0.0-1.0)，默认0.1；如果该值为0.0，物理体将没有角速度阻尼
open var angularDamping: CGFloat

// 判断物理体是否静止
open var isResting: Bool

// 渲染物理体的节点
weak open var node: SKNode? { get }

// 该数组保存了本物理体所关联的其他所有的物理体
open var joints: [SKPhysicsJoint] { get }

// 与这个物理体相关联的物理体数组
open func allContactedBodies() -> [SKPhysicsBody]

open var pinned: Bool

open var charge: CGFloat

// 速度矢量
open var velocity: CGVector

// 角速度矢量
open var angularVelocity: CGFloat

// 拉力：施加一个均匀作用于物理体的拉力
open func applyForce(_ force: CGVector)

// 拉力：施加一个作用于指定点的拉力
open func applyForce(_ force: CGVector, at point: CGPoint)

// 角拉力：产生一个角加速度，不引起任何线性加速度
open func applyTorque(_ torque: CGFloat)

// 推力：施加一个均匀作用于物理体的推力
open func applyImpulse(_ impulse: CGVector)

// 推力：施加一个作用于指定点的推力
open func applyImpulse(_ impulse: CGVector, at point: CGPoint)

// 角推力：产生一个角加速度，不引起任何线性加速度
open func applyAngularImpulse(_ impulse: CGFloat)

_____下面是碰撞相关属性______

// 设置物体是否使用更精准的碰撞算法，默认值为NO
// NO：不启动精确的冲突检测会有一个副作用，如果一个物体移动的非常快(比如一个子弹)，它可能会直接穿过其他物，但检测不到碰撞
// YES：将进行一个更精确以及更昂贵的碰撞计算。当物体又小又快的时候(子弹)，本属性的值应该被设置为YES。
open var usesPreciseCollisionDetection: Bool

open var fieldBitMask: UInt32

// 物理体的类别
open var categoryBitMask: UInt32

// 定义哪种类别的物理体可以与之发生碰撞
open var collisionBitMask: UInt32

// 联系的物理体的类别
open var contactTestBitMask: UInt32

//body.categoryBitMask = 0;     ->类别掩码，为0时代表我谁也碰撞不了
//body.collisionBitMask = 0;    ->允许碰撞掩码，为0时代表谁也碰撞不了我
//body.contactTestBitMask = 0;  ->碰撞检测掩码，为0时代表不触发检测(只是不触发碰撞代理方法，但视觉上还是碰撞了)
//想要发生碰撞，需要 categoryBitMask & collisionBitMask 运算，为非0，可以发生碰撞

/*
假设2个sprite：A和B
A.categoryBitMask & B.collisionBitMask 为非0，
且 B.categoryBitMask & A.collisionBitMask也为非0，
可以发生碰撞，相同加速度情况下，碰撞结果取决于物理体积

假设2个sprite：A和B
A.categoryBitMask & B.collisionBitMask 为0， 
但 A.collisionBitMask & B.categoryBitMask为非0，
可以发生碰撞，但碰撞结果与上面不同。可以理解为：发生碰撞的时候，只考虑B的碰撞体积，把A的碰撞体积假设成0(虽然不是0)。
虽然发生碰撞，但是A碰撞B时候B是不会动的，B碰撞A的时候，只考虑B的碰撞体积，会把A碰撞开（这里A被碰撞开位移的大小与速度也与A的物理体积有关）
*/
~~~
