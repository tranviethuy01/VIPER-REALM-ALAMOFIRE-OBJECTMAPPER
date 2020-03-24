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
    //property
    var remoteRequestHandler: RealmDishListRemoteDataManagerOutputProtocol?
    //func
    func reloadDishList(id: Int) {
        //code lấy dữ liệu remote
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
                    
                case let .failure(error):
                    print (error)
                }
                           
            }
    }
    
    
    func reloadDishList(code: String) {
        //do sth here to get data
        //get data
        let url = RealmDishListConfig.dishListURL
//
        let accessToken = RealmDishListConfig.accessToken
        let headers: HTTPHeaders = [
            "X-Access-Token": accessToken,
            "Accept": "application/json"
        ]

        Alamofire.request(url, headers: headers).responseJSON { response in
            //
            
            switch response.result {
            case .success:
                //success
                let realm = try! Realm()
                let dish = RealmDishModel(JSONString: "sth")
                try! realm.write {
                    realm.add(dish!)
                }
                
                
            case let .failure(error):
                print ("GKDBUG >> error: \(error)")
            }
            
            
        }
      
        
    }
    

}

