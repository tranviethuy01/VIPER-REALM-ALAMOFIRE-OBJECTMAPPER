//
//  DishDetailInteractorProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol DishDetailInteractorInputProtocol: class {
    //property
    var presenter : DishDetailInteractorOutputProtocol? {get set}
    //func
    func initDishDetail()

}


protocol DishDetailInteractorOutputProtocol: class {

    func didInitDishDetail()

}
