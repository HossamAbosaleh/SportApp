//
//  LeagueDeatailsProtocol.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/21/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation

protocol LeagueDetailsProtocol {
    func fetchTeam(endPoint:String)
    func fetchEventsByIdLeague(endPoint: String)
    func fetchUpComingEvents(endPoint: String)
}
 
