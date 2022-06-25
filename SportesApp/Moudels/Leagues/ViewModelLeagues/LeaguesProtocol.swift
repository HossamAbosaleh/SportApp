//
//  LeaguesProtocol.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/19/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation

protocol LeaguesProtocol {
    func fetchLeague(endPoint:String)
    func fetchLeagueByStrSport(endPoint: String)
}
