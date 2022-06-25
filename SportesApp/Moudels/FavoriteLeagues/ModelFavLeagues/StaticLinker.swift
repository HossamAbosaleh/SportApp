//
//  StaticLinker.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/25/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import Foundation

class SingletonClass {
    var sharedInstance: SingletonClass {
          struct Static {
               static let instance = SingletonClass()
          }
          return Static.instance
     }
     var LeagueFavSingleton : [LeagueFavorite] = []
}
