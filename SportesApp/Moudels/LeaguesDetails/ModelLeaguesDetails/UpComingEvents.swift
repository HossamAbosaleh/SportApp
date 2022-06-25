//
//  UpComingEvents.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/25/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation

// MARK: - UpComingEvents
struct UpComingEvents: Codable {
    let events: [UpComingEvent]
}

struct UpComingEvent: Codable {
    var idEvent, strSport, idLeague, strLeague, strHomeTeam, strAwayTeam, intHomeScore,intAwayScore, strSeason: String
    
    let dateEvent, strTime, intRound: String
    
}


