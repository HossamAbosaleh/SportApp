//
//  ViewModelLeaguesDetails.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/20/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation

class ViewModelLeaguesDetails: LeagueDetailsProtocol{
    
    //MARK: - variable For UpComingEvents
    
    
       var arrayOfUpComingEvent: [UpComingEvent]?{
           didSet{
               bindingUpComingEvents(arrayOfUpComingEvent,nil)
           }
       }
       
       var errorForUpComingEvents: Error?{
           didSet{
               bindingEvents(nil,errorForUpComingEvents)
           }
       }
       
       var bindingUpComingEvents: ([UpComingEvent]?, Error?) -> Void = {_,_ in}
       
       
    
    //MARK: - variable For Events
    
    var arrayOfEventByIdLeague: [LatestResultsEvent]?{
        didSet{
            bindingEvents(arrayOfEventByIdLeague,nil)
        }
    }
    
    var errorForEvents: Error?{
        didSet{
            bindingEvents(nil,errorForEvents)
        }
    }
    
    var bindingEvents: ([LatestResultsEvent]?, Error?) -> Void = {_,_ in}
    
    
    
    //MARK: - variables For Teams
    var arrayOfTeam: [Team]?{
        didSet{
            bindingData(arrayOfTeam,nil)
        }
    }
    
    var error: Error?{
        didSet{
            bindingData(nil,error)
        }
    }
    
    var bindingData: ([Team]?,Error?) -> Void = {_,_ in }
    
    
    //MARK: - Fetch Data
    
    var apiServices:ApiServices
    
    init(apiServices:ApiServices = NetworkManager() ){
        self.apiServices = apiServices
    }
    
    
    func fetchTeam(endPoint: String) {
        self.apiServices.fetchTeam(endPoint: endPoint) { (dataTeam, error) in
            if let data = dataTeam {
                self.arrayOfTeam = data
            }
            if let error = error {
                self.error = error
            }
        }
    }
    
    func fetchEventsByIdLeague(endPoint: String) {
        self.apiServices.fetchEventByIdLeague(endPoint: endPoint) { (dataEventByIdLeague, error) in
            if let dataEvent = dataEventByIdLeague{
                self.arrayOfEventByIdLeague = dataEvent
            }
            if let error = error{
                self.errorForEvents = error
            }
        }
    }
    
    
    func fetchUpComingEvents(endPoint: String){
        self.apiServices.UpComingLeague(endPoint: endPoint) { (dataUpComingEvents, error) in
            if let dataUpComingEvents = dataUpComingEvents{
                self.arrayOfUpComingEvent = dataUpComingEvents
            }
            if let error = error{
                self.errorForUpComingEvents = error
            }
        }
    }
    
    
    func getImageHomeTeamInEvent(arrayOfTeam: [Team], arrayOfEvent: [LatestResultsEvent]) -> String {
        
        var imageHomeTeamInEvent: String = ""
        for  i in stride(from: 0, to: arrayOfTeam.count , by: 1){
            
            if arrayOfEvent[i].intHomeScore == arrayOfTeam[i].strTeam {
                imageHomeTeamInEvent = arrayOfTeam[i].strTeamBadge
            }
            
        }
        return imageHomeTeamInEvent
    }
    
    
    
    func getNameHomeTeam(array: [LatestResultsEvent]) -> [String]{
        
        var nameHomeTeam: [String] = []
        
        for  i in stride(from: 0, to: array.count  , by: 1){
            nameHomeTeam.append(array[i].strHomeTeam)
        }
        
       // print("\n\n teamDetails1: \(nameHomeTeam)")
        
        return nameHomeTeam
    }
    
    
    
    
    
    
    
    
    func makeEndPointTeamLeague(leagueName: String?) -> String {
        
        var endPointConvert: String = ""
        
        if let leagueName = leagueName {
            let newLeagueName = leagueName.replacingOccurrences(of:" ", with: "%20")
            endPointConvert = newLeagueName
        }
        
        return endPointConvert
    }
    
    
}


