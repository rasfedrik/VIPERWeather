//
//  WelcomeRouter.swift
//  VIPER
//
//  Created by Семён Беляков on 07.11.2023.
//

import UIKit

protocol WelcomeRouterProtocol: AnyObject {
    var presenter: WelcomePresenterProtocol? { get set }
    var rootVC: WelcomeViewController? { get set }
    
    func openImage(for temperature: Int)
    
}

final class WelcomeRouter: WelcomeRouterProtocol {
    
    weak var rootVC: WelcomeViewController?
    weak var presenter: WelcomePresenterProtocol?
    
    func openImage(for temperature: Int) {
        let vc = ImageViewerModuleBuilder.build(temperature: temperature)
        rootVC?.present(vc, animated: true)
    }
    
}
