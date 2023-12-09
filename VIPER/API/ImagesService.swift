//
//  ImagesService.swift
//  VIPER
//
//  Created by Семён Беляков on 09.11.2023.
//

import UIKit

final class ImagesService {
    
    static let shared = ImagesService()
    
    func getImage(temperature: Int) -> UIImageView {
        let imageView = UIImageView()
        
        let configuration = UIImage.SymbolConfiguration.unspecified
        
        if temperature < -10 {
            guard let symbolImage = UIImage(systemName: "snowflake", withConfiguration: configuration) else { return UIImageView() }
            
            imageView.image = symbolImage
            imageView.tintColor = .systemBlue
            
        } else if temperature >= -10, temperature <= 10 {
            guard let symbolImage = UIImage(systemName: "cloud.fill", withConfiguration: configuration) else { return UIImageView() }
            
            imageView.image = symbolImage
            imageView.tintColor = .systemGray4
            
        } else {
            guard let symbolImage = UIImage(systemName: "sun.max", withConfiguration: configuration) else { return UIImageView() }
            
            imageView.image = symbolImage
            imageView.tintColor = .systemYellow
        }
        
        return imageView
        
    }
}
