//
//  Button.swift
//  VIPER
//
//  Created by Семён Беляков on 29.11.2023.
//

import UIKit

final class Button: UIButton {
    
    enum ImageWeather: String {
        case cloud = "cloud.sun.rain.fill"
    }
    
    init(name: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(name, for: .normal)
        
        var configuration = UIButton.Configuration.bordered()
        configuration.baseBackgroundColor = UIColor.init(cgColor: CGColor.init(red: 209, green: 29, blue: 29, alpha: 1))
        configuration.baseForegroundColor = .black
        configuration.cornerStyle = .capsule
        configuration.imagePadding = 10
        configuration.imagePlacement = .trailing
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
        
        // border
        configuration.background.strokeColor = UIColor.init(cgColor: CGColor.init(red: 0, green: 102, blue: 204, alpha: 1))
        
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer({ incoming in
            var outgoing = incoming
            outgoing.font = UIFont.preferredFont(forTextStyle: .headline)
            return outgoing
        })

        configurationUpdateHandler = { button in
            if button.isHighlighted {
                UIView.animate(withDuration: 0.1) {
                    button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                    configuration.showsActivityIndicator = true
                }
            } else {
                UIView.animate(withDuration: 0.1) {
                    button.transform = CGAffineTransform(scaleX: 1, y: 1)
                    configuration.showsActivityIndicator = false
                }
            }
        }
        
        self.configuration = configuration
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
