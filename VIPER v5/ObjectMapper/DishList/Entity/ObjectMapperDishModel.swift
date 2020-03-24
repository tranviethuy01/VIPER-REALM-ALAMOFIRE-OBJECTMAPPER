//
//  ObjectMapperDishLishModel.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/21/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import ObjectMapper

class ObjectMapperDishModel:  Mappable {
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
        id <- map["id"]
        title <- map["name"]
        shopName <- map["shopname"]
        address <- map["address"]
        avatar <- map["avatar"]
    }
         
    

}
