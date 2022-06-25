//
//  ApiServices.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/18/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation

protocol ApiServices {

    func fetchSport(endpoint: String, completion: @escaping ([Sport]? , Error?) -> Void)
    
    func fetchLeagues(endPoint: String, completion: @escaping ([League]?, Error?) -> Void)
    
    func fetchLeagueByStrSport(endPoint: String, completion: @escaping ([LeagueByStrSport]?, Error?) -> Void )
    
    func fetchTeam(endPoint: String, completion: @escaping ([Team]?,Error?) -> Void )
    
    func fetchEventByIdLeague(endPoint: String, completion: @escaping ([LatestResultsEvent]?, Error?) -> Void)
    
    func UpComingLeague(endPoint: String, completion: @escaping ([UpComingEvent]?, Error?) -> Void)
}
