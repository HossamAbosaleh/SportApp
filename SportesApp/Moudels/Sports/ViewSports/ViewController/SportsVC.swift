//
//  ViewController.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/18/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit

class SportsVC: UIViewController {
    
    @IBOutlet weak var sportsCollectionView: UICollectionView!{
        didSet{
            sportsCollectionView.delegate = self
            sportsCollectionView.dataSource = self
        }
    }
    
    var arrayOfSport = [Sport]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let sportsViewModel = SportsViewModel()
        
        sportsViewModel.fetchSport(endPoint: "all_sports")
        sportsViewModel.bindingSportData = {sports, error in
            if let sports = sports {
                self.arrayOfSport = sports
                
                // print(self.arrayOfSport[0].strSport )
                
                DispatchQueue.main.async {
                    self.sportsCollectionView.reloadData()
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    
}

extension SportsVC: UICollectionViewDataSource{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfSport.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCollectionViewCell", for: indexPath) as! SportCollectionViewCell
        
        cell.configureCell(imageSport: arrayOfSport[indexPath.row].strSportIconGreen, nameSport: arrayOfSport[indexPath.row].strSport)
        
        return cell
    }
    
    
}

extension SportsVC : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    // UICollectionViewDelegateFlowLayout Delegate method
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "LeaguesVC") as! LeaguesVC
        
        vc.sportName = arrayOfSport[indexPath.row]
        
        vc.strSport = arrayOfSport[indexPath.row].strSport
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let leftAndRightPaddings: CGFloat = 10
        let numberOfItemsPerRow: CGFloat = 2.0
        
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width) // You can change width and height here as pr your requirement
        
    }
}





