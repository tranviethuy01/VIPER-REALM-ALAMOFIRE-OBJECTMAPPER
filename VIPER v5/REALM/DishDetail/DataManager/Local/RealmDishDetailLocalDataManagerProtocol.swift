//
//  RealmLocalDataManagerProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol RealmDishDetailLocalDataManagerProtocol: class {

    func initDishDetail(id : Int) -> RealmDishModel?

}
