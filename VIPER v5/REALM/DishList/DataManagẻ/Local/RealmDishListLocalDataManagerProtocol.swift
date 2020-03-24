
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

    func initDishList(id : Int) -> Results<RealmDishModel>
    
}
