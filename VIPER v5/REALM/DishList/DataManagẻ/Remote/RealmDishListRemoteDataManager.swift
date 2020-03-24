//
//  RealmDishListRemoteDataManager.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//


import UIKit
import RealmSwift
import ObjectMapper
import Alamofire
//import SwiftyJSON

class RealmDishListRemoteDataManager: RealmDishListRemoteDataManagerInputProtocol {
    
    
    var remoteRequestHandler: RealmDishListRemoteDataManagerOutputProtocol?
    
    func reloadDishList(id: Int) {
        //code lấy dữ liệu remote
        print ("GKDEBUG >> RealmDishListRemoteDataManager >> initDishList")
        let url = RealmDishListConfig.dishListURL
        let accessToken = RealmDishListConfig.accessToken
        let headers: HTTPHeaders = [
            "X-Access-Token": accessToken,
             "Accept": "application/json"
        ]
        //        let headers = [
        //            "Content-Type" : "application/json; charset=utf-8"
        //        ];
                    
       
        Alamofire.request(url, method: .get, headers: headers).responseJSON{ response in
             
             switch response.result {
             case .success:
             
                let mapperObject = Mapper<BaseObject>().map(JSONObject: response.result.value)
                let mapperArr = Mapper<RealmDishModel>().mapArray(JSONObject: mapperObject?.data)
                let realm = try! Realm()
                for item in mapperArr! {
                    //lưu giá trị sử dụng realm
                    realm.safeWrite {
                       realm.add(item, update: .all)
                    }
                        
                }
                    
//                let allItem = realm.objects(RealmDishModel.self)
//
//                print("GKDEBUG >> reloadDishList(id: Int) >> allItem : \(allItem.count)")
//                print (allItem)
                
                    //zzzz
//                    let id : Int = 1113
//                    let localItem = realm.object(ofType: RealmDishModel.self, forPrimaryKey: id)
//
//                    let allItem = realm.objects(RealmDishModel.self)
                    
                    
                    
                case let .failure(error):
                    print (error)
                }
                           
                           
                }                
      
        
    }
    
    
    
    func reloadDishList(code: String) {
        //do sth here to get data
        //la la la
        
        //tiến hành lấy dữ liệu ở đây nhé ku
        
        //let url = RealmDishListConfig.dishListURL
        let url = "https://tranhuy.bachkhoasaigon.com/test/api/dishlist/"
        let accessToken = RealmDishListConfig.accessToken
        let headers: HTTPHeaders = [
            "X-Access-Token": accessToken,
            "Accept": "application/json"
        ]

        Alamofire.request(url, headers: headers).responseJSON { response in
            //
            
            switch response.result {
            case .success:
                //thành công
                let realm = try! Realm()
                
                let dish = RealmDishModel(JSONString: "sth")
                
                try! realm.write {
                    realm.add(dish!)
                }
                
                
            case let .failure(error):
                print ("GKDBUG >> Lỗi rồi")
            }
            
            
        }
      
        
    }
    

}

