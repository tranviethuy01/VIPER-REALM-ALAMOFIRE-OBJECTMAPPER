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

@objcMembers class RealmDishModel: Object , Mappable {
    required convenience init?(map: Map) {
        //do sth
        self.init()
        id <- map["id"]
    }
    
    @objc dynamic var id: Int = 0
    @objc dynamic var title : String?
    @objc dynamic var shopName : String?
    @objc dynamic var avatar : String?
    @objc dynamic var address : String?
    
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["dishname"]
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
