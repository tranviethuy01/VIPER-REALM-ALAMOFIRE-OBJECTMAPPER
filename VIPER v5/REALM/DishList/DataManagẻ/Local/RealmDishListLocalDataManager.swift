//
//  RealmDishListLocalDataManager.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift

class RealmDishListLocalDataManager: RealmDishListLocalDataManagerProtocol {
    func initDishList(id: Int) -> Results<RealmDishModel> {
        //do sth here        
        let realm = try! Realm()        
        return realm.objects(RealmDishModel.self)
        
    }
    

}
