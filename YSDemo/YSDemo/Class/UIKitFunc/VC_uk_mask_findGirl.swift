//
//  VC_uk_mask_findGirl.swift
//  YSDemo
//
//  Created by yaoshuai on 2021/1/24.
//

/// 找美女
class VC_uk_mask_findGirl: VC_base{
    
    /// 美女背景图
    private lazy var girlBGImgV:UIImageView = UIImageView.ys.create(fileName: "mask_bg.png")
    
    /// 美女图片
    private lazy var girlImgV:UIImageView = UIImageView.ys.create(fileName: "mask_girl.jpeg")
    
    /// 羽化遮罩
    private lazy var circleMaskLayer:CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 100, y: 100, width: 400, height: 400)
        layer.contents = UIImage.ys.create(fileName: "mask_circle.png")?.cgImage
        layer.position = CGPoint(x: 200, y: 200)
        return layer
    }()
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
    }
    
    private func setupUI(){
        girlImgV.layer.mask = circleMaskLayer
        view.ys.addSubviews(girlBGImgV, girlImgV)
        
        girlBGImgV.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        girlImgV.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let poi = touches.first?.location(in: view) else{
            return
        }
        circleMaskLayer.position = poi
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let poi = touches.first?.location(in: view) else{
            return
        }
        circleMaskLayer.position = poi
    }
}
