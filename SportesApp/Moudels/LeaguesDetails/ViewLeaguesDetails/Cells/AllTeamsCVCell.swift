//
//  AllTeamsCVCell.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/21/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit

class AllTeamsCVCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundCellTeam: UIView!
    
    @IBOutlet weak var imageTeam: UIImageView!
    @IBOutlet weak var nameTeam: UILabel!
    
    
    func configureCell(imageSport: String, nameSport: String) {
        self.imageTeam.sd_setImage(with: URL(string:imageSport ), placeholderImage: UIImage(named: "R2.png"))
        self.nameTeam.text = nameSport
        
        self.backgroundCellTeam.makeCorners(radius: 15)
        
    }
    
}
