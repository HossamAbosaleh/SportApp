//
//  TeamDeatailsVC.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/25/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit

class TeamDeatailsVC: UIViewController {

    @IBOutlet weak var backgroundImage: UIView!
    
    @IBOutlet weak var imageTeam: UIImageView!
    
    
    @IBOutlet weak var nameTeam: UILabel!
    
    
    @IBOutlet weak var leagueTeam: UILabel!
    
    @IBOutlet weak var steadiumName: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var descriptionStadium: UILabel!
    
    @IBOutlet weak var locationStadium: UILabel!
    
    @IBOutlet weak var capacityStadium: UILabel!
    
    
    var arrarOfTeam = [Team]()
    
    var team : Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.makeCorners(radius: 0)
        
        backgroundImage.layer.cornerRadius = backgroundImage.frame.size.width/2
        backgroundImage.clipsToBounds = true

        backgroundImage.layer.borderColor = #colorLiteral(red: 0.1745036244, green: 0.2412752509, blue: 0.3131071031, alpha: 1)
        backgroundImage.layer.borderWidth = 5.0
        
        nameTeam.text = team?.strTeam
        
        leagueTeam.text = team?.strLeague
        
        descriptionLabel.text = team?.strDescriptionEN
        
        steadiumName.text = team?.strStadium
        
        descriptionStadium.text = team?.strStadiumDescription
        
        locationStadium.text = team?.strStadiumLocation
        
        capacityStadium.text = team?.intStadiumCapacity

        let imgStr = team?.strTeamBadge ?? ""
        
        self.imageTeam.sd_setImage(with:URL(string: imgStr) , placeholderImage: UIImage(named: "R2.png"))
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
