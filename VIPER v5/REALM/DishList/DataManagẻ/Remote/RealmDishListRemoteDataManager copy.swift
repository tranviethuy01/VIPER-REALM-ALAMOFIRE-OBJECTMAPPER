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
import SwiftyJSON

class RealmDishListRemoteDataManager: RealmDishListRemoteDataManagerInputProtocol {
    
    
    
    var remoteRequestHandler: RealmDishListRemoteDataManagerOutputProtocol?
    
    func initDishList(code: String) -> Results<RealmDishModel>? {
        
        print ("GKDEBUG >> RealmDishListRemoteDataManager >> initDishList")
        let url = RealmDishListConfig.dishListURL
        let accessToken = RealmDishListConfig.accessToken
        let headers: HTTPHeaders = [
                   "X-Access-Token": accessToken,
                   "Accept": "application/json"
        ]
        
                
        //thí mẹ rồi, cái này trả về kết quả chậm
        Alamofire.request(url, headers: headers).responseJSON { response in
                   //
            print ("GKEBUG >> url \(url)")
            print ("GKDEBUG >> Gía trị trả về \(response)")
                   debugPrint(response)
                   
           switch response.result {
           case .success:
            //thành công, xử lý
            print ("GKDBUG >> Thành công initDishList")
            print (response)
            let realm = try! Realm()
            
            //objectmapper
//            var jsonArray: Array!
//            do {
//              jsonArray = try NSJSONSerialization.JSONObjectWithData(JSONData, options: NSJSONReadingOptions()) as? Array
//            } catch {
//              print(error)
//            }

            
                       
            
            
            var dishs = [RealmDishModel]()
            
            
            var jsonArray: Array!
            do {
              jsonArray = try NSJSONSerialization.JSONObjectWithData(JSONData, options: NSJSONReadingOptions()) as? Array
            } catch {
              print(error)
            }
            
            
            for json in jsonArray {
              if let item = json as? [String: AnyObject] {
                if let productJson = item["product"] as? [String: AnyObject],
                  product = Product(JSON: productJson)
                    dish
                  {
                    products.append(product)
                }
              }
            }
            
            
            let swiftyJsonVar = JSON(response.result.value!)
            
            if let resData = swiftyJsonVar["data"].arrayObject {
                var arrRes = resData as! [[String:AnyObject]]
                
                for item in arrRes {
                
                    print ("GKDEBUG >> Thử in giá trị item 0 \(item) và item.image \(item["countryCode"])")
                    print ("Tiến hành map")
                    
                    if let mapItem = Mapper<ObjectMapperDishLishModel>().map(JSON: item) {
                        print ("GKDEBUG >> Đây là 1 mapItem \(mapItem)")
                        print ("GKDEBUG >> thử test giá trị của mapItem này \(mapItem.address)")
                    
                    }
                }
                
                
            }
            
            
            if let data = swiftyJsonVar["data"].array {
                print ("GKDEBUG >> Gía trị data 1 \(data)")
                
                for json in data {
                    
                    print ("GKDEBUG >> Giá trị json 1 \(json)")
                  
                    if let item = Mapper<ObjectMapperDishLishModel>().map(JSONObject: json ) {
                        print ("GKDEBUG >> Giá trị được map : \(item)")
                    
                    }
                    
                    
                    if let item = json as? [String: AnyObject] {
                    
                    let dish = RealmDishModel(JSON: item)
                    print ("GKDEBUG >> object mapper dish \(dish)")
                      
                  }
                    else {
                        print ("GKDEBUG >> không chuyển qua json duoc")
                    
                    }
                }
                
                try! realm.safeWrite {
                                               
                        
                        
                }
            }
                       
                       
            let dish = RealmDishModel(JSONString: "cai ten nao do")
                       
                       try! realm.write {
                           //realm.add(dish)
                            
                       }
                       
                       
                       
                       
                       
                       DispatchQueue.main.async {
                           //
                        print ("GKDEBUG >> Chúng ta có kết quả cái gì đó ở đây")
                        print ("GKDEBUG >> Kết quả alamofire: \(response.result.value)")
                        
                        
                        print ("Giá trị swiftJson \(swiftyJsonVar)")
                        if let data = swiftyJsonVar["data"].array {
                        print ("GKDEBUG >> Gía trị data \(data)")
                            
                        
                        }
                        
                        print ("GKDEBUG >> Gía trị pagination 1 \(swiftyJsonVar["pagination"])")
                        
//                        if let pagination = swiftyJsonVar["pagination"] {
//                        print ("GKDEBUG >> Gía trị pagination 2 \(pagination)")
//                        print (pagination["prevUrl"])
                        
//                        }
                        
                        print ("Bắt đầu lấy code");
                        if let code = swiftyJsonVar["data"]["address"].string {
                            print (code)
                        }
                       }
                    
                       
        case let .failure(error):
             
            print ("GKDBUG >> Lỗi rồi, tạm bỏ qua khỏi xử lý nhé")
        }
                   
                   
        }
        
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
                print ("GKDBUG >> Thành công  reloadDishList")
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

