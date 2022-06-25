//
//  JsonDecoder.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/18/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation

func convertDataFromApi<T:Codable>(data:Data) -> T? {
    
    let jsonDecoder = JSONDecoder()
    let arrayDecoded = try? jsonDecoder.decode(T.self, from: data)
    
    return arrayDecoded
}
