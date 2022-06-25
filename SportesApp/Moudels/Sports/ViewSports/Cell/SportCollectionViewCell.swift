//
//  SportCollectionViewCell.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/18/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit
import SDWebImage

class SportCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundCell: UIView!
    
    @IBOutlet weak var imageSport: UIImageView!
    
    @IBOutlet weak var nameSport: UILabel!
    
    
    func configureCell(imageSport: String, nameSport: String) {
        self.imageSport.sd_setImage(with: URL(string:imageSport ), placeholderImage: UIImage(named: "R2.png"))
        self.nameSport.text = nameSport
        
        self.backgroundCell.makeCorners(radius: 25.5)
        
    }
    
    
}



extension UIView {
    func makeCorners(radius: CGFloat)   {
        self.layer.cornerRadius = radius
        self.clipsToBounds  =  true
    }
    
    
    func dropShadow1(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}
