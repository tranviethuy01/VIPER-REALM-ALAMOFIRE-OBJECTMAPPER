//
//  DishListWireFrameProtocol.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol DishListWireFrameProtocol: class {
    
    //chúng ta bắt đầu khởi tạo Presenter ở đây nhé
    
    static func createDishListViewController (code : String) -> DishListViewController?
    
    
}
