//
//  ImageViewerRouter.swift
//  VIPER
//
//  Created by Семён Беляков on 09.11.2023.
//

import Foundation

protocol ImageViewerRouterProtocol {
    var presenter: ImageViewerPresenterProtocol? { get set }
}

final class ImageViewerRouter {
    weak var presenter: ImageViewerPresenterProtocol?
}

extension ImageViewerRouter: ImageViewerRouterProtocol {
    
}
