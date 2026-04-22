//
//  UIView+.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/22/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
