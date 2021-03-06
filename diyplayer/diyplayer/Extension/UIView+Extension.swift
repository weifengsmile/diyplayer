//
//  UIView+Extension.swift
//  diyplayer
//
//  Created by sidney on 2020/5/7.
//  Copyright © 2020 sidney. All rights reserved.
//

import Foundation

extension UIView {
    //返回该view所在的父view
    func superView<T: UIView>(of: T.Type) -> T? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let father = view as? T {
                return father
            }
        }
        return nil
    }
    
    func setRoundCorners(corners: UIRectCorner, with radii:CGFloat){
        let maskPath: UIBezierPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))

        let maskLayer: CAShapeLayer = CAShapeLayer.init()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        
        self.layer.mask = maskLayer
    }
    
    //设置阴影
    func setShadow(sColor: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        self.layoutIfNeeded()
        self.layer.shadowColor = sColor.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    //设置渐变背景色
    func setGradientBackgroundColor(colors: [Any], locations: [NSNumber], startPoint: CGPoint, endPoint: CGPoint) {
        self.layoutIfNeeded()
        let layer = CAGradientLayer()

        layer.frame = self.bounds

        //设置颜色
        layer.colors = colors

        //设置颜色渐变的位置 （我这里是横向 中间点开始变化）
        layer.locations = locations

        //开始的坐标点
        layer.startPoint = startPoint

        //结束的坐标点
        layer.endPoint = endPoint

        //设置渐变背景色后，view上面的内容无法显示，所以将layer放在最底层
        self.layer.insertSublayer(layer, at: 0)
    }
}
