//
//  AllUrls.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/18/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation

class urlServices {
    
    var endPoint: String = ""
    var urlForAll: String {
        return "https://www.thesportsdb.com/api/v1/json/2/\(endPoint).php"
    }
    
    var urlForTeams: String{
        return "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=\(endPoint)"
    }
    
    var urlLeagueByStrSport: String{
        return "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=\(endPoint)"
    }
    
    var urlEventByIdLeague: String{
        return "https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=\(endPoint)"
    }
    
    var urlUpComing: String{
        return "https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=\(endPoint)"
    }
    
    init(endPoint: String) {
        self.endPoint = endPoint
    }
}

