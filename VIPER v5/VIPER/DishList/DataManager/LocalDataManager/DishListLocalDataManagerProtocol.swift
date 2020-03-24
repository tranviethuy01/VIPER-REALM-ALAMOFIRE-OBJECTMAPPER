//
//  DishListLocalDataManagerProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/24/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol DishListLocalDataManagerProtocol: class {
     func initDishList(id : Int) -> [Dish]
    
}
