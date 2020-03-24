
//
//  RealmDishListLocalDataManagerProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift
protocol RealmDishListLocalDataManagerProtocol: class {
//    func initDishList(code: String) -> Dish?
    //func initCampaign(id: Int) -> Campaign?
    
//    func initEateryInfo(id: Int) -> EateryInfo?
//    func initPromotionList(eateryId: Int) -> Results<PromotionWrapper>
//    func initCampaignList(eateryId: Int) -> Results<EateryCampaignWrapper>
    func initDishList(id : Int) -> Results<RealmDishModel>
    //func initDishList(id: Int) -> Results<RealmDishModel>?
}
