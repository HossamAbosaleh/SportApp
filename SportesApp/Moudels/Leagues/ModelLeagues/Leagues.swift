//
//  Leagues.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/19/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

//   let leagues = try? newJSONDecoder().decode(Leagues.self, from: jsonData)

import Foundation

// MARK: - Leagues
struct Leagues: Codable {
    let leagues: [League]
}

// MARK: - League
struct League: Codable {
    var idLeague, strLeague, strSport: String
    let strLeagueAlternate: String?
}
