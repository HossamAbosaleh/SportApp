//
//  LeaguesDetalisVC.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/20/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit

class LeaguesDetailsVC: UIViewController {
    
    @IBOutlet weak var allTeamsCV: UICollectionView!{
        didSet{
            allTeamsCV.delegate = self
            allTeamsCV.dataSource = self
        }
    }
    
    
    @IBOutlet weak var LatestResultsCV: UICollectionView!{
        didSet{
            LatestResultsCV.delegate = self
            LatestResultsCV.dataSource = self
        }
    }
    
    
    @IBOutlet weak var upComingEventCV: UICollectionView!{
        didSet{
            upComingEventCV.dataSource = self
            upComingEventCV.delegate = self
        }
    }
    
    
    
    
    var arrayOfEvent = [LatestResultsEvent]()
    var arrayOfTeam = [Team]()
    
    var arrayOfUpComingEvent = [UpComingEvent]()
    
    
    var teamDetails: Team?
    
    var leagueName: String?
    var leagueByStrSportName: String?
    var leagueId: String?
    var idLeagueByStrSport:String?
    
    var imageHomeTeam: [String]?
    
    var imageAwayTeam: String?
    
    
    
    let viewModelLeagueDetails = ViewModelLeaguesDetails()
    
    var idUpcomingEventLeague: String?
    
    var indexOfImage = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - FetchUpComingEvent
        
        
        if let idLeagueByStrSport = idLeagueByStrSport {
            viewModelLeagueDetails.fetchUpComingEvents(endPoint: idLeagueByStrSport)
        }
        
        
        
        viewModelLeagueDetails.bindingUpComingEvents = {dataEvent, error in
            if let dataEvent = dataEvent{
                self.arrayOfUpComingEvent = dataEvent
                
                //print("\n \n teamDetailsFotLastResult: \(self.arrayOfEvent[0].strHomeTeam) \n \n")
                DispatchQueue.main.async {
                    self.upComingEventCV.reloadData()
                }
            }
            if let error = error{
                print(error.localizedDescription)
            }
        }
        
        
        
        
        
        //MARK: - FetchEventData
        if let idLeagueByStrSport = idLeagueByStrSport {
            viewModelLeagueDetails.fetchEventsByIdLeague(endPoint: idLeagueByStrSport)
        }
        
        //        if let leagueId = leagueId {
        //            viewModelLeagueDetails.fetchEventsByIdLeague(endPoint: leagueId)
        //        }
        viewModelLeagueDetails.bindingEvents = {dataEvent, error in
            if let dataEvent = dataEvent{
                self.arrayOfEvent = dataEvent
                
                //print("\n \n teamDetailsFotLastResult: \(self.arrayOfEvent[0].strHomeTeam) \n \n")
                DispatchQueue.main.async {
                    self.LatestResultsCV.reloadData()
                }
            }
            if let error = error{
                print(error.localizedDescription)
            }
        }
        
        
        
        
        
        //MARK: - FetchTeamLeagueByStrSport
        let leagueNameConvert = viewModelLeagueDetails.makeEndPointTeamLeague(leagueName: leagueName)
        
        let leagueByStrSportNameConvert = viewModelLeagueDetails.makeEndPointTeamLeague(leagueName: leagueByStrSportName)
        
        viewModelLeagueDetails.fetchTeam(endPoint: leagueByStrSportNameConvert)
        
        viewModelLeagueDetails.bindingData = { dataTeam , error in
            if let team = dataTeam {
                self.arrayOfTeam = team
                
                DispatchQueue.main.async {
                    self.allTeamsCV.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //if let id  = idUpcomingEventLeague {
        
        
    }
    
}

extension LeaguesDetailsVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == upComingEventCV{
            
            
            return arrayOfUpComingEvent.count
        }
        
        if collectionView == LatestResultsCV{
            return arrayOfEvent.count
        }
        
        return arrayOfTeam.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == upComingEventCV{
            
            
            let upComingEventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpComingEventCell", for: indexPath) as! UpComingEventCell
            
            let upComingDetails = arrayOfUpComingEvent[indexPath.row]
            
            
            
            //print("\n \n teamDetailsFotUpComing: \(self.arrayOfUpComingEvent[0].strHomeTeam) \n \n")
            upComingEventCell.configCellUpComingEvent(nameHomeTeam: upComingDetails.strHomeTeam, nameAwayTeam: upComingDetails.strAwayTeam, dateEvent: upComingDetails.dateEvent, timeEvent: upComingDetails.strTime, roundEvent: upComingDetails.intRound)
            
            return upComingEventCell
        }
        
        
        if collectionView == LatestResultsCV{
            let latestResultsCell = LatestResultsCV.dequeueReusableCell(withReuseIdentifier: "LatestResultsCVCell", for: indexPath) as! LatestResultsCVCell
            
            let eventDetails = arrayOfEvent[indexPath.row]
            
            for i in arrayOfTeam{
                
                if i.strTeam == arrayOfEvent[indexPath.row].strAwayTeam  {
                    print("teamDetails: \(eventDetails.strAwayTeam )")
                    latestResultsCell.configureLatestResultCellForImageAwayTeam(imageAwayTeam: i.strTeamBadge)
                }
            }
            
            for nameTeam in arrayOfTeam{
                if nameTeam.strTeam == eventDetails.strHomeTeam {
                    latestResultsCell.configureLatestResultCellForImageHomeTeam(imageHomeTeam: nameTeam.strTeamBadge)
                }
            }
            
            latestResultsCell.configureLatestResultCellForHomeTeam(nameHomeTeam: eventDetails.strHomeTeam, scoreHomeTeam: eventDetails.intHomeScore)
            
            latestResultsCell.configureLatestResultCellForAwayTeam(nameAwayTeam: eventDetails.strAwayTeam, scoreAwayTeam: eventDetails.intAwayScore)
            
            latestResultsCell.configureLatestResultCell(dateEvent: eventDetails.dateEvent, timeEvent: eventDetails.strTime, numberOfRound: eventDetails.intRound)
            
            return latestResultsCell
        }
        
        
        
        
        let teamCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllTeamsCVCell", for: indexPath) as! AllTeamsCVCell
        
        if collectionView == allTeamsCV{
            teamCell.imageTeam.tag = indexPath.item
           // indexOfImage =  teamCell.imageTeam.tag
            print("index path = \(indexOfImage)")
        }
        
//        teamCell.imageTeam.isUserInteractionEnabled = true
//
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:index:)))
//        tapGestureRecognizer.numberOfTapsRequired = 1
//        teamCell.addGestureRecognizer(tapGestureRecognizer)
//
        
        teamCell.configureCell(imageSport: arrayOfTeam[indexPath.row].strTeamBadge, nameSport: arrayOfTeam[indexPath.row].strTeam)
        
        print("array of team: \(arrayOfTeam[indexPath.row].intStadiumCapacity ?? "")")
        return teamCell
    }
    
    
    
    /*@objc*/ func imageTapped(tapGestureRecognizer: UITapGestureRecognizer,index:Int)
    {
        
        let tappedImage = tapGestureRecognizer.view as? UIImageView
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TeamDeatailsVC") as? TeamDeatailsVC {
            
            tappedImage?.tag = index
            
            viewController.team = arrayOfTeam[index]
            
            if let navigator = navigationController {
                
                navigator.pushViewController(viewController, animated: true)
                
            }
            
        }
        
        print("TappedImage")
        
        // "goToInsta"
        
    }
}

extension LeaguesDetailsVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == allTeamsCV{
            print("indexPdth of teams \(indexPath.item)")
            indexOfImage = indexPath.item
            imageTapped(tapGestureRecognizer: UITapGestureRecognizer(), index: indexPath.item)
        }
        
    }
}
