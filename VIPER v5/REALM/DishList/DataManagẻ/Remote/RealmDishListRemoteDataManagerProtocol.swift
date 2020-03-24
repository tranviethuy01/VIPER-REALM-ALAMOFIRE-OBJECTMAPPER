//
//  RealmDishListRemoteDataManagerProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift
protocol RealmDishListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler : RealmDishListRemoteDataManagerOutputProtocol? {get set}
    //func reloadDishList(code: String)
    func reloadDishList(id: Int)
    //func initDishList(id: Int) -> Results<RealmDishModel>?
    //func reloadCampaign(id: Int)
    
//    var remoteRequestHandler: EateryPromotionListRemoteDataManagerOutputProtocol? {get set}
//    func getEateryInfo(eateryId: Int, superCategory: Int)
//    func reloadPromotionList(eateryId: Int)
//    func reloadCampaignList(eateryId: Int)
//    func loadMore()
    
}


protocol RealmDishListRemoteDataManagerOutputProtocol: class {
    func reloadSuccess()
    func reloadFail()
    
    func reloadDishListSuccess()
    func reloadDishListFail()
    //func reloadSuccess()
    //func reloadFail()
    func loadMoreSuccess()
    func loadMoreFail()
    
}

//
//
//
//protocol PromotionDetailRemoteDataManagerInputProtocol: class {
//    var remoteRequestHandler: PromotionDetailRemoteDataManagerOutputProtocol? {get set}
//    func reloadPromotion(_ code: String)
//    func reloadCampaign(id: Int)
//}
//
//protocol PromotionDetailRemoteDataManagerOutputProtocol: class {
//    func reloadSuccess()
//    func reloadFail()
//}
//
