//
//  DBManager.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/21/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation
import CoreData

class DBManager{
    static let sharedInstance = DBManager()
    private init(){}
}

extension DBManager{
    func add(appDelegate: AppDelegate,nameLeague strLeague: String, nameSport strSport: String, imageSport strSportThumb: String, strBadge:String, strYoutube: String ){
        
        let manageContext = appDelegate.persistentContainer.viewContext
        
        if let entity = NSEntityDescription.entity(forEntityName: "LeaguesFav", in: manageContext){
            let league = NSManagedObject(entity: entity, insertInto: manageContext)
            league.setValue(strLeague, forKey: "strLeague")
            league.setValue(strSport, forKey: "strSport")
            league.setValue(strSportThumb, forKey: "strSportThumb")
            league.setValue(strBadge, forKey: "strBadge")
            league.setValue(strYoutube, forKey: "strYoutube")
            
            do {
                try manageContext.save()
            }catch let error as NSError {
                print("Error in saving")
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchMovies(appDelegate: AppDelegate) -> [LeaguesFav]{
        
        var fetchLeagues: [LeaguesFav] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeaguesFav")
        
//        let predicate = NSPredicate(format: "favLeagueFromData StrLeague: == %@", "")
//        fetchRequest.predicate = predicate
        
        do{
            fetchLeagues = try managedContext.fetch(fetchRequest) as! [LeaguesFav]
        }catch let error as NSError {
            print("Error in saving")
            print(error.localizedDescription)
        }

        return fetchLeagues
    }
}


