//
//  LeaguesTableViewCell.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/19/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit





class LeaguesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    
    @IBOutlet weak var imageLeague: UIImageView!
    
    @IBOutlet weak var nameLeague: UILabel!
    
    @IBOutlet weak var nameSportLeague: UILabel!
    
    @IBOutlet weak var favBtnOutlet: UIButton!
    
    var btnSelected = true
    
    var favLeagueFromData: [LeaguesFav] = []
    
    var setUrlDelegate: CellGotoYoutubeBtnDelegate?
    
    var fetchLeagueToFavDelegate: FetchLeagueForFav?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var arrayOfLeague = [LeagueByStrSport]()
    
    
    let leaguesViewModel = LeaguesViewModel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.setUrlDelegate = nil
        self.fetchLeagueToFavDelegate = nil
    }
    
    
    func configureCellImageSport(imageLeague: String) {
        
        var imagestr:String{
            let sportName = imageLeague
            let freedSpaceSportName = sportName.filter {!$0.isWhitespace}
            return "https://www.thesportsdb.com/images/icons/sports/\(freedSpaceSportName).png"
        }
        self.imageLeague.sd_setImage(with: URL(string:imagestr ), placeholderImage: UIImage(named: "R2.png"))
    }
    func configureCell(nameLeague: String, nameSportLeague: String) {
        
        self.nameLeague.text = nameLeague
        self.nameSportLeague.text = nameSportLeague
        self.viewCell.makeCorners(radius: 20)
    }
    
    func configureCellImageLeague(strBadgeLeague: String){
        self.imageLeague.sd_setImage(with: URL(string:strBadgeLeague ), placeholderImage: UIImage(named: "R2.png"))
    }
    
    
    
    
    @IBAction func goToYoutubeBtn(_ sender: Any) {
        
        self.setUrlDelegate?.goToYoutubeBtnTapped(cell: self)
     
        print("Go YouTube: \\() ?? )")
    }
    
    
    
    
    @IBAction func favLeagueBtn(_ sender: Any) {
        
        func convertImageToBase64String (img: UIImage) -> String {
            return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
        }
        
        let imageStr = convertImageToBase64String(img: imageLeague.image!)
        
        btnSelected = !btnSelected
        if btnSelected == true {
            favBtnOutlet.setImage(UIImage(named: "touch.png"), for: .normal)
        } else {
            
            favBtnOutlet.setImage(UIImage(named: "touched.png"), for: .normal)
            
            favLeagueFromData = DBManager.sharedInstance.fetchMovies(appDelegate: appDelegate)
                       for league in favLeagueFromData {
                           if league.strLeague == nameLeague.text {
                            arrayOfLeague = leaguesViewModel.arrayOfLeagueByStrSport ?? []
                            print("\n favLeagueFromData StrLeague from array og league: \(arrayOfLeague)")
                            print("\n favLeagueFromData StrLeague: \(league.strLeague ?? "H")")
                               print("\n favLeagueFromData strYoutube: \(league.strYoutube ?? "H")")
                            let leagueFavorite = LeagueFavorite(strBadge: league.strBadge ?? "", strLeague: league.strLeague ?? "", strSport: league.strSport ?? "", strSportThumb: league.strSportThumb ?? "", strYoutube: league.strYoutube ?? "")
                            self.fetchLeagueToFavDelegate?.fetchLeagueToFav(league: leagueFavorite)

                            
                           }
                       }
            
            //
            
            //            DBManager.sharedInstance.add(appDelegate: appDelegate, nameLeague: nameLeague.text ?? "NameLeague", nameSport: nameSportLeague.text ?? "NameSportLeague", imageSport: "imageSportLegie", strBadge: imageStr, strYoutube: "")
            
           
            //    print("\n favLeagueFromData StrLeague: \(favLeagueFromData[0].strLeague ?? "H")")
            //   print("\n favLeagueFromData StrLeague: \(nameLeague.text ?? "Hosam")")
            
        }
    }
    
}


