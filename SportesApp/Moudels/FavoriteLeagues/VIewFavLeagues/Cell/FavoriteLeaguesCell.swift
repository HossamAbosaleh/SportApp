//
//  LeagueFavouriteCell.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/23/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit

class FavoriteLeaguesCell: UITableViewCell {

    
    @IBOutlet weak var imageFavoriteLeague: UIImageView!
    
    @IBOutlet weak var nameFavoriteLeagueLabel: UILabel!
    
    @IBOutlet weak var nameSportFavoriteLeagueLabel: UILabel!
    
    
    @IBOutlet weak var UnFavBtnOutlet: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func cellForFavLeague(nameLeague: String, nameSport: String, imageLeague: String){
        self.nameFavoriteLeagueLabel.text = nameLeague
        self.nameSportFavoriteLeagueLabel.text = nameSport
        self.imageFavoriteLeague.sd_setImage(with:URL(string: imageLeague) , placeholderImage: UIImage(named: "R2.png"))
    }
    
    
    @IBAction func removeFromFavorite(_ sender: UIButton) {
        
        print("you Remove this League")
    }
    
    @IBAction func goFavoriteLeagueYoutubeBtn(_ sender: UIButton) {
        
        print("Go You Tube")
    }

    
}
