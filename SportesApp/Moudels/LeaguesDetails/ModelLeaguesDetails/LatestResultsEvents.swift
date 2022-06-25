//
//  EventsLatestResults.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/22/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

//   let eventsLatestResults = try? newJSONDecoder().decode(EventsLatestResults.self, from: jsonData)


import Foundation

// MARK: - LatestResultsEvents
struct LatestResultsEvents: Codable {
    let events: [LatestResultsEvent]
}

struct LatestResultsEvent: Codable {
    var idEvent, strSport, idLeague, strLeague, strHomeTeam, strAwayTeam, intHomeScore,intAwayScore, strSeason: String
    
    let dateEvent, strTime, intRound: String
    
}
