//
//  UpComingEventCell.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/25/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit

class UpComingEventCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundCell: UIView!
    
    @IBOutlet weak var dateEventLabel: UILabel!
    
    @IBOutlet weak var roundEventLabel: UILabel!
    
    @IBOutlet weak var timeEventLabel: UILabel!
    
    @IBOutlet weak var viewNameHomeTeam: UIView!
    
    @IBOutlet weak var nameHomeTeamLabel: UILabel!
    
    @IBOutlet weak var viewNameAwayTeam: UIView!
    
    @IBOutlet weak var nameAwayTeamLabel: UILabel!
    
    
    func configCellUpComingEvent(nameHomeTeam: String, nameAwayTeam:String, dateEvent:String, timeEvent: String, roundEvent:String) {
        
        self.backgroundCell.makeCorners(radius: 15)
        
        self.viewNameHomeTeam.backgroundColor = UIColor.clear
        
        self.viewNameAwayTeam .backgroundColor = UIColor.clear
        
        self.nameHomeTeamLabel.text = nameHomeTeam
        self.nameAwayTeamLabel.text = nameAwayTeam
        self.dateEventLabel.text = dateEvent
        self.timeEventLabel.text = timeEvent
        self.roundEventLabel.text = roundEvent
        
    
    }
    
    
}
