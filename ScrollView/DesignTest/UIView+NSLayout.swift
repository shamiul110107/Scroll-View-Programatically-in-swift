//
//  UIView+NSLayout.swift
//  DesignTest
//
//  Created by sami on 24/9/20.
//

import Foundation
import UIKit

class LineView: UIView {
    
    override func layoutSubviews() {
        self.backgroundColor = UIColor.lightGray
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat = 0, bottom: NSLayoutYAxisAnchor? = nil, paddingBottom: CGFloat = 0, left: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, right: NSLayoutXAxisAnchor? = nil, paddingRight: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
