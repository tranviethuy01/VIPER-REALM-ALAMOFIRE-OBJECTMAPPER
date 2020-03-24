//
//  ObjectMapperDish2.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/23/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import ObjectMapper
class ObjectMapperDish2: Mappable {
    var id : String?
    var title : String?
    var shopName : String?
    var address : String?
    var avatar : String?
    
    required init?(map: Map) {
        //do sth
        
    }
    
    func mapping(map: Map) {
        //
        id <- map["data.id"]
        title <- map["data.name"]
        shopName <- map["data.shopname"]
        address <- map["data.address"]
        avatar <- map["data.avatar"]
    }
}
