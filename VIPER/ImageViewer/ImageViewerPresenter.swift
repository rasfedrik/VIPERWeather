//
//  ImageViewerPresenter.swift
//  VIPER
//
//  Created by Семён Беляков on 09.11.2023.
//

import Foundation

protocol ImageViewerPresenterProtocol: AnyObject {
    var interactor: ImageViewerInteractorProtocol? { get set }
    var view: ImageViewerViewControllerProtocol? { get set }
    var router: ImageViewerRouterProtocol? { get set }
    
    func viewDidLoad()
}

final class ImageViewerPresenter {
    var interactor: ImageViewerInteractorProtocol?
    weak var view: ImageViewerViewControllerProtocol?
    var router: ImageViewerRouterProtocol?
    
    init(interactor: ImageViewerInteractorProtocol?, view: ImageViewerViewControllerProtocol?, router: ImageViewerRouterProtocol?) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
}

extension ImageViewerPresenter: ImageViewerPresenterProtocol {
    
    func viewDidLoad() {
        guard let imageView = interactor?.getImageForCurrentTemperature() else { return }
        view?.showImage(imageView: imageView)
    }
}
