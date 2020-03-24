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
    
    
    
//    mutating func mapping(map: Map) {
//        //mapping
//    }
//
//    required init?(map: Map) {
//        //code init
//    }
//
//    //cun
//
//
//    dynamic var id = UUID().uuidString
//    dynamic var name = ""
//    dynamic var isCompleted = false
//    dynamic var title : String?
//    dynamic var shopName : String?
//    dynamic var avatar : String?
//
//    //primaryKey
//    override static func primaryKey() -> String? {
//        return RealmDishModel.Property.id.rawValue
//    }
//
//    convenience init(_ name: String) {
//        self.init()
//        self.name = name
//    }
    
    var id: String?
    var title : String?
    var shopName : String?
    var avatar : String?
    var address : String?
    
//    var roleId: Int?
//    var fullname: String?
//    var email: String?
//    var dateOfBirth: String?
//    var avatar: String?
//    var status: String?
//    var createdAt: String?
//    var updatedAt: String?
//    var phone: String?
    
//    required convenience init?(_ id: String) {
//        self.init()
//        self.id = id
//        //một số setup khác
//
//    }
    
//    override required init() {
//        fatalError("init() has not been implemented")
//    }
    
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
//    static func add(name: String, in realm: Realm = try! Realm()) -> RealmDishModel {
//        let dish = RealmDishModel(name)
//        try! realm.write {
//            realm.add(dish)
//        }
//        return dish
//    }
}

//
//class PromotionWrapper: Object {
//    @objc dynamic var id: String = ""
//    @objc dynamic var promotion: Promotion!
//    @objc dynamic var orderNumber: Int = 0
//    @objc dynamic var group: String = ""
//
//    override class func primaryKey() -> String? {
//        return "id"
//    }
//
//    required convenience init (group: String, promotion: Promotion, orderNumber: Int) {
//        self.init()
//        self.group = group
//        self.promotion = promotion
//        self.id = "\(group)-\(promotion.id)"
//        self.orderNumber = orderNumber
//    }
//
//
//}
//




//
//class RealmMovie: Object, Movie {
//
//    convenience required public init(copy obj: Movie) {
//        self.init()
//        id = obj.id
//        name = obj.name
//        year = obj.year
//        releaseDate = obj.releaseDate
//        grossing = obj.grossing
//        rating = obj.rating
//        _cast.append(contentsOf: obj.cast.map { RealmActor(copy: $0) })
//    }
//
//
//    dynamic var id = 0
//    dynamic var name = ""
//    dynamic var year = 0
//    dynamic var releaseDate = Date(timeIntervalSince1970: 0)
//    dynamic var grossing = 0
//    dynamic var rating = 0.0
//    var cast: [Actor] { return Array(_cast) }
//
//    var _cast = List<RealmActor>()
//
//
//    override class func primaryKey() -> String? {
//        return "id"
//    }
//}
//
