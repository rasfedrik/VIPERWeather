//
//  ImageViewerInteractor.swift
//  VIPER
//
//  Created by Семён Беляков on 09.11.2023.
//

import UIKit

protocol ImageViewerInteractorProtocol: AnyObject {
    var presenter: ImageViewerPresenterProtocol? { get set }
    
    func getImageForCurrentTemperature() -> UIImageView?
    
}

final class ImageViewerInteractor {
    weak var presenter: ImageViewerPresenterProtocol?
    let imagesService = ImagesService()
    
    let temperature: Int
    
    init(temperature: Int) {
        self.temperature = temperature
    }
}

extension ImageViewerInteractor: ImageViewerInteractorProtocol {
    
    func getImageForCurrentTemperature() -> UIImageView? {
        imagesService.getImage(temperature: temperature)
    }
    
}
