//
//  WelcomeModuleBuilder.swift
//  VIPER
//
//  Created by Семён Беляков on 07.11.2023.
//

import UIKit

final class WelcomeModuleBuilder {
    static func build() -> UIViewController {
        let view = WelcomeViewController()
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        
        let presenter = WelcomePresenter(interactor: interactor, view: view, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        
        presenter.view = view
        router.rootVC = view
        
        return view
    }
}
