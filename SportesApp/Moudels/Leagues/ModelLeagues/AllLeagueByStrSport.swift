//
//  AllLeagueByStrSport.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/22/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//
//   let allLeagueByStrSport = try? newJSONDecoder().decode(AllLeagueByStrSport.self, from: jsonData)

import Foundation

// MARK: - AllLeagueByStrSport
struct AllLeagueByStrSport: Codable {
    let countries: [LeagueByStrSport]
}

//MARK: - LeagueByStrSport
struct LeagueByStrSport: Codable {
    var idLeague,strLeague,strSport,strCurrentSeason,strBadge: String
    var strYoutube,strTwitter,strInstagram,strFacebook :String?
}
