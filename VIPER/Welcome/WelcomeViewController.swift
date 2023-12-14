//
//  WelcomeViewController.swift
//  VIPER
//
//  Created by Семён Беляков on 07.11.2023.
//

import UIKit

protocol WelcomeViewControllerProtocol: AnyObject {
    var presenter: WelcomePresenterProtocol? { get set }
    
    func didLoadDate(date: String?)
    func didLoadWeather(temperature: String?)
    func didRefreshTemperature(_ temperature: String?)
    func didLoadImageForMoveToSecondVCButton(imageView: UIImageView?)

}

final class WelcomeViewController: UIViewController {
    
    var presenter: WelcomePresenterProtocol?

    private lazy var dateLabel = Label()
    private lazy var temperatureLabel = Label()
    
    private var imageForMoveToSecondVCButton: UIImage?
    
    private var moveToSecondViewControllerButton = Button(
        name: "Открыть",
        colors: [UIColor.systemRed.withAlphaComponent(0.1).cgColor,
                 CGColor.init(red: 10, green: 102, blue: 204, alpha: 1)],
        startPoint: .init(x: 0.0, y: 0.0),
        endPoint: .init(x: 1.0, y: 1.0)
    )
    
    private lazy var refreshTemperature = Button(name: "Обновить")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        presenter?.viewDidLoad()
        setupViews()
        
        moveToSecondViewControllerButton.addTarget(self, action: #selector(didTapMoveToSecondVCButton), for: .touchUpInside)
        refreshTemperature.addTarget(self, action: #selector(didTapRefreshButton), for: .touchUpInside)
    }
    
    private func setupViews() {
        view.addSubviews(dateLabel, temperatureLabel, moveToSecondViewControllerButton, refreshTemperature)
        
        NSLayoutConstraint.activate([
            
            moveToSecondViewControllerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            moveToSecondViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moveToSecondViewControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: moveToSecondViewControllerButton.topAnchor, constant: -40),
            
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: -40),
            
            refreshTemperature.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            refreshTemperature.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            refreshTemperature.topAnchor.constraint(equalTo: moveToSecondViewControllerButton.bottomAnchor, constant: 30)
            
        ])
    }
    
    @objc private func didTapMoveToSecondVCButton() {
        presenter?.didTapImageButton()
    }
    
    @objc private func didTapRefreshButton() {
        presenter?.viewDidLoad()
    }
    
}

extension WelcomeViewController: WelcomeViewControllerProtocol {
    
    func didRefreshTemperature(_ temperature: String?) {
        guard let temperature = temperature else { return }
        temperatureLabel.text = temperature
    }

    func didLoadDate(date: String?) {
        guard let date = date else { return }
        dateLabel.text = date
    }
    
    func didLoadWeather(temperature: String?) {
        guard let temperature = temperature else { return }
        temperatureLabel.text = temperature
    }
    
    func didLoadImageForMoveToSecondVCButton(imageView: UIImageView?) {
        moveToSecondViewControllerButton.configuration?.image = imageView?.image
        
    }
    
    
}
