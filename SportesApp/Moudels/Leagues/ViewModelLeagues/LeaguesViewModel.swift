//
//  LeaguesViewModel.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/19/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation

class LeaguesViewModel: LeaguesProtocol {
    
    var arrayOfLeague: [League]?{
        didSet{
            bindingLeague(arrayOfLeague,nil)
        }
    }
    
    var arrayOfLeagueByStrSport: [LeagueByStrSport]?{
        didSet{
            bindingLeagueByStrSport(arrayOfLeagueByStrSport,nil)
        }
    }
    
    var errorFromDataLeagueBySport: Error?{
        didSet{
            bindingLeagueByStrSport(nil,error)
        }
    }
    
    var error: Error?{
        didSet{
            bindingLeague(nil,error)
        }
    }
    
    
    var bindingLeague: ([League]?, Error?) -> Void = {_,_ in}
    
    var bindingLeagueByStrSport: ([LeagueByStrSport]?, Error?) -> Void = {_,_ in}
    
    
    var apiServices: ApiServices
    
    init(apiServices: ApiServices = NetworkManager()) {
        self.apiServices = apiServices
    }
    
    func fetchLeagueByStrSport(endPoint: String) {
        self.apiServices.fetchLeagueByStrSport(endPoint: endPoint) { (leagueByStrSport, error) in
            if let leagueByStrSportData = leagueByStrSport{
                self.arrayOfLeagueByStrSport = leagueByStrSportData
                
            }
            if let error = error{
                self.errorFromDataLeagueBySport = error
            }
            
        }
    }
    
    
    
    
    func fetchLeague(endPoint: String) {
        self.apiServices.fetchLeagues(endPoint: endPoint) { (league, error) in
            if let league = league{
                self.arrayOfLeague = league
            }
            if let error = error{
                self.error = error
            }
        }
    }
    
    
    
    
    func getNameLeague(appDelegate: AppDelegate,arr: [LeagueByStrSport]?) {
        
        if let arrOfLeague = arr{
            for league in arrOfLeague {
                
                DBManager.sharedInstance.add(appDelegate: appDelegate, nameLeague: league.strLeague, nameSport: league.strSport, imageSport: "strIamgeSport", strBadge: league.strBadge, strYoutube: league.strYoutube ?? "" )
            }
        }
        
        
        //print("arrayOfLeagueByStrSport \(arr ?? [])")
    }
}



