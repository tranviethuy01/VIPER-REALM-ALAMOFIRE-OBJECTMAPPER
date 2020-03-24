//
//  BaseObject.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/22/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseObject: Mappable {
    var data :Any?
    var code : String?
    var message : String?
    
    required init?(map: Map) {
        //do sth
        
    }
    
    func mapping(map: Map) {
        //
        data <- map["data"]
        code <- map["code"]
        message <- map["message"]
    }
         
}
