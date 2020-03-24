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
                    
                        
        //thí mẹ rồi, cái này trả về kết quả chậm
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
                    
                    //zzzz
                    let id : Int = 1113
                    let localItem = realm.object(ofType: RealmDishModel.self, forPrimaryKey: id)
                    print ("GKDEBUG >> Giá trị localItem : \(localItem)")
                    
                    let allItem = realm.objects(RealmDishModel.self)
                    
                    print("GKDEBUG >> allItem : \(allItem.count)")
                    print (allItem)
                    
                    
                    let mapperArr2 = Mapper<ObjectMapperDish2>().mapArray(JSONObject: response.result.value)
                    print ("GKDEBUG >> mapperArr2 \(mapperArr2)")
                    
                    
                    //chúng ta sẽ khôn trả về giá trị gì ở dây cả nhé, network bị chậm, chúng ta chỉ nên listen nó
                    
                    
                case let .failure(error):
                    print (error)
                }
                           
                           
                }
                
      
        
    }
    
    
    func initDishList(code: String) -> Results<RealmDishModel>? {
        
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
            
                
        //thí mẹ rồi, cái này trả về kết quả chậm
        Alamofire.request(url, method: .get, headers: headers).responseJSON{ response in
                   //
            //
           //if let dataList = value[Constant.kData] as? [[String: Any]]
            print ("GKEBUG >> url \(url)")
            print ("GKDEBUG >> Gía trị trả về \(response)")
            //debugPrint(response)
           print ("GKDEBUG >> response.result  : \(response.result )")
           switch response.result {
           case .success:
            //thành công, xử lý
            print ("GKDBUG >> Thành công initDishList")
            let mapperObject = Mapper<BaseObject>().map(JSONObject: response.result.value)
            
            
            print (mapperObject?.message)
            print (mapperObject?.data)
            
            let realm = try! Realm()
            
            
//            let mapperArr = Mapper<ObjectMapperDishModel>().mapArray(JSONObject: mapperObject?.data)
            let mapperArr = Mapper<RealmDishModel>().mapArray(JSONObject: mapperObject?.data)
//            print ("GKDEBUG >> mapperArr \(mapperArr?.count)")
//            print (mapperArr?[0].avatar)
            for item in mapperArr! {
//                print (item.address)
                
                //ghi xuống realm
                realm.safeWrite {
                    realm.add(item, update: .all)
                }
                
            }
            
            //zzzz
            let id : Int = 1113
            let localItem = realm.object(ofType: RealmDishModel.self, forPrimaryKey: id)
            print ("GKDEBUG >> Giá trị localItem : \(localItem)")
            
            let allItem = realm.objects(RealmDishModel.self)
            
            print("GKDEBUG >> allItem : \(allItem.count)")
            print (allItem)
            
            
            let mapperArr2 = Mapper<ObjectMapperDish2>().mapArray(JSONObject: response.result.value)
            print ("GKDEBUG >> mapperArr2 \(mapperArr2)")
            
            
            //chúng ta sẽ khôn trả về giá trị gì ở dây cả nhé, network bị chậm, chúng ta chỉ nên listen nó  
            
            
        case let .failure(error):
            print (error)
        }
                   
                   
        }
        
        //return sth her
        
        return nil
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
            print ("GKDEBUG >> Gía trị trả về \(response)")
            debugPrint(response)
            
            switch response.result {
            case .success:
                //thành công, xử lý
                print ("GKDBUG >> Thành công reloadDishList")
                print (response)
                let realm = try! Realm()
                
                let dish = RealmDishModel(JSONString: "cai ten nao do")
                
                try! realm.write {
                    realm.add(dish!)
                }
                
                
                
            case let .failure(error):
                print ("GKDBUG >> Lỗi rồi")
            }
            
            
        }
        
//        APIServiceManager.sharedInstance.getCampaignList(eateryId: eateryId) { [weak self] (errorPackage, responsePackage) in
//        if let responsePackage = responsePackage, let value = responsePackage.value as? [String:AnyObject] {
//            if let listDict = value["data"] as? [[String:AnyObject]] {
//                let realm = try! Realm()
//                realm.safeWrite {
//                    let tmpList = realm.objects(EateryCampaignWrapper.self).filter("group = %@", "eatery\(eateryId)")
//                    var existIdList: [String] = []
//                    var orderNumber: Int = 0
//                    for element in listDict {
//                        let map = Map.init(mappingType: MappingType.fromJSON, JSON: element)
//                        if let campaign = EateryCampaign.init(map: map) {
//                            campaign.mapping(map: map)
//                            let wrapper = EateryCampaignWrapper.init(group: "eatery\(eateryId)", campaign: campaign, orderNumber: orderNumber)
//                            orderNumber += 1
//                            existIdList.append(wrapper.id)
//                            realm.add(wrapper, update: Realm.UpdatePolicy.all)
//                        }
//                    }
//                    let notExistList = tmpList.filter(NSPredicate.init(format: "NOT (id IN %@)", existIdList))
//                    realm.delete(notExistList)
//                }
//                if let weakSelf = self, let remoteRequestHandler = weakSelf.remoteRequestHandler {
//                    remoteRequestHandler.reloadCampaignListSuccess()
//                    return
//                }
//            }
//        }
//        if let weakSelf = self, let remoteRequestHandler = weakSelf.remoteRequestHandler {
//            remoteRequestHandler.reloadCampaignListFail()
//        }
//        }
//
//
        
    }
    

}

