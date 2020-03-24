//
//  DishDetailWireFrameProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol DishDetailWireFrameProtocol: class {

    //main function
    static func createDishDetailViewController (code : String, avatar : String, title : String , shopName : String) -> DishDetailViewController?

}
