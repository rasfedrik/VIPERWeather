//
//  WeatherService.swift
//  VIPER
//
//  Created by Семён Беляков on 07.11.2023.
//

import Foundation

final class WeatherService {
    
    func getTemperature(completion: @escaping (Int) -> ()) {
        DispatchQueue.main.async {
            let randomNumber = Int.random(in: -30...30)
            completion(randomNumber)
        }
    }
    
}
