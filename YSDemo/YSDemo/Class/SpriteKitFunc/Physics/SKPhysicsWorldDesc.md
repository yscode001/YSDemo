# SKPhysicsWorld

~~~ swift
// 不需要创建SKPhysicsWorld的示例，因为SKScene有physicsWorld属性
open class SKScene : SKEffectNode {
	open var physicsWorld: SKPhysicsWorld { get }
}
~~~

~~~ swift
// 设置SKScene的联系代理
class SKScene_physics: SKScene {
	
	private func setupScenePhysicsWorld(){
		// 联系代理
		physicsWorld.contactDelegate = self
	}
}

// 联系代理
extension SKScene_physics: SKPhysicsContactDelegate{
	
	/*
	SKPhysicsContact介绍：
	open var bodyA: SKPhysicsBody { get }， 联系中的第一个物体
	open var bodyB: SKPhysicsBody { get }， 联系中的第二个物体
	open var contactPoint: CGPoint { get }， 两个物体在场景坐标系中的联系点
	open var contactNormal: CGVector { get }，
	open var collisionImpulse: CGFloat { get }， 两个物体的碰撞强度，牛顿每秒
	*/

	// 开始碰撞
	func didBegin(_ contact: SKPhysicsContact){}

	// 结束碰撞
	func didEnd(_ contact: SKPhysicsContact) {}
}
~~~
~~~ swift
open class SKPhysicsWorld : NSObject, NSSecureCoding {

    // 重力加速度，属性的单位是米每秒，默认值为(0.0,-9.8)，代表了地球重力加速度
    open var gravity: CGVector

    // 模拟的执行速率，默认值为1.0，表示模拟以正常速率执行。
    // 一个不同于默认值的值将改变模拟的执行速率。例：一个2.0的值，表示模拟将以两倍速率执行；若只为0.0，则表示暂定模拟。
    open var speed: CGFloat

    // 联系代理
    unowned(unsafe) open var contactDelegate: SKPhysicsContactDelegate?

    // 添加联合
    open func add(_ joint: SKPhysicsJoint)

    // 移除联合
    open func remove(_ joint: SKPhysicsJoint)

    // 移除所有联合
    open func removeAllJoints()

    // 查找包含point的第一个物理体
    open func body(at point: CGPoint) -> SKPhysicsBody?

    // 查找与rect相交的第一个物理体
    open func body(in rect: CGRect) -> SKPhysicsBody?

    // 查找与射线相交的第一个物理体
    open func body(alongRayStart start: CGPoint, end: CGPoint) -> SKPhysicsBody?

    // 遍历包含point的所有物理体
    open func enumerateBodies(at point: CGPoint, using block: @escaping (SKPhysicsBody, UnsafeMutablePointer<ObjCBool>) -> Void)

    // 遍历与rect相交的所有物理体
    open func enumerateBodies(in rect: CGRect, using block: @escaping (SKPhysicsBody, UnsafeMutablePointer<ObjCBool>) -> Void)

    // 遍历与射线相交的所有物理体
    open func enumerateBodies(alongRayStart start: CGPoint, end: CGPoint, using block: @escaping (SKPhysicsBody, CGPoint, CGVector, UnsafeMutablePointer<ObjCBool>) -> Void)
}
~~~
