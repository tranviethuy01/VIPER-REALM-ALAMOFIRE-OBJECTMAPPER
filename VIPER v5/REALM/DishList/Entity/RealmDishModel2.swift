//
//  RealmDish.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
import ObjectMapper
//class RealmDishModel: NSObject {
//
//    //model sử dụng Realm
//
//}

@objcMembers class RealmDishModel2: Object , Mappable {
    required convenience init?(map: Map) {
        //do sth
        self.init()
        id <- map["id"]
    }
  
    
    var id: String?
    var title : String?
    var shopName : String?
    var avatar : String?
    var address : String?
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["name"]
        shopName <- map["shopname"]
        avatar <- map["avatar"]
        address <- map["address"]
        
    }
    
    //realm
    override class func primaryKey() -> String? {
        return "id"
    }
        
}

extension RealmDishModel {

}
