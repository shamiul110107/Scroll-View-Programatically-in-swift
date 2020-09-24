//
//  CommonTableView.swift
//  DesignTest
//
//  Created by sami on 24/9/20.
//

import Foundation
import UIKit

class AutoResizableTableView: UITableView {
    override public func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        return contentSize
    }
}
