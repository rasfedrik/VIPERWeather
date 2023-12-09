//
//  ImageViewerModuleBuilder.swift
//  VIPER
//
//  Created by Семён Беляков on 09.11.2023.
//

import UIKit

final class ImageViewerModuleBuilder {
    
    static func build(temperature: Int) -> UIViewController {
        let interactor = ImageViewerInteractor(temperature: temperature)
        let router = ImageViewerRouter()
        let view = ImageViewerViewController()
        let presenter = ImageViewerPresenter(interactor: interactor, view: view, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        
        presenter.view = view
        
        return view
    }
    
}
