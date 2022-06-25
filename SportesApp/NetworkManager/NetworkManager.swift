//
//  NetworkManager.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/18/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager: ApiServices{
   
    
    
    
    //MARK: - Fetch UpComing
    
    func UpComingLeague(endPoint: String, completion: @escaping ([UpComingEvent]?, Error?) -> Void) {
          
           AF.request(urlServices(endPoint: endPoint).urlUpComing).response {eventDataResponse in
                 if let eventDataResponse = eventDataResponse.data{
                     var arrayOfEvent = [UpComingEvent]()
                     
                     let eventDataDecoded: UpComingEvents? = convertDataFromApi(data: eventDataResponse)
                     
                     arrayOfEvent = eventDataDecoded?.events ?? []
                     
                     completion(arrayOfEvent,nil)
                 }
                 if let error = eventDataResponse.error{
                     completion(nil,error)
                 }
             }
        
       }
    
        
    
    
    
    
    //MARK: - fetchEventByIdLeague
    
    
    func fetchEventByIdLeague(endPoint: String, completion: @escaping ([LatestResultsEvent]?, Error?) -> Void) {
        AF.request(urlServices(endPoint: endPoint).urlEventByIdLeague).response {eventDataResponse in
            if let eventDataResponse = eventDataResponse.data{
                var arrayOfEvent = [LatestResultsEvent]()
                
                let eventDataDecoded: LatestResultsEvents? = convertDataFromApi(data: eventDataResponse)
                
                arrayOfEvent = eventDataDecoded?.events ?? []
                
                completion(arrayOfEvent,nil)
            }
            if let error = eventDataResponse.error{
                completion(nil,error)
            }
        }
    }
    
    
     //MARK: - Fetch Teams
    
    func fetchTeam(endPoint: String, completion: @escaping ([Team]?, Error?) -> Void) {
        
           AF.request(urlServices(endPoint: endPoint).urlForTeams).response { dataResponse in
                 
                 if let dataTeam = dataResponse.data {
                     
                     var arrayOfTeam = [Team]()
                     
                     let arrayOfTeamDecoded: LeagueTeams? = convertDataFromApi(data: dataTeam)
                    arrayOfTeam = arrayOfTeamDecoded?.teams ?? []
                     
                     completion(arrayOfTeam,nil)
                     
                 }
                 if let error = dataResponse.error {
                     completion(nil,error)
                 }
             }
    }
    
    
    //MARK: - FetchLeagueByStrSport
    
    func fetchLeagueByStrSport(endPoint: String, completion: @escaping ([LeagueByStrSport]?, Error?) -> Void) {
        AF.request(urlServices(endPoint: endPoint).urlLeagueByStrSport).response { response in
            if let leagueByStrSportData = response.data{
                var arrayOfLeagueByStrSport = [LeagueByStrSport]()
                
                let arrayDecoded: AllLeagueByStrSport? = convertDataFromApi(data: leagueByStrSportData)
                arrayOfLeagueByStrSport = arrayDecoded?.countries ?? []
                
                completion(arrayOfLeagueByStrSport, nil)
            }
            if let error = response.error{
                completion(nil,error)
            }
        }
    }
    
    //MARK: - FetchLeagues
    
    func fetchLeagues(endPoint: String, completion: @escaping ([League]?, Error?) -> Void) {
        
        AF.request(urlServices(endPoint: endPoint).urlForAll).response { response in
            
            if let data = response.data {
                
                var arrayOfLeague = [League]()
                
                let arrayOfLeagueDecoded: Leagues? = convertDataFromApi(data: data)
                arrayOfLeague = arrayOfLeagueDecoded?.leagues ?? []
                
                completion(arrayOfLeague, nil)
            }
            if let error = response.error{
                completion(nil,error)
            }
        }
    }
    
    
    //MARK: - Fetch Sports
    func fetchSport(endpoint: String, completion: @escaping ([Sport]?, Error?) -> Void) {
        if let url = URL(string: urlServices(endPoint: endpoint).urlForAll){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    var arrayOfSport = [Sport]()
                    
                    let arrayDecoded : Sports? = convertDataFromApi(data: data)
                    arrayOfSport = arrayDecoded?.sports ?? []
                    
                    completion(arrayOfSport,nil)
                }
                if let error = error{
                    completion(nil,error)
                }
            }.resume()
        }
        
    }
    
    
}


enum EndPoint : String {
    case idLeague = "4328"
}
