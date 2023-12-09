//
//  ImageViewerViewController.swift
//  VIPER
//
//  Created by Семён Беляков on 09.11.2023.
//

import UIKit

protocol ImageViewerViewControllerProtocol: AnyObject {
    var presenter: ImageViewerPresenterProtocol? { get set }
    
    func showImage(imageView: UIImageView?)
}

final class ImageViewerViewController: UIViewController {
    
    var presenter: ImageViewerPresenterProtocol?
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        presenter?.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.addSubview(weatherImageView)
        
        NSLayoutConstraint.activate([
            weatherImageView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weatherImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weatherImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension ImageViewerViewController: ImageViewerViewControllerProtocol {
    
    func showImage(imageView: UIImageView?) {
        DispatchQueue.main.async {
            let imageColor = imageView?.tintColor
            
            self.weatherImageView.image = imageView?.image
            self.weatherImageView.tintColor = imageColor
        }
    }
    
}

