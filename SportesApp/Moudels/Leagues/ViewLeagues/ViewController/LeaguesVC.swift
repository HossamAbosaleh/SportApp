//
//  LeaguesVC.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/19/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit

class LeaguesVC: UIViewController {
    
    @IBOutlet weak var leaguesTableView: UITableView!{
        
        didSet{
            leaguesTableView.delegate = self
            leaguesTableView.dataSource = self
            
        }
    }
    
    
    
    var arrayOfFavLeague  = [LeagueFavorite]()
    
    
    
    var arrayOfLeagueByStrSport = [LeagueByStrSport]()
    
    var sportName:Sport?
    
    var arrayOfLeagues = [League]()
    
    var arrLeagueOfSport = [String]()
    
    var arrOfNameLeague = [String]()
    
    var strSport: String?
                   
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let leaguesViewModel = LeaguesViewModel()
    
    var passDelegate: PassFavLeague?
    
    let idUpComming = ["4328","4328","4328","4328","4328","4328","4328","4328","4328","4328"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        if let  strSport = strSport {
            leaguesViewModel.fetchLeagueByStrSport(endPoint: strSport)
        }
        
        leaguesViewModel.bindingLeagueByStrSport = { leagueByStrSport, error in
            
            if let leagueByStrSport = leagueByStrSport {
                
                self.arrayOfLeagueByStrSport = leagueByStrSport
                
           //    self.leaguesViewModel.getNameLeague(appDelegate: self.appDelegate, arr: self.arrayOfLeagueByStrSport)
                
                DispatchQueue.main.async {
                    self.leaguesTableView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        leaguesViewModel.fetchLeague(endPoint: "all_leagues")
        leaguesViewModel.bindingLeague = { league , error in
            if let league = league {
                self.arrayOfLeagues = league
                DispatchQueue.main.async {
                    self.leaguesTableView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
}


extension LeaguesVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        for  i in stride(from: 0, to: arrayOfLeagues.count, by: 1){
            if sportName?.strSport == arrayOfLeagues[i].strSport{
                arrLeagueOfSport.append(arrayOfLeagues[i].strSport)
                arrOfNameLeague.append(arrayOfLeagues[i].strLeague)
                
            }
            
            
        }
        //return arrLeagueOfSport.count
        
        return arrayOfLeagueByStrSport.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leagueCell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
        
        //        leagueCell.configureCellImageSport(imageLeague: arrLeagueOfSport[indexPath.row])
        //
        // leagueCell.configureCell(nameLeague: arrOfNameLeague[indexPath.row], nameSportLeague: arrLeagueOfSport[indexPath.row])
        
        let leagueByStrSport  = arrayOfLeagueByStrSport[indexPath.row]
        
        
        leagueCell.setUrlDelegate = self
        
        leagueCell.fetchLeagueToFavDelegate = self
        //leagueCell.favBtnOutlet.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        leagueCell.configureCellImageLeague(strBadgeLeague: leagueByStrSport.strBadge)
        leagueCell.configureCell(nameLeague: leagueByStrSport.strLeague, nameSportLeague: leagueByStrSport.strSport)
        return leagueCell
    }
    
    
}

extension LeaguesVC : CellGotoYoutubeBtnDelegate{
       
    func goToYoutubeBtnTapped(cell: LeaguesTableViewCell) {
        
        guard (self.leaguesTableView.indexPath(for: cell) != nil) else {return}
        
        let webViewVc = storyboard?.instantiateViewController(withIdentifier: "YoutubeWebView") as? YoutubeWebView
        
        for league in self.arrayOfLeagueByStrSport {
            if league.strLeague == cell.nameLeague.text {
                if let strYoutube = league.strYoutube{
                    webViewVc?.linkString = strYoutube
                    self.navigationController?.pushViewController(webViewVc!, animated: true)
                }
                
            }
        }
    }
}

extension LeaguesVC: FetchLeagueForFav{

       
         func fetchLeagueToFav(league: LeagueFavorite) {
             arrayOfFavLeague.append(league)
            
             print(arrayOfFavLeague.count)
            
            
            
//            singleTon.LeagueFavSingleton = arrayOfFavLeague
//
//            print(singleTon.sharedInstance.LeagueFavSingleton)
//
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavoriteLeaguesVC") as? FavoriteLeaguesVC {
                viewController.arrayOfFavLeague = arrayOfFavLeague
                
                
                if let navigator = navigationController {

                       navigator.pushViewController(viewController, animated: true)

                    //tabBarController!.selectedIndex = 1
                   }
                
//                present(viewController, animated: true, completion: nil)
               }


//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc: ViewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
//
//            let navViewController = myTabBar.selectedViewController as? UINavigationController
//            navViewController?.pushViewController(vc, animated: true)
            
//            self.navigationController?.pushViewController(tabBar, animated: true)
//            // when you want to open first index
//              tabBar.selectedIndex = 0
//              // when you want to open second index
//              tabBar.selectedIndex = 1
            
//            passDelegate?.passFav(favLeague: arrayOfFavLeague)
//            print(arrayOfFavLeague)
                    
         }
        
    
    
}

extension LeaguesVC: UITableViewDelegate{
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       // "goToInsta"
        
        if segue.identifier == "goToDetailsVC"{
            if let indexPath = leaguesTableView.indexPathForSelectedRow {
                
                let destVC = segue.destination as! LeaguesDetailsVC
                
                destVC.leagueName = arrOfNameLeague[indexPath.row]
                destVC.leagueId = arrayOfLeagues[indexPath.row].idLeague
                destVC.leagueByStrSportName = arrayOfLeagueByStrSport[indexPath.row].strLeague
                destVC.idLeagueByStrSport = arrayOfLeagueByStrSport[indexPath.row].idLeague
                
                destVC.idUpcomingEventLeague =  idUpComming[indexPath.row]
                
                
            }
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsVC") as! LeaguesDetailsVC
//
//            vc.idUpcomingEventLeague = idUpComming[indexPath.row]
//
//            self.navigationController?.pushViewController(vc, animated: true)
//
//
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 111
    }
}

