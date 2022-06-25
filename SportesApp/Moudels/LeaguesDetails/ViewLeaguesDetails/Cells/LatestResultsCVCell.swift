//
//  LatestResultsCVCell.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/22/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit

class LatestResultsCVCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundCellView: UIView!
    
    @IBOutlet weak var imageHomeTeam: UIImageView!
    
    @IBOutlet weak var nameHomeTeamLabel: UILabel!
    
    @IBOutlet weak var scoreHomeTeamLabel: UILabel!
    
    @IBOutlet weak var imageAwayTeam: UIImageView!
    
    @IBOutlet weak var nameAwayTeamLabel: UILabel!
    
    @IBOutlet weak var scoreAwayTeamLabel: UILabel!
       
    @IBOutlet weak var dataEventLabel: UILabel!
    
    @IBOutlet weak var timeEventLabel: UILabel!
    
    @IBOutlet weak var numberOfRoundLabel: UILabel!
    
    
    func configureLatestResultCellForImageHomeTeam(imageHomeTeam: String) {
        
        self.imageHomeTeam.sd_setImage(with: URL(string:imageHomeTeam ), placeholderImage: UIImage(named: "R2.png"))
    }
    
    func configureLatestResultCellForImageAwayTeam(imageAwayTeam: String) {
        
        self.imageAwayTeam.sd_setImage(with: URL(string:imageAwayTeam ), placeholderImage: UIImage(named: "R2.png"))
        
    }
    
    func configureLatestResultCellForHomeTeam(nameHomeTeam: String, scoreHomeTeam: String) {
         
        
        self.nameHomeTeamLabel.text = nameHomeTeam
        
        self.scoreHomeTeamLabel.text = scoreHomeTeam
    
    }
    
    func configureLatestResultCellForAwayTeam(nameAwayTeam: String, scoreAwayTeam: String) {
         
        
        self.nameAwayTeamLabel.text = nameAwayTeam
        
        self.scoreAwayTeamLabel.text = scoreAwayTeam
    
    }
    
    func configureLatestResultCell(dateEvent:String, timeEvent:String, numberOfRound:String){
        self.dataEventLabel.text = dateEvent
        self.timeEventLabel.text = timeEvent
        self.numberOfRoundLabel.text = numberOfRound
    
        self.backgroundCellView.makeCorners(radius: 15 )
        //self.backgroundCellView.dropShadow1(color: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), opacity: 9, offSet: CGSize(width: -2, height: 2), radius: 5, scale: true)
        
    }
    
    
}


