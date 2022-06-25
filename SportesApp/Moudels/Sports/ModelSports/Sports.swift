//
//  Sportes.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/18/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.


//  let sports = try? newJSONDecoder().decode(Sports.self, from: jsonData)


import Foundation

// MARK: - Sports

struct Sports: Codable {
    let sports: [Sport]
}

// MARK: - Sport

struct Sport: Codable {
    let idSport, strSport: String
    let strFormat: StrFormat
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}

enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}

