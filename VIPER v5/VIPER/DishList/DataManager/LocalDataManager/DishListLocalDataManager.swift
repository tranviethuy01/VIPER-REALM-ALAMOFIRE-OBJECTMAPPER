//
//  DishListLocalDataManager.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/24/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class DishListLocalDataManager: DishListLocalDataManagerProtocol {
    func initDishList(id: Int) -> [Dish] {
        //
        var dishList = [Dish]()
        //test only
        let allDishDetail = DishData.generateDataList()
        for item in allDishDetail {
            dishList.append(Dish(attribute: item))
        }
        //
        //print (dishList)
        return dishList
    }
    

}
