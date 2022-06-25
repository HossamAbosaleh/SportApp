//
//  SportsViewModel.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/19/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation

class SportsViewModel: SportsProtocol  {
    
    
    var arrayOfSport:[Sport]?{
        didSet{
            bindingSportData(arrayOfSport,nil)
        }
    }
    
    var error: Error? {
        didSet{
            bindingSportData(nil,error)
        }
    }
    
    var bindingSportData: ([Sport]?, Error?) -> Void = {_, _ in}
    
    var apiServices: ApiServices
    
    init(apiServices: ApiServices = NetworkManager()) {
        self.apiServices = apiServices
        
    }
    
    func fetchSport(endPoint: String) {
        apiServices.fetchSport(endpoint: endPoint) { (sports, error) in
            if let sports = sports{
                self.arrayOfSport = sports
            }
            if let error = error {
                self.error = error
            }
        }
        
    }
    
    
}
