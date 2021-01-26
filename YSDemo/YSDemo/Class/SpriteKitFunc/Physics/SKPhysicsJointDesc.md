~~~ swift
// 一个SKPhysicsJoint实例将两个物体联合在一起，这样它们就可以一起模拟物理特性了。
// 不能直接实例化这个类，但可以实例化其子类。
open class SKPhysicsJoint : NSObject, NSSecureCoding {
    open var bodyA: SKPhysicsBody // 联合中的第一个物体
    open var bodyB: SKPhysicsBody // 联合中的第儿个物体
    open var reactionForce: CGVector { get }
    open var reactionTorque: CGFloat { get }
}
~~~
~~~ swift
SKPhysicsJoint有4个子类：
SKPhysicsJointPin：一个别针联合，允许两个物体围绕一个锚点独立的旋转，就像是钉在一起
SKPhysicsJointSpring：一个弹性的联合，弹簧的长度是两个物体的初始距离
SKPhysicsJointFixed：一个固定的联合，通过一个参考点将两个物体联合在一起，这种方式在创建一些需要打散的复杂形状时很有用
SKPhysicsJointSliding：一个滑动的联合允许两个物体沿着一个选定的轴滑动
SKPhysicsJointLimit：一个限制的联合，施加了两个物体间的最大距离，就像它们是用绳子连在一起
~~~
