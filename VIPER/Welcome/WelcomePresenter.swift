//
//  WelcomePresenter.swift
//  VIPER
//
//  Created by Семён Беляков on 07.11.2023.
//

import UIKit

protocol WelcomePresenterProtocol: AnyObject {
    var interactor: WelcomeInteractorProtocol? { get set }
    var view: WelcomeViewControllerProtocol? { get set }
    var router: WelcomeRouterProtocol? { get set }
    
    func viewDidLoad()
    
    func didLoad(date: String?)
    func didLoad(temperature: String?)
    func didLoad(imageView: UIImageView?)
    
    func didTapImageButton()
}

final class WelcomePresenter {

    weak var view: WelcomeViewControllerProtocol?
    var interactor: WelcomeInteractorProtocol?
    var router: WelcomeRouterProtocol?
    
    init(interactor: WelcomeInteractorProtocol?, view: WelcomeViewControllerProtocol?, router: WelcomeRouterProtocol?) {
        
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
}
 
extension WelcomePresenter: WelcomePresenterProtocol {
    
    func didTapImageButton() {
        guard let temperature = interactor?.temperature else { return }
        router?.openImage(for: temperature)
    }
    
    func viewDidLoad() {
        self.interactor?.loadDateAndWeatherTogether()
    }
    
    func didLoad(date: String?) {
        view?.didLoadDate(date: date)
    }
    
    func didLoad(temperature: String?) {
        view?.didLoadWeather(temperature: temperature)
    }
    
    func didLoad(imageView: UIImageView?) {
        view?.didLoadImageForMoveToSecondVCButton(imageView: imageView)
    }

}
