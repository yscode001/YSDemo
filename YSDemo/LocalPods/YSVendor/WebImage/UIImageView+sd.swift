//
//  UIImageView+sd.swift
//  YSAssist
//
//  Created by yaoshuai on 2021/1/1.
//

import Foundation
import SDWebImage
import YSKit

// MARK: - 利用三方库(SD)显示图片
public extension YSOriginalObjectProtocol where OriginalObjectType: UIImageView{
    
    func setImage(_ url: String?, ph: UIImage?){
        guard let urlStr = url, let requestURL = URL(string: urlStr) else {
            originalObject.image = ph
            return
        }
        originalObject.sd_setImage(with: requestURL, placeholderImage: ph)
    }
    
    func setImage(_ url: String?, ph: UIImage?, complete: @escaping((UIImage?) -> ())){
        guard let urlStr = url, let requestURL = URL(string: urlStr) else {
            originalObject.image = ph
            complete(ph)
            return
        }
        originalObject.sd_setImage(with: requestURL, placeholderImage: ph, options: .retryFailed) { (img, _, _, _) in
            complete(img)
        }
    }
    
    func setImage(_ url: String?, phName: String?){
        let phImage = UIImage(named: phName ?? "")
        setImage(url, ph: phImage)
    }
    
    func setImage(_ url: String?, phName: String?, complete: @escaping((UIImage?) -> ())){
        let phImage = UIImage(named: phName ?? "")
        setImage(url, ph: phImage, complete: complete)
    }
}

// MARK: - 调整后图片副本的标识
private extension YSOriginalObjectProtocol where OriginalObjectType:UIImageView{
    
    /// 圆角副本存储标识
    func radiusCopySaveKey(url: String?, radius: CGFloat = 0) -> String{
        let w = Int(originalObject.bounds.width)
        let h = Int(originalObject.bounds.height)
        let r = Int(radius)
        let u = url ?? ""
        return "\(transformContentModel_rawString)_\(w)_\(h)_\(r)_\(u)"
    }
    
    var transformContentModel_rawString: String{
        switch transformContentModel {
        case .fill:
            return "SDImageScaleModeFill"
        case .aspectFit:
            return "SDImageScaleModeAspectFit"
        case .aspectFill:
            return "SDImageScaleModeAspectFill"
        default:
            return "SDImageScaleModeAspectFill"
        }
    }
    
    var transformContentModel: SDImageScaleMode{
        switch originalObject.contentMode {
        case .scaleToFill:
            return .fill
        case .scaleAspectFit:
            return .aspectFit
        case .scaleAspectFill:
            return .aspectFill
        default:
            return .aspectFill
        }
    }
}

// MARK: - 利用三方库(SD)显示图片，并切圆角
public extension YSOriginalObjectProtocol where OriginalObjectType: UIImageView{
    
    /// 获取圆角值
    /// - Parameter radius: 圆角值(如果值为空，为控件宽高值最小的一半)
    /// - Returns: 返回圆角值
    private func getRadius(radius: CGFloat?) -> CGFloat{
        if let rad = radius{
            return rad
        } else{
            return min(originalObject.bounds.width, originalObject.bounds.height) * 0.5
        }
    }
    
    /// 显示图片(自带切圆角)
    /// - Parameters:
    ///   - url: 图片地址
    ///   - ph: 占位图片
    ///   - radius: 圆角(如果值为空，为控件宽高值最小的一半)
    func setImage(_ url: String?, ph: UIImage?, radius: CGFloat?){
        guard let urlStr = url, let requestURL = URL(string: urlStr) else {
            originalObject.image = ph?.sd_resizedImage(with: originalObject.bounds.size, scaleMode: transformContentModel)?.sd_roundedCornerImage(withRadius: getRadius(radius: radius), corners: .allCorners, borderWidth: 0, borderColor: nil)
            return
        }
        if let img = SDImageCache.shared.imageFromCache(forKey: radiusCopySaveKey(url: url, radius: getRadius(radius: radius))){
            originalObject.image = img
            return
        }
        originalObject.sd_setImage(with: requestURL, placeholderImage: ph, options: .avoidDecodeImage, progress: nil) { [weak originalObject]  (originalImage, _, _, _) in
            guard let `originalObject` = originalObject else{ return }
            if let originalImg = originalImage{
                let transormImg = originalImg.sd_resizedImage(with: originalObject.bounds.size, scaleMode: self.transformContentModel)?.sd_roundedCornerImage(withRadius: self.getRadius(radius: radius), corners: .allCorners, borderWidth: 0, borderColor: nil)
                originalObject.image = transormImg
                SDImageCache.shared.store(transormImg, forKey: self.radiusCopySaveKey(url: url, radius: self.getRadius(radius: radius)), completion: nil)
            } else{
                originalObject.image = ph?.sd_resizedImage(with: originalObject.bounds.size, scaleMode: self.transformContentModel)?.sd_roundedCornerImage(withRadius: self.getRadius(radius: radius), corners: .allCorners, borderWidth: 0, borderColor: nil)
            }
        }
    }
    
    /// 显示图片(自带切圆角)
    /// - Parameters:
    ///   - url: 图片地址
    ///   - phName: 占位图片
    ///   - radius: 圆角(如果值为空，为控件宽高值最小的一半)
    func setImage(_ url: String?, phName: String?, radius: CGFloat?){
        let phImage = UIImage(named: phName ?? "")
        setImage(url, ph: phImage, radius: radius)
    }
}

// MARK: - 利用三方库(SD)显示图片，切圆角，并带边框
public extension YSOriginalObjectProtocol where OriginalObjectType: UIImageView{
    
    /// 显示图片(自带切圆角)
    /// - Parameters:
    ///   - url: 图片地址
    ///   - ph: 占位图片
    ///   - radius: 圆角(如果值为空，为控件宽高值最小的一半)
    ///   - borderWidth: 边框宽度
    ///   - borderColor: 边框颜色
    func setImage(_ url: String?, ph: UIImage?, radius: CGFloat?, borderWidth: CGFloat, borderColor: UIColor){
        guard let urlStr = url, let requestURL = URL(string: urlStr) else {
            originalObject.image = ph?.sd_resizedImage(with: originalObject.bounds.size, scaleMode: transformContentModel)?.sd_roundedCornerImage(withRadius: getRadius(radius: radius), corners: .allCorners, borderWidth: borderWidth, borderColor: borderColor)
            return
        }
        if let img = SDImageCache.shared.imageFromCache(forKey: radiusCopySaveKey(url: url, radius: getRadius(radius: radius))){
            originalObject.image = img
            return
        }
        originalObject.sd_setImage(with: requestURL, placeholderImage: ph, options: .avoidDecodeImage, progress: nil) { [weak originalObject]  (originalImage, _, _, _) in
            guard let `originalObject` = originalObject else{ return }
            if let originalImg = originalImage{
                let transormImg = originalImg.sd_resizedImage(with: originalObject.bounds.size, scaleMode: self.transformContentModel)?.sd_roundedCornerImage(withRadius: self.getRadius(radius: radius), corners: .allCorners, borderWidth: borderWidth, borderColor: borderColor)
                originalObject.image = transormImg
                SDImageCache.shared.store(transormImg, forKey: self.radiusCopySaveKey(url: url, radius: self.getRadius(radius: radius)), completion: nil)
            } else{
                originalObject.image = ph?.sd_resizedImage(with: originalObject.bounds.size, scaleMode: self.transformContentModel)?.sd_roundedCornerImage(withRadius: self.getRadius(radius: radius), corners: .allCorners, borderWidth: borderWidth, borderColor: borderColor)
            }
        }
    }
    
    /// 显示图片(自带切圆角)
    /// - Parameters:
    ///   - url: 图片地址
    ///   - phName: 占位图片
    ///   - radius: 圆角(如果值为空，为控件宽高值最小的一半)
    ///   - borderWidth: 边框宽度
    ///   - borderColor: 边框颜色
    func setImage(_ url: String?, phName: String?, radius: CGFloat?, borderWidth: CGFloat, borderColor: UIColor){
        let phImage = UIImage(named: phName ?? "")
        setImage(url, ph: phImage, radius: radius, borderWidth: borderWidth, borderColor: borderColor)
    }
}

// MARK: - 取消当前图片的加载
public extension YSOriginalObjectProtocol where OriginalObjectType: UIImageView{
    
    /// 取消当前图片的加载
    func cancelCurrentImageLoad(){
        originalObject.sd_cancelCurrentImageLoad()
    }
}
