//
//  Button.swift
//  VIPER
//
//  Created by Семён Беляков on 29.11.2023.
//

import UIKit

final class Button: UIButton {
    
    private var gradientLayer = CAGradientLayer()
    private var shadowLayer: CAShapeLayer!
    
    init(name: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(name, for: .normal)
        
        layer.cornerRadius = 15
        
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor.init(cgColor: CGColor.init(red: 209, green: 29, blue: 29, alpha: 1))
        configuration.baseForegroundColor = .black
        configuration.cornerStyle = .capsule
        configuration.background.cornerRadius = layer.cornerRadius
        configuration.imagePadding = 10
        configuration.imagePlacement = .trailing
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
        
        // border
//        configuration.background.strokeColor = UIColor.init(cgColor: CGColor.init(red: 0, green: 102, blue: 204, alpha: 1))
        
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
        
        gradientLayer.startPoint = .init(x: 0, y: 0)
        gradientLayer.endPoint = .init(x: 1, y: 0.5)
        gradientLayer.colors = [UIColor.systemRed.withAlphaComponent(0.1), CGColor.init(red: 0, green: 102, blue: 204, alpha: 1)]
        
        layer.addSublayer(gradientLayer)
        
        self.configuration = configuration
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Convenience init

extension Button {
    convenience init(name: String, colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint) {
        self.init(name: name)
        
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.colors = colors
    }
}

// MARK: - layoutSublayers

extension Button {
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        if layer == self.layer {
            self.gradientLayer.frame = bounds
            self.gradientLayer.cornerRadius = layer.cornerRadius
        }
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.cornerCurve = .continuous
            shadowLayer.shadowOpacity = 0.3
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowOffset = .init(width: .zero, height: 12)
            shadowLayer.shadowRadius = layer.cornerRadius
            shadowLayer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
            
            self.layer.insertSublayer(shadowLayer, below: nil)
        }
        
    }
    
}
