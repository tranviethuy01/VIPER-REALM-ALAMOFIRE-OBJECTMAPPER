//
//  ObjectMapperDishListDataManager.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/22/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import Alamofire

class ObjectMapperDishListRemoteDataManager: ObjectMapperDishListRemoteDataManagerProtocol {
    func initDishList() {
        //
        
        print ("GKDEBUG >> RealmDishListRemoteDataManager >> initDishList")
            let url = RealmDishListConfig.dishListURL
            let accessToken = RealmDishListConfig.accessToken
            let headers: HTTPHeaders = [
                           "X-Access-Token": accessToken,
                           "Accept": "application/json"
            ]
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
            
            // convert String to NSData
            
            let jsonString : String = response.result.value as! String
            
            let dict = jsonString.toJSON() as? [String:AnyObject]
            
            do{
                
                
            }
            catch {
                
            }
            for item in dict! {
                
                
            }
                
                
                            
                               
                case let .failure(error):
                     
                    print ("GKDBUG >> Lỗi rồi, tạm bỏ qua khỏi xử lý nhé")
                }
                           
                           
        }
               
    }
    

}
