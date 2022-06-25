//
//  LeagueFavouriteVC.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/23/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit

class FavoriteLeaguesVC: UIViewController {
    
    
    @IBOutlet weak var favoriteLeaguesTableV: UITableView!{
        didSet{
            favoriteLeaguesTableV.dataSource = self
            favoriteLeaguesTableV.delegate = self
        }
    }
    
    
    var arrayOfFavLeague: [LeagueFavorite]  = []
    var leguefav : String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(leguefav)
        
        
        favoriteLeaguesTableV.reloadData()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        favoriteLeaguesTableV.reloadData()
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
        
        return arrayOfFavLeague.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        
        let favoriteLeagueCell = tableView.dequeueReusableCell(withIdentifier: "FavoriteLeaguesCell", for: indexPath) as! FavoriteLeaguesCell
        
        print(arrayOfFavLeague)
        
        
        let favLeagueDetails = arrayOfFavLeague[indexPath.row]
        
        favoriteLeagueCell.cellForFavLeague(nameLeague: favLeagueDetails.strLeague ?? "", nameSport: favLeagueDetails.strSport ?? "", imageLeague: favLeagueDetails.strBadge ?? "")
        
        return favoriteLeagueCell
    }
    
    
}

extension FavoriteLeaguesVC: UITableViewDelegate{
    
}

extension FavoriteLeaguesVC: UITabBarDelegate{
    
    

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
