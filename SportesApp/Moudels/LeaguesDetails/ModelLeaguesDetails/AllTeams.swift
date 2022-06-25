//
//  AllTeams.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/20/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.

//   let leagueTeams = try? newJSONDecoder().decode(LeagueTeams.self, from: jsonData)

import Foundation


// MARK: - LeagueTeams
struct LeagueTeams: Codable {
    let teams: [Team]
}

struct Team: Codable {
    let idTeam, idLeague, strTeam, strLeague, strSport, strTeamBadge: String
    let strTeamLogo, strStadium: String?
    let strWebsite, strFacebook, strTwitter,strInstagram, strYoutube: String?
    let strTeamJersey: String?
    let strStadiumDescription, strStadiumLocation, intStadiumCapacity, strDescriptionEN: String?
    
}


