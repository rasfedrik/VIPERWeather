//
//  Label.swift
//  VIPER
//
//  Created by Семён Беляков on 29.11.2023.
//

import UIKit

final class Label: UILabel {
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        textColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
