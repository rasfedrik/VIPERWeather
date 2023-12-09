//
//  Extensions.swift
//  VIPER
//
//  Created by Семён Беляков on 08.11.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
    func removeFromSuperview(_ views: UIView...) {
        views.forEach {
            $0.removeFromSuperview()
        }
    }
    
}
