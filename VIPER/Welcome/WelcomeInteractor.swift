//
//  WelcomeInteractor.swift
//  VIPER
//
//  Created by Семён Беляков on 07.11.2023.
//

import UIKit

protocol WelcomeInteractorProtocol: AnyObject {
    var presenter: WelcomePresenterProtocol? { get set }
    
    func loadDateAndWeatherTogether()
//    func loadImageForMoveButton()
    var temperature: Int { get }
}

final class WelcomeInteractor: WelcomeInteractorProtocol {
    
    weak var presenter: WelcomePresenterProtocol?
    
    private let dateService = DateService()
    private let weatherSetvice = WeatherService()
    private let imageService = ImagesService()
    
    private let dispatchGroup = DispatchGroup()
    
    var temperature: Int = 0
    
    func loadDateAndWeatherTogether() {
        var dateStr = ""
        var temperatureStr = ""
        
        dispatchGroup.enter()
        dateService.getDate { [weak self] date in
            dateStr = date.description
            self?.dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        weatherSetvice.getTemperature { [weak self] temperature in
            temperatureStr = temperature.description
            self?.temperature = temperature
            self?.dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: .main) {
            self.presenter?.didLoad(date: dateStr)
            self.presenter?.didLoad(temperature: temperatureStr)
            
            let imageView = self.imageService.getImage(temperature: Int(temperatureStr) ?? 0)
            self.presenter?.didLoad(imageView: imageView)

        }
    }
    
}
