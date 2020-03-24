//
//  DishModel.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//


import UIKit
//Dish model

struct Dish {
    var avatar : String!
    var title : String!
    var shopName : String!
    
    init (attribute: [String: String]) {
        self.avatar = attribute["avatar"]
        self.title = attribute["title"]
        self.shopName = attribute["shopName"]
    }
    
}
class DishData:NSObject {
    class func generateDataList() -> [[String: String]] {
        return [["avatar": "https://tranhuy.bachkhoasaigon.com/test/api/images/1.jpg","title": "Capuchino số 1" , "shopName" : "StarBuck Coffee"],["avatar": "https://tranhuy.bachkhoasaigon.com/test/api/images/2.jpg","title": "Capuchino số 2" , "shopName" : "StarCuck Coffee"],["avatar": "https://tranhuy.bachkhoasaigon.com/test/api/images/3.jpg","title": "Capuchino số 3" , "shopName" : "StarDuck Coffee"],["avatar": "https://tranhuy.bachkhoasaigon.com/test/api/images/4.jpg","title": "Capuchino số 4" , "shopName" : "StarEuck Coffee"],["avatar": "https://tranhuy.bachkhoasaigon.com/test/api/images/5.jpg","title": "Capuchino số 5" , "shopName" : "Lazava Coffee"],["avatar": "#","title": "Test món : lỗi" , "shopName" : "Shop : lỗi"]]
    }
    
}

