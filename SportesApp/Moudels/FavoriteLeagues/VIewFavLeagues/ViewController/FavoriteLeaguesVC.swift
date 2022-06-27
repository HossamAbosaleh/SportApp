//
//  LeagueFavouriteVC.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/23/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit

import CoreData

class FavoriteLeaguesVC: UIViewController {
    
    
    @IBOutlet weak var favoriteLeaguesTableV: UITableView!{
        didSet{
            favoriteLeaguesTableV.dataSource = self
            favoriteLeaguesTableV.delegate = self
            favoriteLeaguesTableV.reloadData()
        }
    }
    
    
    var arrayOfFavLeague: [LeagueFavorite]  = []
    
    var favLeagueFromData: [LeaguesFav] = []
    
    var leguefav : String = ""
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //favoriteLeaguesTableV.reloadData()
        
        favLeagueFromData =  DBManager.sharedInstance.fetchLeague(appDelegate: appDelegate)
        
        print(leguefav)
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // favoriteLeaguesTableV.reloadData()
        
    }
    
    
    @IBAction func addFavoriteLeagueBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "LeaguesVC") as! LeaguesVC
        //   vc.passDelegate = self
        present(vc, animated: true, completion: nil)
        //self.navigationController?.pushViewController(vc, animated: true)
        
    }
}





extension FavoriteLeaguesVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favLeagueFromData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        
        let favoriteLeagueCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteLeaguesCell", for: indexPath) as! FavoriteLeaguesCell
        
        print(" fav league: \(favLeagueFromData)")
        
        
        let favLeagueDetails = favLeagueFromData[indexPath.row]
        
        favoriteLeagueCell.cellForFavLeague(nameLeague: favLeagueDetails.strLeague ?? "", nameSport: favLeagueDetails.strSport ?? "", imageLeague: favLeagueDetails.strBadge ?? "")
        
        favoriteLeagueCell.UnFavBtnOutlet.tag = indexPath.row
        
        favoriteLeagueCell.UnFavBtnOutlet.addTarget(self, action: #selector(removeLeagueFromFav(sender:)), for: .touchUpInside)
        
        return favoriteLeagueCell
    }
    
    @objc func removeLeagueFromFav(sender: UIButton){
        
        sender.setImage(UIImage(named: "touch.png"), for: .normal)
        
         DBManager.sharedInstance.deleteLeague(appDelegate: appDelegate, itemIndex: sender.tag)
        
        self.favoriteLeaguesTableV.reloadData()
    }
    
}




extension FavoriteLeaguesVC: UITableViewDelegate{
    
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
              // Delete the row from the data
//favoriteLeaguesTableV.beginUpdates()
           // arrayOfFavLeague.remove(at: indexPath.row)
              DBManager.sharedInstance.deleteLeague(appDelegate: appDelegate, itemIndex: indexPath.row)
              // Delete the row from the table itself
              favoriteLeaguesTableV.deleteRows(at: [indexPath], with: .fade)
            //favoriteLeaguesTableV.endUpdates()
          }
      }
    
    
    
//
//   func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
//    {
//         return true
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
//    {
//        if editingStyle == .delete
//        {
//            self.favoriteLeaguesTableV.beginUpdates()
//            DBManager.sharedInstance.deleteLeague(appDelegate: appDelegate, itemIndex: indexPath.row)
//
//            self.favoriteLeaguesTableV.deleteRows(at: [IndexPath](), with: .fade)
//         //   arrayOfFavLeague.remove(at: indexPath.row)
//            self.favoriteLeaguesTableV.endUpdates()
//        }
//    }
 
}

extension FavoriteLeaguesVC: UITabBarDelegate{
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag{
        case 1: //code here
            
            self.favoriteLeaguesTableV.reloadData()
            
        default: break
        }
    }
    
    
}

//
//extension FavoriteLeaguesVC: PassFavLeague{
//
//    func passFav(favLeague: [LeagueFavorite]) {
//        arrayOfFavLeague = favLeague
//
//        print("arrayOfLeague\(arrayOfFavLeague)")
//    }
//
//
//}
//
//extension FavoriteLeaguesVC: FetchLeagueForFav {
//
//    func fetchLeagueToFav(league: LeagueFavorite) {
//        arrayOfFavLeague.append(league)
//        print("LeagueName \(arrayOfFavLeague[0].strLeague)")
//        print(arrayOfFavLeague.count)
//        self.favoriteLeaguesTableV.reloadData()
//
//    }
//
//}
