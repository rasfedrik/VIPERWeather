//
//  DateService.swift
//  VIPER
//
//  Created by Семён Беляков on 07.11.2023.
//

import Foundation

final class DateService {
    func getDate(completion: @escaping (Date) -> Void) {
        DispatchQueue.main.async {
            completion(Date())
        }
    }
}
