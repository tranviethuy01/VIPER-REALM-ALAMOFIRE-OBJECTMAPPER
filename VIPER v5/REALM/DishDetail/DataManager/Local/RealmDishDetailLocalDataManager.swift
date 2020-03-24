//
//  RealmLocalDataManager.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

class RealmDishDetailLocalDataManager:  RealmDishDetailLocalDataManagerProtocol {
    func initDishDetail(id: Int) -> RealmDishModel? {
        //do sth here
        let realm = try! Realm()
        return realm.object(ofType: RealmDishModel.self, forPrimaryKey: id)
                //trả về phần tử đầu tiên
        //        return realm.objects(RealmDishModel.self).filter("code = %@", id).first
        //return nil
    }
    

   
}
